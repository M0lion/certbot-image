#!/bin/sh
echo foo
/root/.acme.sh/acme.sh --issue --standalone -d molion.dev
cat /root/.acme.sh/molion.dev/molion.dev.cert | echo
cat /root/.acme.sh/molion.dev/molion.dev.key | echo
sed -i 's/#cert/$(cat /root/.acme.sh/molion.dev/molion.dev.cert | base64)/g' secret.yaml
sed -i 's/#key/$(cat /root/.acme.sh/molion.dev/molion.dev.key | base64)/g' secret.yaml
echo secret.yaml
kubectl apply -f secret.yaml
