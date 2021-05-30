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
## RDS
## Bastion Server
## Template Server
## Launch Template
## Auto Scaling Group
## Target Group
## Load Balancer
## Attacher
