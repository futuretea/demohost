#!/bin/bash
export K3S_TOKEN=token
nohup k3s server --cluster-init > 1.log 2>&1 &
