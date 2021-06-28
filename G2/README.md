2021年度 前期 演習課題

# ネットワーク構成
* VPC

  ネットワーク(CIDR): 10.0.0.0/16

* ネットワーク構成

  |種類             |ネットワーク(CDIR)|Route Table|Availability Zone|
  |:---------------|:---------------|:----------|:----------------|
  |Public  subnet 1|10.0.10.0/24    |Public     |us-east-1a       |
  |Public  subnet 2|10.0.20.0/24    |Public     |us-east-1b       |
  |Private subnet 1|10.0.30.0/24    |Private    |us-east-1a       |
  |Private subnet 2|10.0.40.0/24    |Private    |us-east-1b       |

* ルートテーブル

  |種類    |Destination|Target          |Note|
  |:------|:----------|:---------------|:----------------------------------|
  |Public |10.0.0.0/16|local           |                                   |
  |       |0.0.0.0/0  |Interbet Gateway|                                   |
  |Private|10.0.0.0/16|local           |                                   |
  |       |0.0.0.0/0  |NAT Gateway     |今回は、TargetにInternet Gatewayを指定|

* セキュリティグループ(SG)

  |            |Type     |Protocol|Port Range|Source            |
  |:-----------|:---------|:-------|:---------|:----------------|
  |Bastion     |SSH       |TCP     |22        |0.0.0.0/0        |
  |Web         |HTTP      |TCP     |80        |0.0.0.0/0        |
  |APP         |SSH       |TCP     |22        |Bastion SG       |
  |            |Custom TCP|TCP     |8080      |Web SG           |
  |DB          |Custom TCP|TCP     |3306      |APP SG           |
  |Attacher    |SSH       |TCP     |22        |0.0.0.0/0        |

# Resources
* DynamoDB  
セッション情報を保管する
* RDS  
ユーザー情報、商品情報、などを保管する
* Bastion Server(EC2 Instance)  
EC2インスタンスの調査用。インターネットからSSH接続して使用する。
* Template Server(EC2 Instance)  
Applicationサーバのイメージを構築するために使用する。
* Application Server(EC2 Instance)  
Applicationサーバ、Auto Scaling GroupによってAuto Scalingする。
* Load Balancer  
Applicationサーバの生存監視及び、クライアントからのリクエストをApplicationサーバに振り分ける。
* Attacher(EC2 Instance)  
負荷試験に使用する

## DynamoDB
* テーブル名: 任意の値
* Primary key: sessionId
  * Type: String

## RDS
* Engine Type: Amazon Aurora
* Edition: Amazon Aurora with MySQL compatibility
* Capacity type: Provisioned
* Engine version: MySQL 5.7
* Templates: Production
* DB cluster Identifier: 任意の値
* Master username: 任意の値
* Master password: 任意の値
* DB instance class: db.r5.large
* Availability & durability: Create an Aurora Replica or Reader node in a different AZ
* VPC: 自身のVPC
* Subnet group: 複数のAZ & 複数のPrivateサブネットを指定したサブネットグループ
* Public access: No
* VPC security group: DB用のセキュリティグループを指定
* Database authentication: Password authentication

## Bastion Server
* Instance Type: t2.micro
* 配置先: Publicサブネット
* IAM role: なし

## Template Server
* Instance Type: m5.large
* 配置先: Privateサブネット
* インストールするソフトウェア
  * Java  
  [インストール手順](https://docs.aws.amazon.com/ja_jp/corretto/latest/corretto-8-ug/amazon-linux-install.html)
* IAM role: 以下のポリシーを適用したIAM role  
  AmazonDynamoDBFullAccess

## Launch Template
[参考](https://github.com/cupperservice/aws-tutorial)

## Auto Scaling Group
[参考](https://github.com/cupperservice/aws-tutorial)

## Target Group
[参考](https://github.com/cupperservice/aws-tutorial)

## Load Balancer
[参考](https://github.com/cupperservice/aws-tutorial)

## Attacher
