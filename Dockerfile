FROM centos:7

LABEL maintainer="Jaeyoung Chun (chunj@mskcc.org)" \
      version.deeptools="=3.1.3" \
      src.deeptools="https://github.com/deeptools/deepTools/releases/tag/3.1.3"

ENV MINICONDA_VERSION 4.5.1
ENV DEEPTOOLS_VERSION 3.1.3

ENV LC_ALL en_US.utf-8
ENV PATH="/opt/conda/bin:${PATH}"

RUN yum group install -y "Development Tools" \
    && cd \tmp \
    && curl -O https://repo.anaconda.com/miniconda/Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh \
    && bash Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh -b -p /opt/conda \
    && rm -rf Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh \
    && ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh \
    && echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc \
    && curl -O -L https://github.com/deeptools/deepTools/archive/${DEEPTOOLS_VERSION}.tar.gz \
    && tar xvzf ${DEEPTOOLS_VERSION}.tar.gz \
    && cd deepTools-${DEEPTOOLS_VERSION} \
    && yum install -y libcurl-devel zlib-devel \
    && pip install -r requirements.txt \
    && python setup.py install

CMD ["deeptools"]
