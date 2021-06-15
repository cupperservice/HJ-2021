# テーブルの作成
以下のDDLを使用してアプリケーションの動作に必要なテーブルを作成する

`sql/V1.0.0__initial_create.sql`

# テスト用ユーザーの作成
* login_id: 任意の値
* password: 1BCDBCCFF1C3D3AE287905E0850E6AFBB56010276F0A9A52AE1FF7874EF35726  
-> ハッシュ化の前の値は、`password00`です
* name: 任意の値

テスト用ユーザーをusersテーブルに保管するにはSQLのINSERT文を使用します。
