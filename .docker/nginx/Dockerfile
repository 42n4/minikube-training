FROM node:9 as nodestage
ADD . /var/www/minikube.training
WORKDIR /var/www/minikube.training
RUN curl -o- -L https://yarnpkg.com/install.sh | bash
RUN /root/.yarn/bin/yarn install
RUN /root/.yarn/bin/yarn run encore production
RUN rm webpack.config.js
RUN rm package.json
RUN rm yarn.lock

FROM nginx:mainline
COPY --from=nodestage /var/www/minikube.training /tmp/www/minikube.training
RUN rm -rf /var/www && mkdir -p /var/www
RUN mv /tmp/www/minikube.training /var/www/minikube.training
RUN rm -rf /var/www/minikube.training/.docker
COPY .docker/nginx/minikube.training.nginx.conf /etc/nginx/conf.d/default.conf.template
COPY .docker/nginx/nginx-entrypoint.sh /usr/local/bin/nginx-entrypoint.sh
RUN rm -rf /etc/nginx/conf.d/default.conf
RUN chmod a+x /usr/local/bin/nginx-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/nginx-entrypoint.sh"]
CMD []
