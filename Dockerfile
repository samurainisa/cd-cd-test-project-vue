FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY ./dist /usr/share/nginx/html
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s --retries=3 CMD curl -fsS http://127.0.0.1/ || exit 1
