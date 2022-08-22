# frozen_string_literal: true

print '開発環境のデータをすべて削除して初期データを投入します。よろしいですか？[Y/n]: ' # rubocop:disable Rails/Output
unless $stdin.gets.chomp == 'Y'
  puts '中止しました。' # rubocop:disable Rails/Output
  return
end

def picture_file(name)
  File.open(Rails.root.join("db/seeds/#{name}"))
end

Book.destroy_all

Book.create!(
  title: 'Ruby超入門',
  memo: 'Rubyの文法の基本をやさしくていねいに解説しています。',
  author: '五十嵐 邦明',
  picture: picture_file('cho-nyumon.jpg')
)

Book.create!(
  title: 'チェリー本',
  memo: 'プログラミング経験者のためのRuby入門書です。',
  author: '伊藤 淳一',
  picture: picture_file('cherry-book.jpg')
)

Book.create!(
  title: '楽々ERDレッスン',
  memo: '実在する帳票から本当に使えるテーブル設計を導く画期的な本！',
  author: '羽生 章洋',
  picture: picture_file('erd.jpg')
)

50.times do
  Book.create!(
    title: Faker::Book.title,
    memo: Faker::Book.genre,
    author: Faker::Book.author,
    picture: picture_file('no-image.png')
  )
end

# メインのサンプルユーザーを1人作成する
User.create!(
  name: 'サンプル',
  email: 'sample@rails.org',
  zipcode: '1040045',
  address: '東京都中央区築地１丁目１３−１ 築地松竹ビル',
  profile: 'サンプルと言います。部署異動したことで、業務でコードに増える機会が増えたことから勉強しよりスキルを伸ばしていきたいと考えました。',
  password: '123456',
  password_confirmation: '123456'
)

# 追加のユーザーをまとめて生成する
30.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@railslesson.com"
  address = Faker::Address.state + Faker::Address.city
  zipcode = rand(111_111_1..999_999_9)
  password = 'password'
  User.create!(name: name,
               email: email,
               zipcode: zipcode,
               address: address,
               profile: "#{name}の自己紹介文です！",
               password: password,
               password_confirmation: password)
end

puts '初期データの投入が完了しました。' # rubocop:disable Rails/Output
