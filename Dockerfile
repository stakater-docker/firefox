FROM stakater/java8-alpine:1.8.0_152

ARG DEBIAN_FRONTEND=noninteractive


#=========
# Firefox
#=========
RUN apk update && \
	apk add python py-pip curl unzip dbus-x11 ttf-freefont firefox-esr xvfb && \
	pip install selenium && \
	pip install pyvirtualdisplay

COPY ./geckodriver /usr/local/bin/
RUN chmod a+x /usr/local/bin/geckodriver