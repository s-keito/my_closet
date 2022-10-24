# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Season.create([
    { name: 'all season' },
    { name: 'spring' },
    { name: 'summer'},
    { name: 'autumn'},
    { name: 'winter'},
    ])

Admin.create!(
  email: 'admin@example',
  password: '123456'
  )

Category.create([
    { kind: 'tops' },
    { kind: 'bottoms' },
    { kind: 'shoes' },
    { kind: 'accessories' },
    ])

User.create!(
  [
    {email: 'a@a', name: 'Aさん', password: 'aaaaaa', introduction: 'こんにちは', user_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'b@b', name: 'Bさん', password: 'bbbbbb', introduction: 'アンニョン', user_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'c@c', name: 'Cさん', password: 'cccccc', introduction: 'ハロー', user_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")}
  ]
)
