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
 →デザインは見やすくシンプルに、文字を大きめに表示させ画像も拡大できるようにする  
 →ユーザーは女性が多いことが予想されるのでフロント部分は優しい色使いにする  
  
- 機能が多いと操作が難しく感じる(何のボタンがどこにあるかわからない、誤って書いたものを消してしまうことが怖い)  
 →表示させるボタンは極力少なめにする  
 →誤ってデータを削除することがないよう、削除確認ダイアログを表示させる  
  
## 洗い出した要件定義
1. ユーザー登録機能
1. ケア利用者登録、削除機能
1. ケア内容登録、編集、削除機能
1. コメント投稿、削除機能
1. 複数枚画像投稿機能
1. 画像投稿前にプレビュー画面表示
1. 画像拡大表示
1. 画像保存先をAmazon S3に設定
1. 入力に不備があった場合日本語でエラーメッセージを表示する
1. 削除ボタン押下時確認ダイアログを表示する

## 実装した機能
#### 1. ユーザー登録
  - ユーザー名、メールアドレス、パスワードを入力して登録し、ログイン
  - ケアを受ける人(利用者)の名前が表示される
![ユーザー登録](https://user-images.githubusercontent.com/71584841/98656937-9d800480-2384-11eb-805d-3bd304902991.gif)  
  

#### 2. ケア一覧画面
  - 利用者の名前をクリックすると行ったケアの内容が一覧表示される
  - タイトルをクリックすると詳細画面が表示される
![ケア内容一覧画面](https://user-images.githubusercontent.com/71584841/98656952-a53fa900-2384-11eb-928d-c5515db06646.gif)  
  

#### 3. 詳細画面
  - その日に行ったケアの詳細な内容を確認　画像も投稿可能
![詳細画面](https://user-images.githubusercontent.com/71584841/98656970-abce2080-2384-11eb-9530-1bd11ac29f7f.gif)  
  

#### 4. 画像拡大表示
  - 画像をクリックすると拡大表示できる
![画像拡大](https://user-images.githubusercontent.com/71584841/98950745-bc28fb80-253c-11eb-800c-300611864519.gif)  
  

#### 5. ケア一覧画面から新規のケア内容を登録
  - ケアの開始時刻、一覧表示画面でわかりやすいタイトル、実施内容の詳細を入力し、登録
![ケア内容登録](https://user-images.githubusercontent.com/71584841/98657004-ba1c3c80-2384-11eb-86df-2b4cb392b068.gif)  
  

#### 6. コメント投稿
  - 詳細画面からコメントを投稿できる
![コメント投稿](https://user-images.githubusercontent.com/71584841/98657045-c86a5880-2384-11eb-96cb-1e1ebac26ed7.gif)  
  

#### 7. 削除確認ダイアログ
  - 誤って削除することを防ぐ為、削除ボタンをクリックした際は削除ダイアログが表示される
![削除ダイアログ](https://user-images.githubusercontent.com/71584841/98950784-c9de8100-253c-11eb-87ef-a8d98e0ed5e2.gif)
  

## 実装予定の機能
- ヘルパーや看護師が医療用語を用いてケア内容を投稿した際など、単語の意味を調べられる検索フォームの設置
- 行ったケアを日別で検索し表示できる機能

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