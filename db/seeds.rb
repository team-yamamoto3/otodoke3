# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 1件ずつ作成
# CD.create(price: 500)
# Label.create(label: "レーベル")
# Genre.create(genre: "ジャンル")
# Songs.create(songs: "ソングス")
# Disc.create(disc: "ディスク")
# Artist.create(artist: "アーティスト")
# 配列でまとめて作成
# users = User.create([{name: "hanako"}, {name: "misa"}])

Cd.create!
  ([{title: 'title',}, 
    {song:  'song',}, 
    {label: 'label',}, 
    {jacket: 'jacket',}, 
    {disc: 'disc',}, 
    {price: 1000000,}, 
    {artist: 'artist',}])