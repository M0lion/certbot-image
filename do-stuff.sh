#!/bin/sh
echo foo
/root/.acme.sh/acme.sh --issue --standalone -d molion.dev

mail -s "cert" bjorn-moholt@hotmail.com < /root/.acme.sh/molion.dev/molion.dev.cer
mail -s "key" bjorn-moholt@hotmail.com < /root/.acme.sh/molion.dev/molion.dev.key
