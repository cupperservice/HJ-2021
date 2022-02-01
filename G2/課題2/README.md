# 課題2
[2021年度 前期 課題](../README.md)の「Template Server」までを構築してください。

## 達成条件
Template ServerからAurora, DynamoDBにアクセスできること。

---

## DynamoDB  
`aws dynamodb list-tables` で作成したテーブルが表示されればOK
[参照](https://docs.aws.amazon.com/cli/latest/reference/dynamodb/list-tables.html)

---

## Aurora
mysql -u`自身で設定したユーザーID` -p`自身で設定したパスワード` -h`Auroraのエンドポイント`  
を実行して以下のようにMySQLのコマンドプロンプトが表示されればOK

```
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 18
Server version: 5.7.12 MySQL Community Server (GPL)

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> 
```

[MySQL Clinet インストール手順](https://qiita.com/tamorieeeen/items/d9b2af588f1dfd43120d)
