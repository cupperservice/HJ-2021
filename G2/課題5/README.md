---
marp: true
theme: default
---
# 課題5
Gatlingによる負荷試験は難しいため、レポートの提出のみとします。

---
# Gatling実行環境の構築
* [sdkman](https://sdkman.io/)インストール
* java 11インストール(sdk install java 11.0.11.j9-adpt)
* sbtインストール(sdk install sbt)

---
# シナリオ作成
* [リポジトリ](https://github.com/cupperservice/example-performance-test)をFork
* Forkしたプロジェクトをクローン
* シナリオを作成する

---
# 課題
Gatlingのシナリオを実行する
※ atOnceUsers(1)で実行する

## 期限
10/25(月) 17:00

## 提出物
シナリオの実行結果(target/gatlingの下に作成される)

---
# VPC EndpointでDynamoDBにアクセスする
EC2インスタンスからDynamoDBへのアクセスはVPC Endpointを使用するようにすること。

[参照](https://docs.aws.amazon.com/ja_jp/amazondynamodb/latest/developerguide/vpc-endpoints-dynamodb.html)

---
# VSCodeでEC2インスタンスに接続する
## 前提条件
EC2インスタンスにSSH接続できること（セキュリティグループ、Public IP）

## 手順
1. 左のメニューからVSCodeでRemote SSH Extensionをインストール
2. 左下のメニューからOpen SSH Configuration Fileを選択
3. 接続するEC2の情報を設定する
* 例
```
Host attacker
    HostName EC2のPublic IP
    User ec2-user
    IdentityFile 秘密鍵をフルパスで指定
```

---
# 95: 5でシナリオを実行する方法

```
    .randomSwitch(
      95.0  -> exec(メッセージを検索 * 10回),
      5.0   -> exec(メッセージを送信)
    ).exitHereIfFailed
```

## シナリオでループする方法
```
.repeat(10) {
        exec(メッセージを検索)
    }
```
