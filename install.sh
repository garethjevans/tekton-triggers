#!/bin/bash

set -euo pipefail

# nginx
kubectl apply --filename https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml --wait

sleep 60

# tekton and dependencies
kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml --wait
kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/release.yaml --wait
kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/interceptors.yaml --wait

# tasks
kubectl apply --filename https://raw.githubusercontent.com/tektoncd/catalog/main/task/git-clone/0.9/git-clone.yaml --wait
kubectl apply --filename https://raw.githubusercontent.com/tektoncd/catalog/main/task/maven/0.2/maven.yaml --wait
