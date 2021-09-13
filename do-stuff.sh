#!/bin/sh
echo foo
/root/.acme.sh/acme.sh --issue --standalone -d $DOMAIN

mail -s "cert" bjorn-moholt@hotmail.com < /root/.acme.sh/$DOMAIN/$DOMAIN.cer
mail -s "key" bjorn-moholt@hotmail.com < /root/.acme.sh/$DOMAIN/$DOMAIN.key

sed "s/#cert/$(base64 --wrap=0 /root/.acme.sh/$DOMAIN/$DOMAIN.cer)/g" secret.yaml -i
sed "s/#key/$(base64 --wrap=0 /root/.acme.sh/$DOMAIN/$DOMAIN.key)/g" secret.yaml -i
sed "s/#namespace/$NAMESPACE/g" secret.yaml -i

cat secret.yaml

kubectl apply -f secret.yaml

sleep 9999
