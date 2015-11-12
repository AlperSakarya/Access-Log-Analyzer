#!/bin/bash

echo "             === ACCESS LOG ANALYZER ===                      "
echo "                                                              "
echo "#   Please enter the access.log or access_log location       #"
echo "                                                              "
echo "#   Usually under /var/httpd/access_log for RedHat family    #
#   distributions. RHEL, CentOS, Fedora, Amazon Linux AMI    #"
echo "                                                              "
echo "#   Usually under /var/apache2/access.log for Debian family  #
#   distributions. Debian, Ubuntu, Mint..                    #"
echo "                                                              "
echo "ACCESS LOG FULL PATTH:"; read logfile
FILE=$logfile
echo "Access log that will be scanned is: $logfile"
sleep 2
if [ ! -f $logfile ]
    then
        echo " logfile can't be found:"
    else
        echo ""
                echo "Scanning.... Please do not stop the process..."
        echo""
                echo "Scan can go for 20+ min for 512MB file depending on your CPU speed... "
        echo""
                for ip in `cat $FILE |cut -d ' ' -f 1 |sort |uniq`;
                    do { COUNT=`grep ^$ip $FILE |wc -l`;
                    if [[ "$COUNT" -gt "500" ]]; then echo "$COUNT:   $ip";
                    fi }; done
        echo""
        echo "Scan has been finished"
fi