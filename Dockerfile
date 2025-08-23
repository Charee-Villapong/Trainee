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
RUN python3.10 -m pip install --upgrade pip

# 基本ライブラリ
RUN python3.10 -m pip install --no-cache-dir "pandas<2.0,>=1.3" "numpy==1.25.2" matplotlib seaborn "scikit-learn<1.2" jupyter ipykernel statsmodels ydata-profiling jpholiday plotly

# PyTorch 系
RUN python3.10 -m pip install --no-cache-dir torch==1.13.1 "pytorch-lightning<2.0.0,>=1.9.0" pytorch-forecasting==0.10.3

# Prophet
RUN python3.10 -m pip install --no-cache-dir prophet

COPY time-series-prediction /work/time-series-prediction

# ポートを公開
EXPOSE 8888

# Jupyter Notebook を起動
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]