#!/bin/bash
set -e

trap appStop SIGINT SIGTERM

# Variables
SONAR_HOST=${SONAR_HOST:-localhost}
SONAR_PORT=${SONAR_PORT:-9000}

# Configure sonar-scanner.properties
sed -i 's|#sonar.host.url=http://localhost:9000|sonar.host.url=http://'"${SONAR_HOST}"':'"${SONAR_PORT}"'|g' /sonar-scanner-3.0.3.778/conf/sonar-scanner.properties
sed -i 's|#sonar|sonar|g' /sonar-scanner-3.0.3.778/conf/sonar-scanner.properties

appScan () {
  echo "Starting sonar-scanner..."
  set +e
  sonar-scanner
}

appHelp () {
  sonar-scanner -h
}

case "$1" in
  app:scan)
    appScan
    ;;
  app:help)
    appHelp
    ;;
  *)
    if [ -x $1 ]; then
      $1
    else
      prog=$(which $1)
      if [ -n "${prog}" ] ; then
        shift 1
        $prog $@
      else
        appHelp
      fi
    fi
    ;;
esac

exit 0
