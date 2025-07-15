# Build stage
FROM cirrusci/flutter:3.19.6 AS build
WORKDIR /app
COPY . .
RUN flutter build web --release

# Serve with nginx
FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"] 