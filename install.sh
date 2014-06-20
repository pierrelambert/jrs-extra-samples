#!/bin/bash -e

BUILDOMATIC="/root/jasperreports-server-5.6-bin/buildomatic/"
TOMCATROOT="/var/lib/tomcat6/"

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

function MySQLRestore(){ # Import a mySQL dump for the specified sample (drops and recreates)
[ ! -d /jrs-extra-samples ] && echo "Samples repository not initialized, please 'init' first." && exit 1
[ ! -d /jrs-extra-samples/${1}/database/mysql/ ] && echo "No MySQL database to import" && return
echo "Importing ${1} MySQL database..."
for dump in /jrs-extra-samples/${1}/database/mysql/*.sql; do
    SCHEMA=`basename "$i" .sql`
    mysql -h localhost -uroot -proot < ${dump}
    echo "GRANT ALL PRIVILEGES ON \`${SCHEMA}\`.* TO 'jasperdb'@'%' IDENTIFIED BY 'password';" | mysql -h localhost -uroot -proot
    echo "GRANT ALL PRIVILEGES ON \`${SCHEMA}\`.* TO 'jasperdb'@'localhost' IDENTIFIED BY 'password';" | mysql -h localhost -uroot -proot
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
    mysql -h localhost -uroot -proot -P5029 < ${dump}
    echo "GRANT ALL PRIVILEGES ON \`${SCHEMA}\`.* TO 'jasperdb'@'%' IDENTIFIED BY 'password';" | mysql -h localhost -uroot -proot -P5029
    echo "GRANT ALL PRIVILEGES ON \`${SCHEMA}\`.* TO 'jasperdb'@'localhost' IDENTIFIED BY 'password';" | mysql -h localhost -uroot -proot -P5029 
done
}

function InstallFiles(){ # Installs files in tomcat's root
[ ! -d /jrs-extra-samples ] && echo "Samples repository not initialized, please 'init' first." && exit 1
[ ! -d /jrs-extra-samples/${1}/filesystem/ ] && echo "No file to install" && return
echo "Installing ${1} files..."
cd /jrs-extra-samples/${1}/filesystem
for file in `find ./ -type f`; do
    [ -f ${file} ] && RESTART=1
    rm -Rf ${TOMCATROOT}/${file}
    mkdir -p ${TOMCATROOT}/${file}
    rm -Rf ${TOMCATROOT}/${file}
    cp ${file} ${TOMCATROOT}/${file}
    chown tomcat6.tomcat6 ${TOMCATROOT}/${file}
done
}

function InstallPatch(){ # Try to patch files (no overwrite)
[ ! -d /jrs-extra-samples ] && echo "Samples repository not initialized, please 'init' first." && exit 1
[ ! -d /jrs-extra-samples/${1}/patch/ ] && echo "No file to patch" && return
echo "Installing ${1} patch"
cd /jrs-extra-samples/${1}/patch
for file in *.patch; do
    [ -f ${file} ] && RESTART=1
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
cp -r /jrs-extra-samples/${1}/scripts /
chmod -R +x /scripts
rm -f /root/lastvalues.sh
}

function Install(){ # Installs a specific sample (Repo, DB, ...)
[ ! -d /jrs-extra-samples ] && echo "Samples repository not initialized, please 'init' first." && exit 1
[ ! -d /jrs-extra-samples/${1}/ ] && echo "Sample ${1} not found" && return
RESTART=0
JRSImport  ${1}
MongoRestore ${1}
MySQLRestore ${1}
InfobrightRestore ${1}
PgRestore ${1}
InstallFiles ${1}
InstallPatch ${1}
InstallScripts ${1}
if [ $RESTART = 1 ]; then
    /etc/init.d/tomcat6 stop
    rm /etc/tomcat6/Catalina/localhost/*
    /etc/init.d/tomcat6 start
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
