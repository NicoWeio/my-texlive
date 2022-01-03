FROM thomasweise/docker-texlive-full

# https://github.com/debuerreotype/docker-debian-artifacts/issues/66#issuecomment-476616579
RUN sed -i '/jessie-updates/d' /etc/apt/sources.list  # Now archived

RUN apt-get update && apt-get install -y \
    biber \
    dvipng \
    latexmk \
    make \
    python3-pip \
    python3-setuptools \
 && rm -rf /var/lib/apt/lists/*

RUN pip3 install \
     matplotlib \
     numpy \
     pandas \
     pint \
     scipy \
     uncertainties

ENV LANG=C.UTF-8 \
	SOURCE_DATE_EPOCH=0

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
