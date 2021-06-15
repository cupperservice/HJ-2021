アプリケーションのインストール方法

# 前提条件
* Template ServerからDynamoDB, Auroraへ接続できること
* Java 8がインストール済みであること
* gitコマンドが利用できること
* Auroraに必要なテーブルとテストユーザーが作成済みであること

```
mysql> show tables;
+----------------+
| Tables_in_mall |
+----------------+
| hash_tag       |
| tweet          |
| users          |
+----------------+
3 rows in set (0.01 sec)
```

# Github
https://github.com/cupperservice/mall-sample

# アプリケーションのカスタマイズ
以下の情報を環境に合わせて設定する
* Auroraの接続情報
* DynamoDBの接続情報

```
spring:
  datasource:
    url: jdbc:mysql://xxx:3306/mall
    username: xxx
    password: xxxc

session:
  table_name: cupper-Session
```

## 設定ファイル
src/main/resources/application.yaml

# ビルド方法
gradleを使用してアプリケーションをビルドする

実行例:
`gradlew build`

# アプリケーションの実行
gradleで実行する

実行例:
`gradlew bootRun`
