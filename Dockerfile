FROM rocker/geospatial:latest
RUN export DEBIAN_FRONTEND=noninteractive; apt-get -y update \
 && apt-get install -y pandoc 
RUN R -e "install.packages(c('tidyverse','wesanderson','lubridate','rmarkdown', 'stringr','tinytex','RefManageR'))"
RUN R -e "install.packages('FactoMineR')"
RUN R -e "install.packages(c('palmerpenguins'))"
RUN apt-get install -y --no-install-recommends unzip python3-pip dvipng pandoc wget git make python3-venv && \
    pip3 install  --break-system-packages jupyter jupyter-cache flatlatex matplotlib && \
    apt-get --purge -y remove texlive.\*-doc$ && \
    apt-get clean

RUN pip3 install --break-system-packages  numpy matplotlib pandas scikit-learn 