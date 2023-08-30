FROM node:16-alpine AS build
WORKDIR /app
COPY . .
RUN yarn install
RUN yarn build

# Tahap 2: Distroless Build
FROM gcr.io/distroless/nodejs:16
WORKDIR /app
COPY --from=build /app/dist /app
EXPOSE 3000
CMD [ "app.js" ]
