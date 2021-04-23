#!/bin/ash -ex
PUBLIC_IP="$(curl -s ifconfig.me/ip)"

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
    name: home-public-ip
    namespace: flux-system
stringData:
    SECRET_PUBLIC_IP: ${PUBLIC_IP}
EOF

flux reconcile helmrelease ingress-nginx -n networking