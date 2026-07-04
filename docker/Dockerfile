FROM nginx:1.27-alpine-slim

# Mise à jour des paquets
RUN apk update && apk upgrade --no-cache

# On donne directement la propriété des dossiers à l'utilisateur 'nginx' qui existe déjà
RUN chown -R nginx:nginx /var/cache/nginx /var/run /var/log/nginx /usr/share/nginx/html

# Utilisation de l'utilisateur non-root
USER nginx

# Nettoyage
RUN rm -rf /usr/share/nginx/html/*

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
