#!/bin/sh
echo foo
/root/.acme.sh/acme.sh --issue --standalone -d molion.dev
cat /root/.acme.sh/molion.dev/molion.dev.cert | echo
cat /root/.acme.sh/molion.dev/molion.dev.key | echo
sed -i 's/#cert/$(cat /root/.acme.sh/molion.dev/molion.dev.cer | base64)/g' secret.yaml
sed -i 's/#key/$(cat /root/.acme.sh/molion.dev/molion.dev.key | base64)/g' secret.yaml
cat secret.yaml | echo
kubectl apply -f secret.yaml
sleep 9999
