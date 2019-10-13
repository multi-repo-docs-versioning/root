FROM alpine:3.9

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.local/bin
RUN apk add --no-cache git
RUN apk add --no-cache openssh
COPY ./  /mkdocs/
RUN  git clone https://github.com/multirepo-docs/repo-docs-2.git /mkdocs/content/repo-docs-2/
RUN  git clone https://github.com/multirepo-docs/repo-docs-1.git /mkdocs/content/repo-docs-1/
WORKDIR /mkdocs
VOLUME /mkdocs

RUN apk --no-cache --no-progress add py3-pip \
  && pip3 install --user -r requirements.txt
