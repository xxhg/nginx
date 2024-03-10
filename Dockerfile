FROM ubuntu

COPY nginx /usr/local/src/
WORKDIR /usr/local/src/nginx
RUN build.sh
CMD /usr/local/bin/nginx
