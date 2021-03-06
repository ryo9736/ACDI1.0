<h1>README</h1>

<h1>ACDI</h1>

<h2>概要</h2>
トレーニングを教わりたい人とトレーニングを教えたい人同士のマッチングプラットフォームです。
このサービスは指導側をパーソナルトレーナーに限定しないことにより、
パーソナルトレーニングが高くて指導を受けられない人が
パーソナルトレーナーではないけれども、趣味で筋トレをしている人に指導してもらう事が可能です。
このサービスの最終的な目標は、誰もが指導者になれることでパーソナル指導の供給が増えることにより、
パーソナルトレーニングが安くなることで誰もが簡単にフィットネスに参入でき、日本のフィットネス人口を増やすことです。


<h2>コンセプト</h2>
ライザップがCMやメディアに露出する機会が増えパーソナルトレーニングというシステムも世間に認知されるようになりましたが、
パーソナルトレーニングの平均価格は60分8000円と高く、軽い気持ちで始めるには料金が高すぎるのではないか？と感じました。
私はパーソナルトレーナーではありませんが、初心者へのトレーニングの基礎指導はできます。
もちろん職業ではないので、本業の人と比べると質は落ちるのですが十分だと考えています。
私は現在、区営のジムに通う中で、指導者はパーソナルトレーナーではなくトレーニング仲間だったり、趣味で長年筋トレを行っている、おじさん達です。
そんな私の経験からこのサービスを考えました。
指導される側のユーザーへのメリットは、指導を受けられること。
指導する側のユーザーへのメリットは、最近の副業ブームでパーソナルトレーナーを始める方が多く、
パーソナルトレーナーを目指している方へのアウトプットの場してこのサービスは使われると考えています。
誰もが指導者になれ、誰もがフィットネスをできる Anyone can do it = ACDIです。

<h2>バージョン</h2>
Ruby 2.6.3
Rails 5.2.3

<h2>機能一覧</h2>

新規登録、ログイン、ログアウト機能

ツイッターログイン機能

ユーザー一覧、編集、削除機能

ユーザー管理機能

新規投稿編集機能

投稿一覧削除機能

投稿お気に入り機能

投稿タグ機能

投稿タグ検索機能

1対１のユーザーチャット機能

レビュー、フィードバック機能

ページネーション機能

単体テスト機能

統合テスト機能


<h2>カタログ設計</h2>
https://docs.google.com/spreadsheets/d/13ODqrEZYXfTDbkc769nXIdEzooDq255KTLrhjx8m3sw/edit#gid=0

<h2>テーブル定義</h2>
https://docs.google.com/spreadsheets/d/1cLjSR_utfGwY8Lh34_5iMo3QxoU5CZ9mSGefoJK9uq0/edit#gid=0

<h2>ER図</h2>
https://cacoo.com/diagrams/y7WnRMbGUpkzciTj/46A77

<h2>画面遷移図・画面ワイヤーフレーム</h2>
https://xd.adobe.com/view/5acb7fdb-65d6-4e3a-5d13-fa2b12b44411-2cfa/

<h2>使用予定Gem</h2>

gem 'devise'

gem 'rails_admin'

gem 'cancancan'

gem 'acts-as-taggable-on'

gem 'kaminari'

gem 'ransack'

gem 'carrierwave'

gem 'minimagick'

gem 'toastr_rails'

gem 'bootstrap', '~> 4.3.1'

gem 'font-awesome-sass', '~> 5.4.1'

gem 'jquery-rails'

gem 'rails-i18n'

gem 'fog-aws'

gem 'dotenv-rails'

gem 'unicorn'

gem 'mini_racer', platforms: :ruby

gem 'omniauth'

gem 'omniauth-twitter'

gem 'omniauth-rails_csrf_protection'

