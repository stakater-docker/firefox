FROM stakater/java8-alpine:1.8.0_152

ARG DEBIAN_FRONTEND=noninteractive


#=========
# Firefox
#=========
RUN apk update && \
	apk add python py-pip curl unzip dbus-x11 ttf-freefont firefox-esr xvfb && \
	pip install selenium && \
	pip install pyvirtualdisplay


RUN curl https://github.com/mozilla/geckodriver/releases/download/v0.11.1/geckodriver-v0.11.1-linux64.tar.gz -O && \
	tar -zxvf geckodriver-v0.11.1-linux64.tar.gz && \
	mv ./geckodriver /usr/local/bin/ && \
	chmod a+x /usr/local/bin/geckodriver

COPY ./geckodriver /usr/local/bin/
RUN chmod a+x /usr/local/bin/geckodriver