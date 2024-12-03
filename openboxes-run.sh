#!/bin/bash

# Set JVM options for Grails
export GRAILS_OPTS="-XX:MaxPermSize=8192m -Xmx8192M -XX:-UseSplitVerifier -Xverify:none"


# Build the WAR file
grails --stacktrace --verbose -Dgrails.env=production war

