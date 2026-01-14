FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY ./dist /app

WORKDIR /app

HEALTHCHECK --interval=30s --timeout=3s --retries=3 CMD curl -fsS http://127.0.0.1/ || exit 1
