FROM nginx:latest
RUN apt-get update && apt-get install -y git
RUN rm -rf /usr/share/nginx/html/*
RUN git clone https://github.com/charu-kumar/test-jenkins.git /tmp/test-jenkins
RUN cp -r /tmp/test-jenkins/src/* /usr/share/nginx/html/
EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s \
    CMD curl --fail http://localhost || exit 1

