#!/bin/sh
# Scan de l'image
REPORT=$(docker scan --json registry.hub.docker.com/library/nginx:alpine)
# Extraction du nombre de vulnérabilités critiques
CRITICAL=$(echo "$REPORT" | jq '.vulnerabilities | map(select(.severity=="critical")) | length')
if [ "$CRITICAL" -gt 0 ]; then
  echo "Vulnérabilités critiques détectées : $CRITICAL"
  exit 1
else
  echo "Aucune vulnérabilité critique détectée."
  exit 0
fi