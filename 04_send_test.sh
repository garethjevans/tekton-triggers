#!/bin/bash

set -euo pipefail

IP=$(kubectl get ingress webhook -n trigger-namespace -oyaml | yq '.status.loadBalancer.ingress[0].ip')

curl -v --data "@event.json" http://${IP}.nip.io

