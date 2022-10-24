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
    { kind: 'outer' },
    { kind: 'pants' },
    { kind: 'skirts' },
    { kind: 'all-in-one' },
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

# Dress.create!(
#   [
#     {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.png"), filename:"sample-post1.png"), caption: 'ユニクロ　2000円', user_id: 1, season_id: 2, category_id: 1 },
#     {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.png"), filename:"sample-post2.png"), caption: 'gu　1000円', user_id: 1, season_id: 1, category_id: 1 },
#     {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.png"), filename:"sample-post3.png"), caption: 'adidas　1500円', user_id: 1, season_id: 2, category_id: 2 },
#     {image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.png"), filename:"sample-post4.png"), caption: '無印良品　7000円', user_id: 1, season_id: 4, category_id: 1 }
#   ]
# )

