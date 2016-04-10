#!/bin/bash
/usr/bin/wget "10.127.0.10/sample-app/index.php" --timeout 30 -O - 2>/dev/null | grep -q "Hello World" || echo "The site is down" | /usr/bin/mail -s "Site is down" guzman.braso+sample-alert@batangamedia.com

