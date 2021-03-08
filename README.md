# データベースの設計

## users テーブル

|   Column                  | Type  | Options   |
|---------------------------|-------|-----------|
|password                   |string |null: false|
|email                      |string |null: false|
|nickname                   |string |null: false|

## js_page 

|   Column                  | Type  | Options   |
|---------------------------|-------|-----------|
|name                       |string |null: false|
|text                       |texe   |null: false|

## ruby_page

|   Column                  | Type  | Options   |
|---------------------------|-------|-----------|
|name                       |string |null: false|
|text                       |texe   |null: false|

## rails_page

|   Column                  | Type  | Options   |
|---------------------------|-------|-----------|
|name                       |string |null: false|
|text                       |texe   |null: false|

## python_page

|   Column                  | Type  | Options   |
|---------------------------|-------|-----------|
|name                       |string |null: false|
|text                       |texe   |null: false|

## HTML

|   Column                  | Type  | Options   |
|---------------------------|-------|-----------|
|name                       |string |null: false|
|text                       |texe   |null: false|

## CSS

|   Column                  | Type  | Options   |
|---------------------------|-------|-----------|
|name                       |string |null: false|
|text                       |texe   |null: false|

## may_page





## ログイン機能実装で使うdeviseの使い方について


## before_action 
コントローラーで定義されたアクションが実行される前に、共通の処置を行う事ができます。

例 
before_action  :処理したいメソッド名

## :authenticate_user!（コントローラーに記述すること）
ログインしていないユーザーをログインページの画面に促すことができます
（ログイン画面に遷移する実装）

## before_action :configure_permitted_parameters, if: :devise_controller?
before_actionのifというオプションを使用している点に注目してください。
これは、値にメソッド名を指定することで、その戻り値がtrueであったときにのみ処理を実行するよう設定するものです。
今回は:devise_controller?というdeviseのヘルパーメソッド名を指定して、もしdeviseに関するコントローラーの処理であれば、そのときだけconfigure_permitted_parametersメソッドを実行するように設定しています。

## devise_parameter_sanitizerメソッド
deviseにおけるparamsのようなメソッドです。deviseのUserモデルに関わる「ログイン」「新規登録」などのリクエストからパラメーターを取得できます。

このメソッドとpermitメソッドを組み合わせることにより、deviseに定義されているストロングパラメーターに対し、自分で新しく追加したカラムも指定して含めることができます。

devise_parameter_sanitizerメソッドは、これまでのストロングパラメーターと同じく、新たに定義するプライベートメソッドの中で使用します。deviseの提供元では、新たに定義するメソッド名をconfigure_permitted_parametersと紹介していることから、慣習的にこのメソッド名で定義することが多いです。
deviseのpermitは、第一引数にdeviseの処理名、第二引数にkeysというキーに対し、配列でキーを指定することで、許可するパラメーターを追加します。
第一引数の処理名には、deviseですでに設定されているsign_in, sign_up, account_updateが使用でき、それぞれサインイン時やサインアップ時、アカウント情報更新時の処理に対応しています。

## 処理実行例
:sign_in	サインイン（ログイン）の処理を行うとき
:sign_up	サインアップ（新規登録）の処理を行うとき
:account_update	アカウント情報更新の処理を行うとき


書き方
def configure_permitted_parameters  # メソッド名は慣習
   deviseのUserモデルにパラメーターを許可
  devise_parameter_sanitizer.permit(:deviseの処理名, keys: [:許可するキー(カラム名)])
end