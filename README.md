# tekton-triggers playground with cdevents

## Getting Started

`./install.sh`

## Configuration

- `kubectl apply -f 01_namespace.yaml`
- `kubectl apply -f 02_rbac.yaml`
- `kubectl apply -f 03_triggers.yaml`
- `./03a_patch.sh` (optional to enable debug logging)
 
Verify the installation with:

`kubectl tree eventlistener webhook`

## Start the test

- `./04_send_test.sh`
