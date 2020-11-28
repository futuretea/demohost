#!/bin/bash
kill $(pidof k3s-agent) >/dev/null 2>&1
kill $(pidof k3s-server) >/dev/null 2>&1
