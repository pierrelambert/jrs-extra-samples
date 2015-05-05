#!/bin/bash 

echo 'JasperDemo Simple Package Management System v0.1'
echo 'F.Cerbelle (Tibco) <fcerbell@tibco.com>'
echo '© 2012 Tibco'
echo 

SPMSREPO="${HOME}/spms"
BUILDOMATIC="/root/jasperreports-server-5.6-bin/buildomatic/"
TOMCATROOT="/var/lib/tomcat7/"
HTTPDROOT="/var/www/"
SVNROOT="/var/lib/svn"
AUTHOREMAIL="fcerbell@tibco.com"
AUTHORNAME="François Cerbelle"

# Load configuration file if exists
CONFIGFILE=${HOME}/.spms
[ -f "${CONFIGFILE}" ] && . ${CONFIGFILE}

# Help
function help(){
    echo "Usage : $0 <command>"
    echo
    echo "SPMS commands :"
    echo "    config    : configuration management"
    echo "    init      : initialize spms and install its dependencies"
    echo "    reset     : reset SPMS configuration and remove the cache"
    echo
    echo "Source package commands :"
    echo "    create    : create a new source package from JRS/DB/LDAP/..."
    echo "    lint      : validate a source package content"
    echo "    build     : create a compiled package from a source package"
    echo
    echo "Binary packages cache commands :"
    echo "    download  : download the lastest binary package version from internet"
    echo "    clean     : Empty local cache"
    echo "    update    : update available package list"
    echo "    list      : list available packages"
    echo
    echo "Installation commands :"
    echo "    install   : install a compiled package"
    echo "    status    : list installed packages"
    echo "    check     : test if a package is installed"
    echo "    uninstall : uninstall an installed package"
    echo
}

# Interactive configuration
function config(){
    INTERACTIVE=0
    case "$1" in
        "edit")
            echo "Editing configuration..."
            INTERACTIVE=1
            ;;
        "show")
            echo "Displaying configuration..."
            INTERACTIVE=0
            ;;
        "check")
            echo "Checking configuration..."
            [ ! -d "${BUILDOMATIC}" ] && echo "Buildomatic folder not found (try $0 config edit)" && exit 1
            [ ! -d "${TOMCATROOT}" ] && echo "Tomcat home folder not found (try $0 config edit)" && exit 1
            [ ! -d "${HTTPDROOT}" ] && echo "HTTPd document root folder not found (try $0 config edit)" && exit 1
            [ ! -d "${SVNROOT}" ] && echo "Subversion (SVN) repository folder not found (try $0 config edit)" && exit 1
            return
            ;;
        *) 
            echo "Usage : $0 config <edit|show|check>"
            exit 0
            ;;
    esac
    echo -n "Package repo ";              if [ ${INTERACTIVE} -eq 1 ]; then echo -n "[$SPMSREPO] : ";     TMP=""; read TMP; [ -z "${TMP}" ] && SPMSREPO=${TMP};     else echo ": ${SPMSREPO}";  fi;
    echo -n "Buildomatic dir ";           if [ ${INTERACTIVE} -eq 1 ]; then echo -n "[$BUILDOMATIC] : ";  TMP=""; read TMP; [ -z "${TMP}" ] && BUILDOMATIC=${TMP};  else echo ": ${BUILDOMATIC}";  fi;
    echo -n "Tomcat dir ";                if [ ${INTERACTIVE} -eq 1 ]; then echo -n "[$TOMCATROOT] : ";   TMP=""; read TMP; [ -z "${TMP}" ] && TOMCATROOT=${TMP};   else echo ": ${TOMCATROOT}";   fi;
    echo -n "Httpd/PHP document root ";   if [ ${INTERACTIVE} -eq 1 ]; then echo -n "[$HTTPDROOT] : ";    TMP=""; read TMP; [ -z "${TMP}" ] && HTTPDROOT=${TMP};    else echo ": ${HTTPDROOT}";    fi;
    echo -n "SVN repository dir ";        if [ ${INTERACTIVE} -eq 1 ]; then echo -n "[$SVNROOT] : ";      TMP=""; read TMP; [ -z "${TMP}" ] && SVNROOT=${TMP};      else echo ": ${SVNROOT}";      fi;
    echo -n "Author email ";              if [ ${INTERACTIVE} -eq 1 ]; then echo -n "[$AUTHOREMAIL] : ";  TMP=""; read TMP; [ -z "${TMP}" ] && AUTHOREMAIL=${TMP};  else echo ": ${AUTHOREMAIL}";  fi;
    echo -n "Author name ";               if [ ${INTERACTIVE} -eq 1 ]; then echo -n "[$AUTHORNAME] : ";   TMP=""; read TMP; [ -z "${TMP}" ] && AUTHORNAME=${TMP};   else echo ": ${AUTHORNAME}";   fi;

    # Save actual config to file
    cat > ${CONFIGFILE} << EOF
# Default spms configuration values
SPMSREPO="${SPMSREPO}"
BUILDOMATIC="${BUILDOMATIC}"
TOMCATROOT="${TOMCATROOT}"
HTTPDROOT="${HTTPDROOT}"
SVNROOT="${SVNROOT}"
AUTHOREMAIL="${AUTHOREMAIL}"
AUTHORNAME="${AUTHORNAME}"
EOF
}

# Install SPMS dependencies
function init(){
    echo "Initializing SPMS framework..."
    aptitude -y update \
        aptitude -y safe-upgrade \
        && aptitude -y dist-upgrade \
        && aptitude -y full-upgrade \
        && aptitude -y install zip \
        && aptitude -y clean \
        && aptitude -y purge ~c
}

# Reset SPMS configuration and cache
function reset(){
    echo "Resetting SPMS framework..."
    clean
    rm -f "${CONFIGFILE}"
}

# Create a new source package from an intalled sample
# Create the folder structure,
# dump the databases (Infobright, MySQL, PostgreSQL, MongoDB, LDAP, ...)
# Export the repositories (JRS, JETL...)
function create(){
    [ -z "$1" ] && echo "Usage : $0 create <packagename>" && exit
    echo "Creating new package..."
    PACKAGENAME=${1##*/}
    # Create the folder structure
    [ -d "${PACKAGENAME}" ] && echo "Package folder already exists" && exit
    mkdir ${PACKAGENAME}
    mkdir -p ${PACKAGENAME}/{infobright,mysql,postgresql,mongodb,ldap}
    mkdir -p ${PACKAGENAME}/{TOMCATROOT,HTTPDROOT}
    mkdir -p ${PACKAGENAME}/patch
    mkdir -p ${PACKAGENAME}/scripts/{early.d,late.d}
    mkdir -p ${PACKAGENAME}/{JRS,JETL,SVN}
    mkdir -p ${PACKAGENAME}/java
}

# Check the source package against validation rules
# such as the DB dump format, the JRS repository folder
# structure, ...
function lint(){
    [ -z "$1" ] && echo "Usage : $0 lint <packagename>" && exit
    PACKAGENAME=${1##*/}
    echo "Checking source package validity..."
    echo "Source package validation not yet implemented"
}

# Build a binary package from a source package
# Compiles JAVA sources in JAR files with ant
# Copy the files in the binary structure
# Zip the binary package distribution
function build(){
    [ -z "$1" ] && echo "Usage : $0 build <packagename>" && exit
    echo "Creating a binary package in the local cache from a source package..."
    PACKAGENAME=${1##*/}

    # Check package
    lint ${PACKAGENAME}

    # Create a temporary working folder
    TMPDIR=`mktemp -d /tmp/spms.XXXX`

    # Create the binary package folder structure
    for i in `find "${PACKAGENAME}/" -type f`; do 
        mkdir -p "${TMPDIR}/$i"
        rmdir "${TMPDIR}/$i"
        cp "$i" "${TMPDIR}/$i"
    done

    CURDIR=`pwd`
    cd "${TMPDIR}/${PACKAGENAME}"

    # Compress database dumps
    for i in `find "infobright" -type f 2> /dev/null`; do [ "${i##*.}" != "gz" ] && gzip "$i"; done
    for i in `find "mysql" -type f 2> /dev/null`; do [ "${i##*.}" != "gz" ] && gzip "$i"; done
    for i in `find "postgresql" -type f 2> /dev/null`; do [ "${i##*.}" != "gz" ] && gzip "$i"; done
    for i in `find "ldap" -type f 2> /dev/null`; do [ "${i##*.}" != "gz" ] && gzip "$i"; done

    # Compile java, install in filesystems and remove sources
    if [ -d "java/" ]; then
        # Compile with ANT
        rm -Rf "java/"
    fi

    # Compress filesystems
    [ -d "TOMCATROOT" ] && zip -r TOMCATROOT.zip TOMCATROOT > /dev/null 2>&1 && rm -Rf TOMCATROOT
    [ -d "HTTPDROOT" ] && zip -r HTTPDROOT.zip HTTPDROOT > /dev/null 2>&1 && rm -Rf HTTPDROOT

    # Compress repositories
    [ -d "JRS" ] && zip -r JRS.zip JRS > /dev/null 2>&1 && rm -Rf JRS
    [ -d "JETL" ] && zip -r JETL.zip JETL > /dev/null 2>&1 && rm -Rf JETL
    [ -d "SVN" ] && zip -r SVN.zip SVN > /dev/null 2>&1 && rm -Rf SVN

    # Create the actual package
    cd "${TMPDIR}"
    zip -r "${PACKAGENAME}.zip" "${PACKAGENAME}" > /dev/null 2>&1 
    cd ${CURDIR}
    mv "${TMPDIR}/${PACKAGENAME}.zip" "${SPMSREPO}"

    # Remove the temporary working folder
    rm -Rf ${TMPDIR}

    update
}

# Download the lastest binary package version from internet in the local cache
function download(){
    echo "Downloading new binary packages from internet in the local cache..."
    echo "Binary packages download not yet implemented"
    update
}

# Clean the binary cache
function clean(){
    echo "Cleaning the binary package cache..."
    rm -f "${SPMSREPO}/"*.zip
    update
}

# Update the available package list
function update(){
    echo "Updating package list..."
    cd ${SPMSREPO}
    > "${SPMSREPO}/available.lst"
    for package in `find ./ -name "*.zip"`; do
        basename "${package}" .zip >> "${SPMSREPO}/available.lst"
    done
}

# List all the available (locally downloaded) binary packages
function list(){
    [ ! -f "${SPMSREPO}/package.lst" ] && update
    echo "Available binary packages in local cache :"
    cat "${SPMSREPO}/available.lst" | sed 's/^/  - /'
}

# Install a locally available binary package
function install(){
    [ -z "$1" ] && echo "Usage : $0 install <packagename>" && exit
    PACKAGENAME=${1##*/}

    check "${PACKAGENAME}"
    [ $? -eq 0 ] && echo "Package already installed" && exit

    [ ! -f "${SPMSREPO}/${PACKAGENAME}.zip" ] && echo "Package ${PACKAGENAME} not found (try $0 list) !" && exit 1

    echo "Installing a binary package from the local cache..."
    # Create a temporary working folder
    TMPDIR=`mktemp -d /tmp/spms.XXXX`

    CURDIR=`pwd`
    cd "${TMPDIR}"
    unzip "${SPMSREPO}/${PACKAGENAME}.zip" > /dev/null 2>&1
    cd "${TMPDIR}/${PACKAGENAME}"
    echo "JRS repository import not yet implemented"
    echo "MongoDB restore not yet implemented"
    echo "MySQL restore not yet implemented"
    echo "MySQL to Infobright not yet implemented"
    echo "PostgreSQL restore not yet implemented"
    echo "Infobright restore not yet implemented"
    echo "OpenLDAP restore not yet implemented"
    echo "Tomcat files installation not yet implemented"
    echo "HTTPd files installation not yet implemented"
    echo "Patches application not yet implemented"
    echo "early boot scripts installation not yet implemented"
    echo "late boot scripts installation not yet implemented"
    echo "JETL repository import not yet implemented"
    echo "Documentation installation not yet implemented"
    cd ${CURDIR}

    echo "${PACKAGENAME}" >> "${SPMSREPO}/installed.lst"

    # Remove the temporary working folder
    rm -Rf ${TMPDIR}
}

# List installed packages
function status(){
    echo "Listing all installed packages..."
    [ ! -f "${SPMSREPO}/package.lst" ] && return 0
    echo "Installed binary packages :"
    cat "${SPMSREPO}/installed.lst" | sed 's/^/  - /'
}

# Check binary package installation status
function check(){
    [ -z "$1" ] && echo "Usage : $0 check <packagename>" && exit
    PACKAGENAME=${1##*/}
    echo "Checking binary package installation status..."
    [ ! -f "${SPMSREPO}/installed.lst" ] && return 1
    cat "${SPMSREPO}/installed.lst" | grep "${PACKAGENAME}"
    return $?
}

# Uninstall an installed binary package
function uninstall(){
    [ -z "$1" ] && echo "Usage : $0 uninstall <packagename>" && exit
    PACKAGENAME=${1##*/}

    check "${PACKAGENAME}"
    [ $? -eq 1 ] && echo "Package already uninstalled" && exit

    echo "Uninstalling a binary package..."
    [ ! -f "${SPMSREPO}/${PACKAGENAME}.zip" ] && echo "Package ${PACKAGENAME} not found (try $0 list) !" && exit 1

    # Create a temporary working folder
    TMPDIR=`mktemp -d /tmp/spms.XXXX`

    CURDIR=`pwd`
    cd "${TMPDIR}"
    unzip "${SPMSREPO}/${PACKAGENAME}.zip"
    cd "${TMPDIR}/${PACKAGENAME}"
    echo "JRS repository deletion not yet implemented"
    echo "MongoDB deletion not yet implemented"
    echo "MySQL to Infobright not yet implemented"
    echo "MySQL deletion not yet implemented"
    echo "PostgreSQL deletion not yet implemented"
    echo "Infobright deletion not yet implemented"
    echo "OpenLDAP deletion not yet implemented"
    echo "Tomcat files deletion not yet implemented"
    echo "HTTPd files deletion not yet implemented"
    echo "Patches unapplication not yet implemented"
    echo "early boot scripts deletion not yet implemented"
    echo "late boot scripts deletion not yet implemented"
    echo "JETL repository deletion not yet implemented"
    echo "Documentation deletion not yet implemented"
    cd ${CURDIR}

    sed -i "s/^${PACKAGENAME}.*//" "${SPMSREPO}/installed.lst"

    # Remove the temporary working folder
    rm -Rf ${TMPDIR}
}

#config check
[ ! -d "${SPMSREPO}" ] && mkdir -p "${SPMSREPO}"

COMMAND=$1
shift || true

[ -z "${COMMAND}" ] && COMMAND="help" 
set | grep "^${COMMAND} ()" > /dev/null 2>&1
[ $? -eq 1 ] && COMMAND="help"
${COMMAND} $*

# vim:set ft=sh ts=4 sts=4 expandtab fcl=all nu ai et sw=4 tw=0 fdm=indent foldlevel=4:
