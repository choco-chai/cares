## アプリケーション名
Cares

## アプリケーション概要
家族やホームヘルパー等複数の介護者から介護を受けている人に対し行ったケアの内容を投稿し、
関わっている介護者全員でその内容を共有し、コメントも書き込める連絡ノートのような役割をするアプリケーション

## URL
https://cares-30453.herokuapp.com/

## テスト用アカウント
Email:sample123@sample.com
Password:aaa222

## 利用方法
1. ユーザー登録をし、初回はケアの対象者を登録する
1. その後、ケアを受ける人(利用者)の専用ページへ遷移してケアの内容を投稿する
1. ケア内容の詳細表示ページにて編集、削除、コメント投稿をすることができる
1. ケア終了となった利用者の情報を削除することもできる

## 目指した課題解決
- PCの操作に不慣れな人は「手書きのノートの方が楽」という先入観が強い
- ブラウザ画面は文字がちらついて見辛い(年配の方に多い意見)
- 機能が多いと操作が難しく感じる(何のボタンがどこにあるかわからない、誤って書いたものを消してしまうことが怖い)

↓

- デザインは見やすくシンプルに、文字を大きめに表示させる
- ユーザーは女性が多いことが予想されるのでフロント部分は優しい色使いにする
- 誤ってデータを削除することがないよう、削除確認ダイアログを表示させる

## 洗い出した要件定義
1. ユーザー登録機能
1. ケア利用者登録、削除機能
1. ケア内容登録、編集、削除機能
1. コメント投稿、削除機能
1. 複数枚画像投稿機能
1. 画像投稿前にプレビュー画面表示
1. 画像保存先をAmazon S3に設定
1. 入力に不備があった場合日本語でエラーメッセージを表示する
1. 削除ボタン押下時確認ダイアログを表示する

## 実装した機能についてのGIFと説明
ユーザー登録
***
![Caresユーザー登録](https://user-images.githubusercontent.com/71584841/98647369-188eee00-2378-11eb-8a83-748959e597e0.gif)
- ユーザー名、メールアドレス、パスワードを入力して登録し、ログイン

ケアを受ける利用者を登録
***

- ケアを実施し、その記録を残したい利用者の名前を入力し、登録

ケア内容を投稿
***

- ケアの開始時刻、一覧表示画面でわかりやすいタイトル、実施内容の詳細を入力し、登録

ケア一覧画面、詳細画面でその日に行ったケアを確認
***

- ケアの内容が一覧表示される
- タイトルをクリックすると詳細画面が表示される

コメント投稿
***

- 詳細画面からコメントを投稿できる

## 実装予定の機能
- ヘルパーや看護師が医療用語を用いてケア内容を投稿した際など、単語の意味を調べられる検索フォームの設置
- 表示されている画像をクリックすると拡大できる機能を実装予定

## データベース設計
![Cares ER図](https://user-images.githubusercontent.com/71584841/98640866-293a6680-236e-11eb-8aa3-5b4d986f7d04.png)

## ローカルでの動作方法
% cd projects
% git clone https://github.com/choco-chai/cares
% cd cares
% bundle install
% yarn install 
% rails db:create
% rails db:migrate
% rails s