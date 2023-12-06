FROM ymuski/curl-http3:8.2.1

RUN apt update && apt install -y curl gnupg2 ca-certificates lsb-release debian-keyring
RUN curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
    | tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null && \
    gpg --dry-run --quiet --no-keyring --import --import-options import-show /usr/share/keyrings/nginx-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
    http://nginx.org/packages/debian `lsb_release -cs` nginx" \
    | tee /etc/apt/sources.list.d/nginx.list
RUN echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
    http://nginx.org/packages/mainline/debian `lsb_release -cs` nginx" \
    | tee /etc/apt/sources.list.d/nginx.list
RUN printf "%s\n" "Package: *" "Pin: origin nginx.org" "Pin: release o=nginx" \
    "Pin-Priority: 900" > /etc/apt/preferences.d/99nginx
RUN apt update && apt install -y nginx

RUN rm /var/log/nginx/access.log /var/log/nginx/error.log && \
    ln -s /dev/stdout /var/log/nginx/access.log && \
    ln -s /dev/stderr /var/log/nginx/error.log

CMD ["nginx", "-g", "daemon off;"]