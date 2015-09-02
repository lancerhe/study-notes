    #!/bin/bash
    # @author lancer.he@gmail.com
    # @time   2015-08-26
    # @version 1.1
    ## Function: nginx log cut

    YESTERDAY=`date -d "yesterday" +"%Y%m%d"`
    LOG_PATH=/var/log/nginx
    NGINX_SBIN=/usr/local/nginx-1.4.4/sbin/nginx
    STATUS=0

    if [ ! -f ${LOG_PATH}/${1} ]; then
            echo "$LOG_PATH/$1 file not found."
            exit
    fi

    if [ ! -d ${LOG_PATH}/backup ]; then
            mkdir ${LOG_PATH}/backup
    fi

    if [ ! -f ${LOG_PATH}/backup/${1}.${YESTERDAY} ]
            then
            /bin/mv ${LOG_PATH}/${1} ${LOG_PATH}/backup/${1}.${YESTERDAY}
            if [ $? != 0 ];then
                    STATUS=1
            fi
    else
            STATUS=1
            echo "$YESTERDAY access log already cut!" >> /tmp/nginx-divisionlog
    fi

    if [ ${STATUS} == 0 ];then
            $NGINX_SBIN -s reload
            echo "$YESTERDAY log cut finish!" >> /tmp/nginx-divisionlog
    else
            echo "$YESTERDAY log cut error !" >> /tmp/nginx-divisionlog
    fi
