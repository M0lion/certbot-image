#!/bin/sh
/root/.acme.sh/acme.sh --issue --standalone -d molion.dev
sed -i 's/#cert/$(cat /root/.acme.sh/molion.dev/molion.dev.cert)/g' secret.yaml
sed -i 's/#key/$(cat /root/.acme.sh/molion.dev/molion.dev.key)/g' secret.yaml
echo secret.yaml
kubectl apply -f secret.yaml
