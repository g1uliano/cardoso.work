#!/usr/bin/env bash
# Verificação estática do site: links locais, peso das imagens, regras do _redirects.
set -u
cd "$(dirname "$0")/.."
fail=0

for p in index.html 404.html; do
  [[ -f $p ]] || { echo "FALTA: $p"; fail=1; continue; }
  # src/href/content locais, incluindo URLs absolutas de https://cardoso.work/
  broken=$(grep -oE '(src|href|content)="[^"]+"' "$p" | sed -E 's/^[a-z]+="//; s/"$//; s#^https://cardoso\.work/#/#' |
    grep -E '^(/|[a-zA-Z0-9_-]+[./])' | grep -vE '^(https?:|mailto:|#|data:)|^//|^width=' |
    grep -E '^/|\.[a-z]+$' | sed 's/[?#].*//' | sort -u |
    while read -r ref; do
      f="${ref#/}"; [[ -z $f ]] && f=index.html
      [[ -e $f ]] || echo "LINK QUEBRADO em $p: $ref"
    done)
  [[ -n $broken ]] && { echo "$broken"; fail=1; }
done

while IFS= read -r img; do
  size=$(stat -c %s "$img")
  (( size > 204800 )) && { echo "IMAGEM > 200 KB: $img ($size bytes)"; fail=1; }
done < <(find images/apps images/og.jpg -type f 2>/dev/null)

# Regra do _redirects sem coringa apontando para arquivo inexistente = regra morta
while read -r from _; do
  [[ -z $from || $from == *'*'* ]] && continue
  [[ -e ${from#/} ]] || { echo "_redirects: $from não existe"; fail=1; }
done < _redirects

(( fail )) && { echo "check: FALHOU"; exit 1; }
echo "check: ok"
