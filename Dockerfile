FROM alpine:3.3

RUN apk add --no-cache curl git python gcc py-pip

RUN curl -O https://www.dash.org/binaries/dashcore-0.12.5.0-linux64.tar.gz
RUN tar xfvz dashcore-0.12.1.5-linux64.tar.gz
RUN cp dashcore-0.12.1/bin/dashd ./
RUN cp dashcore-0.12.1/bin/dash-cli ./
RUN rm -rf dashcore-0.12.1
RUN rm -rf dashcore-0.12.1.5-linux64.tar.gz

RUN git clone https://github.com/dashpay/sentinel.git
RUN ls -la
WORKDIR /sentinel
RUN pip install -r requirements.txt

WORKDIR /
COPY ./dash-masternode.sh ./
COPY ./dash-default.conf ./

EXPOSE 9999
VOLUME ["/root/.dashcore"]
ENTRYPOINT [ "bash", "dash-masternode.sh" ]
