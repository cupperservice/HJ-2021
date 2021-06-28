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
https://github.com/cupperservice/rest-sample-with-springboot-and-kotlin

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
`gradlew build -x test`

# アプリケーションの実行
gradleで実行する

実行例:
`gradlew bootRun`

# 自動起動の設定
1. ビルドして作成したJarファイルを以下に配置する
* 配置先: `/opt/mall/lib/mall.jar`
* 配置するJarファイル: `./build/libs/mall-0.0.1-SNAPSHOT.jar`

2. アプリ起動用シェルを以下に配置する
* 配置先: `/opt/mall/bin/start.sh`
* 配置するシェル: `shell/start.sh`

3. ユニットファイルを配置する
* 配置先: `/etc/systemd/system/mall.service`
* 配置するユニットファイル: `shell/mall.service`

4. アプリを起動&自動起動設定
`systemctl`コマンドを使用してアプリを起動&自動起動設定する。

# AMIの作成
アプリが正常に起動することを確認したらAMIを作成する。
