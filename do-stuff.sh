#!/bin/sh
echo foo
/root/.acme.sh/acme.sh --issue --standalone -d molion.dev

mail -s "cert" bjorn-moholt@hotmail.com < /root/.acme.sh/molion.dev/molion.dev.cer
mail -s "key" bjorn-moholt@hotmail.com < /root/.acme.sh/molion.dev/molion.dev.key

sed "s/#cert/$(base64 --wrap=0 /root/.acme.sh/molion.dev/molion.dev.cer)/g" secret.yaml -i
sed "s/#key/$(base64 --wrap=0 /root/.acme.sh/molion.dev/molion.dev.key)/g" secret.yaml -i

cat secret.yaml

kubectl apply -f secret.yaml

sleep 9999
