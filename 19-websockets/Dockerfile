FROM scottw/alpine-perl

WORKDIR /app
COPY cpanfile cpanfile.snapshot /app/
RUN apk update && cpanm --installdeps --notest .
COPY exam.pl /app/

EXPOSE 8080
ENV MOJO_MODE=production
ENV MOJO_LOG_LEVEL=debug
ENTRYPOINT ["./exam.pl", "daemon", "-l", "http://*:8080"]
