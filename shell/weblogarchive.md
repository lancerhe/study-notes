    #!/bin/bash

    PATH_HTML='/home/html'
    PROJECT=$1
    YESTERDAY=`date -d "yesterday" +"%Y%m/%d"`
    PATH_PROJECT=$PATH_HTML/$PROJECT
    PATH_LOG=$PATH_PROJECT/log
    PATH_LOG_YESTERDAY=$PATH_LOG/$YESTERDAY
    PATH_BACKUP=/var/log/application

    if [ ! $PROJECT ]; then
            echo "Please type in project."
            exit
    fi

    if [ ! -d $PATH_PROJECT ]; then
            echo "Project folder [$PATH_PROJECT] not found."
            exit
    fi

    if [ ! -d $PATH_LOG_YESTERDAY ]; then
            echo "Yesterday log folder [$PATH_LOG_YESTERDAY] not found."
            exit
    fi

    FILE_TMPNAME=/tmp/$PROJECT-log.tar.gz

    if [ ! -d $PATH_BACKUP ]; then
            mkdir $PATH_BACKUP
    fi

    DATEFORMAT=`date -d "yesterday" +"%Y%m%d"`
    cd $PATH_LOG_YESTERDAY && /bin/tar zcf $PATH_BACKUP/$PROJECT.tar.gz.$DATEFORMAT *
