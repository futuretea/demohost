#!/bin/bash
export K3S_TOKEN=token
export K3S_URL=https://10.5.2.11:6443
nohup k3s server > 2.log 2>&1 &
