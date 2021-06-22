---
marp: true
theme: default
---
# 2021/06/15 授業内容

---

# 本日の課題
Template Server上に以下のアプリを構築してください。
https://github.com/cupperservice/mall-sample

### 注意
Rest APIの動作確認するためにTemplateServerのセキュリティグループは一時的にインターネットからアクセスできるようにする必要がある

## 達成条件
以下のAPIが正常に動作すること
* POST /v1/users/login
* POST /v1/tweet/

VSCore Rest Clientでの実行例
```
@target = http://3.239.42.136:8080

@loginId = sample@example.com
@password = password00

###
# @name login

POST {{target}}/v1/users/login
Content-Type: application/json

{
  "login_id":"{{loginId}}",
  "password":"{{password}}"
}

###

@token = {{login.response.body.$.token}}

POST {{target}}/v1/tweet/
Content-Type: application/json
Authorization: Bearer {{token}}

{
  "content": "aiueo #word1 kakikukeko #word2"
}
```

HTTPのテストができるツールの例  
以下から好きなものを選んで使用してください。
* curl
* VSCode Rest Client
* Chrome
* Postman

## 提出物
1. 達成条件に記載したAPIの実行結果
2. 以下のテーブルの内容
* tweet
* hash_tag

テーブルの内容は、SQLのSELECT文を使ってテーブルの内容を表示する。

# 期限
6/28(月) 17:00
