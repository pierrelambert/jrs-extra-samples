#!/bin/bash -e

BUILDOMATIC="/root/jasperreports-server-6.1.0-bin/buildomatic/"
TOMCATROOT="/var/lib/tomcat7/"
HTTPDROOT="/var/www/"

function Init(){ # Initializes the samples repository
aptitude -y update \
	aptitude -y safe-upgrade \
	&& aptitude -y dist-upgrade \
	&& aptitude -y full-upgrade \
	&& aptitude -y install git \
	&& aptitude -y clean \
	&& aptitude -y purge ~c
[ ! -d /jrs-extra-samples ] && git clone https://github.com/ernestoongaro/jrs-extra-samples.git /jrs-extra-samples
}

function Update(){ # Updates the local samples repository (no upgrade)
[ ! -d /jrs-extra-samples ] && echo "Samples repository not initialized, please 'init' first." && exit 1
cd /jrs-extra-samples
git pull
echo WARNING : The package file were updated to the latest revision which might not be compatible with 
echo           the versions of the software installed here.
}

function List(){ # Lists available samples
[ ! -d /jrs-extra-samples ] && echo "Samples repository not initialized, please 'init' first." && exit 1
cd /jrs-extra-samples
for package in `find . -maxdepth 1 -type d | egrep -v '.git|^.$' | cut -d/ -f2-`; do
	echo ${package}
done
}

function JRSImport(){ # Imports JRS repository for the specified sample (with update option)
[ ! -d /jrs-extra-samples ] && echo "Samples repository not initialized, please 'init' first." && exit 1
[ ! -x ${BUILDOMATIC}/js-import.sh ] && echo "js-import script not found, edit configuration in ${0}." && exit 1
[ ! -d /jrs-extra-samples/${1}/repository ] && echo "No repository to import" && return
echo "Importing ${1} repository..."
cd ${BUILDOMATIC}
./js-import.sh --update --input-dir /jrs-extra-samples/${1}/repository
}

function MongoRestore(){ # Imports MondoDB DB for the specified sample (drops and recreates)
[ ! -d /jrs-extra-samples ] && echo "Samples repository not initialized, please 'init' first." && exit 1
[ ! -d /jrs-extra-samples/${1}/database/mongodb/ ] && echo "No MongoDB database to import" && return
echo "Importing ${1} MongoDB database..."
mongorestore --drop /jrs-extra-samples/${1}/database/mongodb/
}

function SyncInfobright(){ # Makes a copy of a MySQL Schema to a Bighthouse schema
    echo "Importing ${1} MySQL database in Infobright, too..."
    db=${1}
    [ -d /tmp/ibsync/${db} ] && rm -Rf /tmp/ibsync/${db}
    mkdir -p /tmp/ibsync/${db}
    chmod 777 /tmp/ibsync/${db}
    cd /tmp/ibsync/${db}

    echo "DROP DATABASE ${db};" | mysql-ib -proot || true
    echo "CREATE DATABASE ${db};" | mysql-ib -proot
    mysqldump -proot --skip-add-drop-table --no-data ${db} \
        | sed 's#/\*[^*]*\*/##;s/^;//' \
        | grep -v -- -- \
        | sed ':a;N;$!ba;s/,\n  \(UNIQUE \)\?KEY \+[^ ]\+ \+([^)]\+)//g' \
        | sed ':a;N;$!ba;s/,\n  PRIMARY KEY \+([^)]\+)//g' \
        | sed 's/ AUTO_INCREMENT\(=[0-9]\+\)\?//' \
        | sed 's/ decimal(\([0-9]\+\),\([0-9]\+\))/ dec(18,\2)/' \
        | sed 's/ENGINE=MyISAM//' \
        | tee /tmp/ibsync/${db}/${db}.sql \
        | mysql-ib -proot ${db}
    mysqldump -proot --tab=/tmp/ibsync/${db} --fields-terminated-by ';' --fields-optionally-enclosed-by '"' ${db}
    for data in *.txt; do 
        sed -i 's/\\"//g' ${data}
        echo "LOAD DATA INFILE '`pwd`/${data}' INTO TABLE \``basename ${data} .txt`\` FIELDS TERMINATED BY ';';" | mysql-ib -proot ${db}
    done
    cd /root
    rm -Rf /tmp/ibsync/${db}
    echo 'GRANT ALL PRIVILEGES ON *.* TO jasperdb@"%" IDENTIFIED BY "password"'  | mysql-ib -proot
    echo 'GRANT ALL PRIVILEGES ON *.* TO jasperdb@"localhost" IDENTIFIED BY "password"'  | mysql-ib -proot
    echo 'GRANT ALL PRIVILEGES ON *.* TO jasperdb@"127.0.0.1" IDENTIFIED BY "password"'  | mysql-ib -proot
    echo 'GRANT ALL PRIVILEGES ON *.* TO jasperdb@"'${GUEST}'" IDENTIFIED BY "password"'  | mysql-ib -proot
}

function MySQLRestore(){ # Import a mySQL dump for the specified sample (drops and recreates)
[ ! -d /jrs-extra-samples ] && echo "Samples repository not initialized, please 'init' first." && exit 1
[ ! -d /jrs-extra-samples/${1}/database/mysql/ ] && echo "No MySQL database to import" && return
echo "Importing ${1} MySQL database..."
for dump in /jrs-extra-samples/${1}/database/mysql/*.sql; do
    if [ -f ${dump} ]; then
        SCHEMA=`basename "$dump" .sql`
        cat ${dump} | mysql -h localhost -uroot -proot
        echo "GRANT ALL PRIVILEGES ON \`${SCHEMA}\`.* TO 'jasperdb'@'%' IDENTIFIED BY 'password';" | mysql -h localhost -uroot -proot
        echo "GRANT ALL PRIVILEGES ON \`${SCHEMA}\`.* TO 'jasperdb'@'localhost' IDENTIFIED BY 'password';" | mysql -h localhost -uroot -proot
        SyncInfobright ${SCHEMA}
    fi
done
for dump in /jrs-extra-samples/${1}/database/mysql/*.sql.gz; do
    if [ -f ${dump} ]; then
        SCHEMA=`basename "$dump" .sql.gz`
        zcat ${dump} | mysql -h localhost -uroot -proot
        echo "GRANT ALL PRIVILEGES ON \`${SCHEMA}\`.* TO 'jasperdb'@'%' IDENTIFIED BY 'password';" | mysql -h localhost -uroot -proot
        echo "GRANT ALL PRIVILEGES ON \`${SCHEMA}\`.* TO 'jasperdb'@'localhost' IDENTIFIED BY 'password';" | mysql -h localhost -uroot -proot
        SyncInfobright ${SCHEMA}
    fi
done
}

function PgRestore(){ # Import a PgSQL dump for the specified sample (drops and recreates)
[ ! -d /jrs-extra-samples ] && echo "Samples repository not initialized, please 'init' first." && exit 1
[ ! -d /jrs-extra-samples/${1}/database/postgresql/ ] && echo "No PgSQL database to import" && return
echo "Importing ${1} PgSQL database..."
for dump in /jrs-extra-samples/${1}/database/postgresql/*.sql; do
    if [ -f ${dump} ]; then
	    S=`basename "${dump}" .sql`
	    echo "DROP DATABASE ${S}" | su - postgres -c "psql"
	    echo "CREATE DATABASE ${S}" | su - postgres -c "psql"
	    cat ${dump} | su - postgres -c "psql ${S} "
    fi
done
for dump in /jrs-extra-samples/${1}/database/postgresql/*.sql.gz; do
    if [ -f ${dump} ]; then
	    S=`basename "${dump}" .sql.gz`
	    echo "DROP DATABASE ${S}" | su - postgres -c "psql"
	    echo "CREATE DATABASE ${S}" | su - postgres -c "psql"
	    zcat ${dump} | su - postgres -c "psql ${S} "
    fi
done
}

function InfobrightRestore(){ # Import a mySQL dump for the specified sample (drops and recreates)
[ ! -d /jrs-extra-samples ] && echo "Samples repository not initialized, please 'init' first." && exit 1
[ ! -d /jrs-extra-samples/${1}/database/infobright/ ] && echo "No Infobright database to import" && return
echo "Importing ${1} Infobright database..."
for dump in /jrs-extra-samples/${1}/database/infobright/*.sql; do
    SCHEMA=`basename "$i" .sql`
    cat ${dump} | mysql -h localhost -uroot -proot -P5029
    echo "GRANT ALL PRIVILEGES ON \`${SCHEMA}\`.* TO 'jasperdb'@'%' IDENTIFIED BY 'password';" | mysql -h localhost -uroot -proot -P5029
    echo "GRANT ALL PRIVILEGES ON \`${SCHEMA}\`.* TO 'jasperdb'@'localhost' IDENTIFIED BY 'password';" | mysql -h localhost -uroot -proot -P5029 
done
for dump in /jrs-extra-samples/${1}/database/infobright/*.sql.gz; do
    SCHEMA=`basename "$i" .sql.gz`
    zcat ${dump} | mysql -h localhost -uroot -proot -P5029
    echo "GRANT ALL PRIVILEGES ON \`${SCHEMA}\`.* TO 'jasperdb'@'%' IDENTIFIED BY 'password';" | mysql -h localhost -uroot -proot -P5029
    echo "GRANT ALL PRIVILEGES ON \`${SCHEMA}\`.* TO 'jasperdb'@'localhost' IDENTIFIED BY 'password';" | mysql -h localhost -uroot -proot -P5029 
done
}

function InstallFiles(){ # Installs files in tomcat's root
[ ! -d /jrs-extra-samples ] && echo "Samples repository not initialized, please 'init' first." && exit 1
[ ! -d /jrs-extra-samples/${1}/filesystem/ ] && echo "No file to install" && return
echo "Installing ${1} files..."
if [ -d /jrs-extra-samples/${1}/filesystem/TOMCATROOT ]; then
    TOMCATRESTART=1
    cd /jrs-extra-samples/${1}/filesystem/TOMCATROOT
    for file in `find ./ -type f`; do
        rm -Rf ${TOMCATROOT}/${file}
        mkdir -p ${TOMCATROOT}/${file}
        rm -Rf ${TOMCATROOT}/${file}
        cp ${file} ${TOMCATROOT}/${file}
        chown tomcat7.tomcat7 ${TOMCATROOT}/${file}
    done
fi
if [ -d /jrs-extra-samples/${1}/filesystem/HTTPDROOT ]; then
    cd /jrs-extra-samples/${1}/filesystem/HTTPDROOT
    for file in `find ./ -type f`; do
        rm -Rf ${HTTPDROOT}/${file}
        mkdir -p ${HTTPDROOT}/${file}
        rm -Rf ${HTTPDROOT}/${file}
        cp ${file} ${HTTPDROOT}/${file}
        chown www-data.www-data ${HTTPDROOT}/${file}
    done
fi
}

function InstallPatch(){ # Try to patch files (no overwrite)
[ ! -d /jrs-extra-samples ] && echo "Samples repository not initialized, please 'init' first." && exit 1
[ ! -d /jrs-extra-samples/${1}/patch/ ] && echo "No file to patch" && return
echo "Installing ${1} patch"
cd /jrs-extra-samples/${1}/patch
for file in *.patch; do
    TOMCATRESTART=1
    FOLDER=`echo ${file} | tr '_' '/' | sed 's~\.patch$~~'`
    cd ${FOLDER}
    patch -p0 < /jrs-extra-samples/${1}/patch/${file}
    cd -
done
}

function InstallScripts(){ # Installs Early/Late init scripts
[ ! -d /jrs-extra-samples ] && echo "Samples repository not initialized, please 'init' first." && exit 1
[ ! -d /jrs-extra-samples/${1}/scripts/ ] && echo "No scripts to install" && return
echo "Installing ${1} scripts"
REBOOT=1
cp -r /jrs-extra-samples/${1}/scripts /
chmod -R +x /scripts
}

function Install(){ # Installs a specific sample (Repo, DB, ...)
[ ! -d /jrs-extra-samples ] && echo "Samples repository not initialized, please 'init' first." && exit 1
[ ! -d /jrs-extra-samples/${1}/ ] && echo "Sample ${1} not found" && return
TOMCATRESTART=0
REBOOT=0
JRSImport  ${1}
MongoRestore ${1}
MySQLRestore ${1}
InfobrightRestore ${1}
PgRestore ${1}
InstallFiles ${1}
InstallPatch ${1}
InstallScripts ${1}
if [ $REBOOT = 1 ]; then
    rm -f /root/lastvalues.sh
    echo '!!! Need to reboot !!!'
fi
if [ $TOMCATRESTART = 1 ]; then
    echo '!!! Need to restart tomcat !!!'
    /etc/init.d/tomcat7 stop
    sleep 1
    sync
    rm -Rf /etc/tomcat7/Catalina/localhost/*
    sync
    sleep 1
    /etc/init.d/tomcat7 start
fi
}

function Usage(){ # Help message
echo "${0} <COMMAND> [OPTIONS]"
echo
echo "Available commands :"
grep ^function ${0} | sort | grep -v Usage | sed 's/^function \([^(){]\+\).*#\(.*\)/- \1 : \2/'
}

if [ $# -lt 2 ]; then
	Usage
fi

$*
