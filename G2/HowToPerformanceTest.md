2021年　後期の課題

前期の演習で構築したシステムの性能検証を実施する。

# 実施内容
1. システムの限界性能を測る（必須）
2. ボトルネックとなっている箇所を見つける（必須）
3. ボトルネックの改善（オプション）
4. レポートの作成（必須）

## システムの限界性能を測る
### 性能測定シナリオの作成
* 以下のプロジェクトをForkしてシナリオを作成する
https://github.com/cupperservice/example-performance-test

### 測定
* 使用するツール: [gatling](https://gatling.io/)
* 測定の観点は以下
  * RPS: 一秒間に処理したリクエストの数
  * CPU利用率
  * EC2のインスタンス数を増やしてRPSの値が増えるか（スケールするか？）
* ユーザー数: 100ユーザー（usersテーブルに100ユーザー分用意する）

## ボトルネックとなっている箇所を見つける

## ボトルネックの改善（オプション）

## レポートの作成
レポートに記載する内容は以下
* 性能測定対象のシステム構成の説明
* 測定方法の説明
  * 流すシナリオの内容
  * 負荷のかけ方
* 測定結果
* 測定結果からシステムの限界値、ボトルネック等の説明
* ボトルネックの改善(オプション)
* 再測定結果(オプション)
* 再測定結果の考察(オプション)
