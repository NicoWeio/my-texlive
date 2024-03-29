FROM texlive/texlive:latest

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
