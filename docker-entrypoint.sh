#!/bin/bash

set -e

if [ -z "$GALERA_PORT_3306_TCP_ADDR" ]; then
	set -- "$@" --wsrep-new-cluster
else 
	set -- "$@" --wsrep-cluster-address=gcomm://$GALERA_PORT_3306_TCP_ADDR
fi

exec "$@"

