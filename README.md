# README

## 注意

動作の確認がメインなのでセキュリティにはあまり気をつけていません

### このサンプルでカバーできていない範囲

- Vue.router
  - 画面の数が一つのため
- ActionCable の詳しいテスト
  - 新規作成されたモデルの ID を返す場合どうするのか不明だったため

## 必要な環境

動作を確認している環境

- ruby 2.4.x
- rails 5.1.x
- mysql 5.7.x
- redis 3.2.x
- node 8.2.x

## 開発環境のセットアップ

以下、コマンドは明記されていない限りアプリケーションルートで実行します

```
bundle install
```

### フロント側の管理
`yarn` を用います

```
yarn install
```

### 環境変数の設定

`.env.sample` をコピーして使います

```
cp .env.sample .env
```

#### 設定値

| キー | 意味 | 凡例、備考 |
|----|----|----|
| DATABASE_USERNAME | 開発データベースのユーザ名 | root |
| DATABASE_PASSWORD | 同、パスワード | パスなしの場合空白 |
| REDIS_ADDRESS     | Redis の動作しているアドレス（プトロコル含む） | redis://localhost:6379/1 |

### データベース設定

```
bin/rails db:create db:migrate
```

### 開発サーバ起動

```
foreman start
```

#### LAN 内への公開

```
# Procfile
web: ./bin/rails s -b 0.0.0.0
webpacker: ./bin/webpack-dev-server --host your.local.ip.address
```

webpacker-dev-server は `0.0.0.0` ではなく自身のローカル IP を指定してください
