FROM alpine:3.3

RUN apk add --no-cache curl git python gcc

COPY ./dash-masternode.sh ./

RUN curl -O https://www.dash.org/binaries/dashcore-0.12.1.0-linux64.tar.gz
RUN tar xfvz dashcore-0.12.1.0-linux64.tar.gz
RUN cp dashcore-0.12.1/bin/dashd ./
RUN cp dashcore-0.12.1/bin/dash-cli ./
RUN rm -rf dashcore-0.12.1
RUN rm -rf dashcore-0.12.1.0-linux64.tar.gz

RUN mkdir -p .dashcore
RUN cd .dashcore
RUN git clone https://github.com/dashpay/sentinel.git
RUN cd sentinel
RUN pip install virtualenv
RUN virtualenv venv
RUN venv/bin/pip install -r requirements.txt
RUN venv/bin/python bin/sentinel.py

EXPOSE
ENTRYPOINT ["mysql"]
