FROM ghcr.io/benjitrapp/boxed-kali:nightly

RUN DEBIAN_FRONTEND=noninteractive 
 RUN apt-get clean       

RUN apt install  wget ssh unzip -y > /dev/null 2>&1
ARG NGROK_AUTH_TOKEN
ENV SSH_PASS=${SSH_PASS}
ENV NGROK_AUTH_TOKEN=$NGROK_AUTH_TOKEN}
ENV NGROK_TIMEOUT=$NGROK_TIMEOUT}
# Download and unzip ngrok
RUN wget -O ngrok.zip  https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1
RUN unzip ngrok.zip

# Create shell script
RUN echo "./ngrok config add-authtoken ${AUTH_TOKEN} &&" >>/kali.sh
RUN echo "./ngrok tcp 22 &>/dev/null &" >>/kali.sh
‎

RUN service ssh  start
RUN chmod 755 kali.sh
# Expose port


# Create directory for SSH daemon's runtime files

RUN service ssh  start
RUN chmod 755 kali.sh
EXPOSE 22/tcp
COPY docker-entrypoint.sh /
EXPOSE 22/tcp
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["sleep", "infinity"]
