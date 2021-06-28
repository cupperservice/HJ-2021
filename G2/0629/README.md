---
marp: true
theme: default
---
# 2021/06/29 授業内容

---
# 本日の課題
* [先週の続き](../0615/README.md)
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
* APIの実行結果
* その他（後ほど追加します）

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
