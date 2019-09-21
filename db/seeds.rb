# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Songs.create(songs: "ソングス")
# Disc.create(disc: "ディスク")
# Artist.create(artist: "アーティスト")


#CD情報
Cd.create!(
  [
    {
      title: '月が食べてしまった',
      consumption_tax: 1.08,
      stock: 50,
      genre: 'J-Pop',
      label: 'キングレコード',
      price: 1200,
      jacket: File.open("./app/assets/images/hujitaena2.jpeg")
    },
    {
      title: 'アビイ・ロード【50周年記念2CDエディション】＜期間限定盤＞',
      consumption_tax: 1.08,
      stock: 50,
      genre: '洋楽',
      label: 'ユニバーサルミュージック',
      price: 12800,
      jacket: File.open("./app/assets/images/アヴィロード.jpg")
    },
    {
      title: 'Vampire ［CD+DVD］＜通常盤Type A/初回限定仕様＞',
      consumption_tax: 1.08,
      stock: 50,
      genre: 'K-Pop',
      label: 'ユニバーサルミュージック',
      price: 1555,
      jacket: File.open("./app/assets/images/izone.jpeg")
    },
    {
      title: '馬と鹿',
      consumption_tax: 1.08,
      stock: 50,
      genre: 'J-Pop',
      label: 'Sony Music',
      price: 1900,
      jacket: File.open("./app/assets/images/馬と鹿.jpeg")
    },
    {
      title: '色者',
      consumption_tax: 1.08,
      stock: 50,
      genre: 'J-Pop',
      label: 'キングレコード',
      price: 3300,
      jacket: File.open("./app/assets/images/fujitaena1.jpeg")
    }
  ])


#初期adminの作成
Admin.create(email: "admin@example.com",password: "admin123")

# 配列でまとめて作成user
# endusers = Enduser.create([{first_name: "hanano", last_name: "hanako", user_tell: "0725-551-6969", postal_code: "551-1156", user_address: "マサラタウンにさよならバイバイオーキド博士研究所", email: "enduser@example.com",password: "hujitaena123" },
#   {first_name: "藤田", last_name: "恵名", user_tell: "0725-56-6565", postal_code: "551-3955", user_address: "アメリカ合衆国オハイオ州サーモンピンク市709", email: "hujitaena@example.com",password: "hujitaena0930"}])

