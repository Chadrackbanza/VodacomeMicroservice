FROM nginx:1.27-alpine-slim

# Mise à jour des paquets
RUN apk update && apk upgrade --no-cache

# Création d'un utilisateur non-root et changement des permissions nécessaires
# Nginx a besoin d'écrire dans /var/cache/nginx, /var/run/ et /var/log/nginx
RUN addgroup -S nginx && adduser -S nginx -G nginx && \
    chown -R nginx:nginx /var/cache/nginx /var/run /var/log/nginx /usr/share/nginx/html

# Utilisation de l'utilisateur non-root
USER nginx

# Nettoyage
RUN rm -rf /usr/share/nginx/html/*

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
