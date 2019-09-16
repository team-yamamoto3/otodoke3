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
# 配列でまとめて作成
# users = User.create([{name: "hanako"}, {name: "misa"}])

#CD情報
Cd.create!(
  [
    {
      title: '月が食べてしまった',
      jenre: 'J-Pop',
      label: 'キングレコード',
      priice: 1200,
      jacket: File.open("./app/assets/images/hujitaena2.jpeg"))
    },
    {
      title: 'アビイ・ロード【50周年記念2CDエディション】＜期間限定盤＞',
      jenre: '洋楽',
      label: 'ユニバーサルミュージック',
      priice: 12800,
      jacket: File.open("./app/assets/images/アヴィロード.jpg"))
    },
    {
      title: 'Vampire ［CD+DVD］＜通常盤Type A/初回限定仕様＞',
      jenre: 'K-Pop',
      label: 'ユニバーサルミュージック',
      priice: 1555,
      jacket: File.open("./app/assets/images/izone.jpeg"))
    },
    {
      title: '馬と鹿',
      jenre: 'J-Pop',
      label: 'Sony Music',
      priice: 1900,
      jacket: File.open("./app/assets/images/馬と鹿.jpeg"))
    },
    {
      title: '色者',
      jenre: 'J-Pop',
      label: 'キングレコード',
      priice: 3300,
      jacket: File.open("./app/assets/images/fujitaena1.jpeg"))
    }
  ]
)

#初期adminの作成
Admin.find_or_create_by(id: 1) do |admin|
  admin.email = 'admin@example.com'
  admin.password = 'admin123'
end
