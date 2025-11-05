FROM nginx:alpine
LABEL maintainer="Nell"

# Copier tout le contenu du contexte dans Nginx
COPY . /usr/share/nginx/html

# Permissions pour Nginx
RUN chmod -R 755 /usr/share/nginx/html
RUN chown -R nginx:nginx /usr/share/nginx/html

# Exposer le port 80
EXPOSE 80

# Lancer Nginx
CMD ["nginx", "-g", "daemon off;"]
