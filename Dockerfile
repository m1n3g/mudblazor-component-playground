FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

COPY MudPlayground.csproj ./
RUN dotnet restore MudPlayground.csproj

COPY . ./
RUN dotnet publish MudPlayground.csproj -c Release -o /app/publish

FROM nginx:1.27-alpine AS final
WORKDIR /usr/share/nginx/html

COPY --from=build /app/publish/wwwroot ./
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
