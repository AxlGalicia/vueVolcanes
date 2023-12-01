# etapa de compilación
FROM node:18.18.2-alpine3.17 as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
COPY ./src/assets/volcanes-api.png /app/dist/assets/volcanes-api.png
COPY ./src/assets/endpoints.png /app/dist/assets/endpoints.png
COPY ./src/assets/volcanes-endpoint.png /app/dist/assets/volcanes-endpoint.png
COPY ./src/assets/volcanes-usuario-endpoint.png /app/dist/assets/volcanes-usuario-endpoint.png

# etapa de producción
FROM nginx:1.25.3-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]