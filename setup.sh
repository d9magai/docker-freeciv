#!/bin/bash
cd `dirname $0`

yum install -y expect which mariadb

curl -sLO http://svn.gna.org/svn/freeciv/tags/R${FREECIV_MAJOR_VERSION}_${FREECIV_MINOR_VERSION}_${FREECIV_TEENY_VERSION}/scripts/setup_auth_server.sh

chmod +x ./setup_auth_server.sh

./setup.exp

rm setup_auth_server.sh

