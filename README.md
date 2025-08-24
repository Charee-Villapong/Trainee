**プログラム概要**
### このプログラムは、某大手通信関連企業の株価データ (stock_price.csv) を用いた時系列予測モデルです。
1. ライブラリ: Prophet と PyTorch Forecasting(Temporal Fusion Transformer) の2つのモデルを使用します。
2. データ前処理: 今回の要件に合わせてデータを整形します。詳細の記載は割愛します。
3. モデルの学習と予測: データの分割、モデルの学習、予測、そしてMAPE（Mean Absolute Percentage Error）スコアによる予測精度の評価を行います。

### プログラムの実行方法
**注意：当プログラムはDockerfileを利用した仮想環境内でJupyterlabを通して実行されます**
Githubを通してローカルにダウンロードした際も仮想環境を立ち上げることで実行の環境は補償されています。

### 仮想環境の構築方法
1. Githubからローカルにリポジトリをclone
2. **Dockerfileのbuild**:必要なライブラリがすべて含まれたDockerイメージをビルド
3. **開発用コンテナの起動:**Jupyter Notebookの環境を構築したコンテナを起動
4. **Jupyter Notebookの実行:**ブラウザで表示されたURLにアクセスし、time-series-prediction.ipynb ファイルを開く

