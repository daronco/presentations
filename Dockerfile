FROM ubuntu:16.04

RUN apt-get -qqy update
RUN apt-get -qqy install git nodejs npm
RUN ln -s /usr/bin/nodejs /usr/bin/node
WORKDIR /opt

# Install reveal.js
RUN git clone https://github.com/hakimel/reveal.js.git presentation
WORKDIR /opt/presentation
RUN npm install -g grunt-cli
RUN npm install
RUN sed -i "s/port: port/port: port,\n\t\t\t\t\thostname: \'\'/g" Gruntfile.js

# # Install wetty
# RUN git clone https://github.com/krishnasrinivas/wetty
# WORKDIR /opt/presentation/wetty
# RUN npm install

# Add content
# ADD docker.css /opt/presentation/css/theme/docker.css
# ADD index.html /opt/presentation/index.html
# ADD images /opt/presentation/images/
# ADD slides /opt/presentation/slides/

# dumb-init
RUN apt-get install -y wget
RUN wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64
RUN chmod +x /usr/bin/dumb-init

WORKDIR /opt/presentation

EXPOSE 8000

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD [ "grunt", "serve" ]
