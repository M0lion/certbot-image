#!/bin/sh
echo foo
/root/.acme.sh/acme.sh --issue --standalone -d molion.dev
cat /root/.acme.sh/molion.dev/molion.dev.cert | echo
cat /root/.acme.sh/molion.dev/molion.dev.key | echo

CERT=cat /root/.acme.sh/molion.dev/molion.dev.cer | base64
KEY=cat /root/.acme.sh/molion.dev/molion.dev.key | base64

echo $CERT
echo $KEY

sed -i 's/#cert/$CERT/g' secret.yaml
sed -i 's/#key/$KEY/g' secret.yaml
cat secret.yaml | echo
kubectl apply -f secret.yaml
sleep 9999
