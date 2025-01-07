# Resmi bir Spark görüntüsünü temel al
FROM bitnami/spark:latest

# Jupyter'ı yüklemek için gerekli bağımlılıkları yükle
USER root
RUN apt-get update && apt-get install -y python3-pip python3-dev \
    && pip3 install --upgrade pip \
    && pip3 install jupyter pyspark

# Çalışma dizinini ayarla
WORKDIR /opt/spark

# Gerekli portları aç
EXPOSE 8888

# Jupyter Notebook'u başlatmak için komut
CMD ["python3", "-m", "jupyter", "notebook", "--ip=*","--port=8889", "--no-browser", "--allow-root"]
    