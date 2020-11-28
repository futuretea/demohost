#!/usr/bin/env bash
[[ -n $DEBUG ]] && set -x
set -eou pipefail

useage() {
    cat <<HELP
USAGE:
    install.sh ROLE
HELP
}

exit_err() {
    echo >&2 "${1}"
    exit 1
}

if [ $# -lt 1 ]; then
    useage
    exit 1
fi

ROLE=$1
cp -f bin/k3s /usr/local/bin
cp -f $ROLE/k3s.service /usr/lib/systemd/system
cp -f $ROLE/environment /etc/environment
systemctl daemon-reload
systemctl restart k3s

