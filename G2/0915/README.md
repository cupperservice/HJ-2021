---
marp: true
theme: default
---
# 2021/09/15 授業内容

---
# 本日の課題
* [課題の続き](../0615/README.md)
* systemdによるアプリの自動起動
* オートスケールする構成の作成

## 期限
9/27(月) 17:00

---
# 達成条件
* ALBを経由してアプリのAPIが一通り動作すること
* Auto Scaling Groupの定義でEC2インスタンスの数を変更できること
* １つのEC2インスタンスでアプリケーションを停止して、EC2インスタンスが入れ替わること

---
# 提出物
* すべてのAPIの実行結果
* ターゲットグループの詳細画面のスクリーンショット

---
## systemdによるアプリの自動起動
[自動起動の設定](../HowToBuildApp.md)を参考に環境を構築する

---
## オートスケールする構成の作成
  以下の手順 7 - 10を参考にオートスケールする構成にする
  [手順](https://github.com/cupperservice/aws-tutorial)

作成するAWSのリソースは以下の通り
* Launch Template
* Auto Scaling Group
* Target Group
* Load Balancer

---
## MySQLサーバの作成
Auroraを使用するとクレジットを多く消費するので、代わりにMySQLサーバをたててください。

参考：
https://qiita.com/miriwo/items/eb09c065ee9bb7e8fe06
