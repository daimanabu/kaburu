# アプリケーション名
KABURU
# アプリケーション概要

ニュースの閲覧

記事投稿

記事に対してコメント

# URL

http://kaburu-news.com

# 利用方法

ログイン後、記事投稿をすることができる。

# 目指した課題解決

２点あります。

・人の悩み解決として。

株の情報特化のニュースサイトを構築しようと考えた。

類似サイトはいくらでもあるので、悩み解決としては薄いです。

より特定のジャンルで差別化を図るべきだが、現状はできていない。

・個人として

APIを使ってRailsでサイトを構築できるようになることで、今後類似のサイトを作ることができるようになる。

別の新しいジャンルや商品が出た時に経験が生かせる。

例えば新しいジャンル、商品特有の情報不足に対しそのニュースサイトを構築することで、

特定のジャンルの情報不足という悩み解決ができると私の経験上から考えられるので有益と考えます。

# 洗い出した要件

ユーザー管理機能

投稿機能

詳細表示機能

投稿編集機能

削除機能

コメント投稿機能

マイページ機能

エラー日本語化

単体テスト

プレビュー機能

NewsAPIの利用

Heroku導入

S3導入

EC2導入

自動デプロイ

独自ドメイン化

# 実装した機能についてのGIFと説明

トップページはNewsAPIを利用し、人気のあるビジネスニュースが反映される。

# 実装予定の機能

独自ドメインhttps化

# データベース設計
![er](https://user-images.githubusercontent.com/60860243/106858562-3664b880-6705-11eb-97fb-1bbacac9b330.png)

# ローカルでの動作方法

ruby 2.6.5

rails 6.0.0

以下からクローンする

% git clone https://github.com/daimanabu/kaburu.git

反映する

% bundle install

% yarn install

DBを作成

% rails db:create

% rails db:migrate

Railsを起動する

% rails s
