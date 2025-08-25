FROM ubuntu:22.04

# 作業ディレクトリ
WORKDIR /work

#必要なパッケージのインストール
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    software-properties-common \
    gfortran \
    libatlas-base-dev \
    liblapack-dev \
    libgfortran5 \
    python3.10-dev \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get install -y python3.10 python3.10-venv python3-pip \
    && rm -rf /var/lib/apt/lists/*

# pip アップデート
RUN pip install --upgrade pip

# requirements.txt をコピーして依存関係をインストール
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY time-series-prediction /work/time-series-prediction

# ポートを公開
EXPOSE 8888

# Jupyter Notebook を起動
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]