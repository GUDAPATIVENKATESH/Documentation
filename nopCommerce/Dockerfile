FROM ubuntu:20.04 as build
RUN apt-get update && \
    apt-get install unzip wget -y && \
    mkdir /NOP && cd /NOP && \
    wget https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.0/nopCommerce_4.60.0_NoSource_linux_x64.zip && \
    unzip nopCommerce_4.60.0_NoSource_linux_x64.zip

FROM mcr.microsoft.com/dotnet/aspnet:7.0 
COPY --from=build /NOP /NOP
EXPOSE 80
CMD ["dotnet","/NOP/NOP.web.dll","run","--server.urls=http://0.0.0.0:*"]

