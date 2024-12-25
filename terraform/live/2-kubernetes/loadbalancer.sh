#!/bin/bash

NGINX_INGRESS_REPO="https://helm.nginx.com/stable"
NGINX_INGRESS_NAME="nginx-ingress-tcp"

export KUBECONFIG=~/.kube/vkcloud_config

helm repo add nginx-stable $NGINX_INGRESS_REPO
helm repo update

if kubectl get namespace | grep -q nginx-ingress-tcp; then
  echo "Namespace nginx-ingress-tcp already exists, skipping helm install"
else
  helm install $NGINX_INGRESS_NAME nginx-stable/nginx-ingress \
    --set-string 'controller.config.entries.use-proxy-protocol=true' \
    --create-namespace \
    --namespace nginx-ingress-tcp
fi

