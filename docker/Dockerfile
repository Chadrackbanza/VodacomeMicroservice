FROM nginx:1.27-alpine-slim

# Mise à jour des dépôts et des paquets existants pour corriger les vulnérabilités connues
RUN apk update && apk upgrade --no-cache

# Nettoyage des fichiers inutiles pour réduire la surface d'attaque
RUN rm -rf /usr/share/nginx/html/*

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
