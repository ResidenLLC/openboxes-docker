#!/bin/bash

# Grails does not run without these JVM options
export GRAILS_OPTS="-XX:MaxPermSize=8192m -Xmx8192M -XX:-UseSplitVerifier -Xverify:none"

# Force Grails upgrade if application context is missing
if [ ! -f /app/web-app/WEB-INF/applicationContext.xml ]; then
   echo "Forcing grails upgrade"
   grails upgrade --force --stacktrace
fi

# Clear and verify npm cache
npm cache clean --force
npm cache verify
npm i -g npm@6.14.6
npm config set engine-strict true
npm i --no-package-lock --legacy-peer-deps --force --verbose --stacktrace --unsafe-perm

# Run the application in staging environment
#grails run-app --stacktrace
grails -Dgrails.env=production war
grails -Dgrails.env=production run-app --stacktrace



