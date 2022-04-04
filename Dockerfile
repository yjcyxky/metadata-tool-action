FROM openjdk:8u322-jre-buster

LABEL "name"="metadata-tool-action"
LABEL "maintainer"="Jingcheng Yang <yjcyxky@163.com>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="metadata-tool-action"
LABEL "com.github.actions.description"="GitHub actions for metadata tool."
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="blue"

RUN apt-get update \
    && apt install git bash wget

COPY entrypoint.sh /entrypoint.sh
RUN echo Download $(curl -s https://api.github.com/repos/yjcyxky/metadata-tool/releases/latest | grep browser_download_url | cut -d '"' -f 4)
RUN wget `curl -s https://api.github.com/repos/yjcyxky/metadata-tool/releases/latest | grep browser_download_url | cut -d '"' -f 4` --no-check-certificate -O /opt/metadata-tool.jar

ENTRYPOINT ["/entrypoint.sh"]
