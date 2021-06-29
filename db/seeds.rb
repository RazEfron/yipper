# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# we want to make sure that every time we seed, it's a 'clean' seed, with no duplicate rows in our DB
# We want to destroy the data in the order it 'belongs to'

Like.destroy_all # belongs to Yips and Users
Yip.destroy_all # belongs to Users
User.destroy_all # can exist on its own

# Users
paloma = User.create!(
  username: "awesome_person", 
  email: "awesome_person@email.com", 
  password: "starwars",
  age: 30, 
  political_affiliation: "JavaScript"
)

valerie = User.create!(
  username: "valerous", 
  email: "valerous@email.com", 
  password: "starwars",
  age: 30, 
  political_affiliation: "Ruby"
)

daniel = User.create!(
  username: "dan_the_man", 
  email: "dan_the_man@email.com", 
  password: "starwars",
  age: 30, 
  political_affiliation: "Ruby"
)

megan = User.create!(
  username: "the_wizard", 
  email: "the_wizard@email.com", 
  password: "starwars",
  age: 30, 
  political_affiliation: "CSS"
)

cathy = User.create!(
  username: "catz", 
  email: "catz@email.com", 
  password: "starwars",
  age: 30, 
  political_affiliation: "Ruby"
)

raz = User.create!(
  username: "squirelly", 
  email: "squirelly@email.com", 
  password: "starwars",
  age: 30, 
  political_affiliation: "JavaScript"
)

david = User.create!(
  username: "talk_to_the_hand", 
  email: "talk_to_the_hand@email.com", 
  password: "starwars",
  age: 30, 
  political_affiliation: "Ruby"
)

justin = User.create!(
  username: "justin_gets_buckets", 
  email: "justin_gets_buckets@email.com", 
  password: "starwars",
  age: 30, 
  political_affiliation: "JavaScript"
)

brad = User.create!(
  username: "beep_boop", 
  email: "beep_boop@email.com", 
  password: "starwars",
  age: 30, 
  political_affiliation: "C++"
)

greta = User.create!(
  username: "adventursaurus", 
  email: "adventursaurus@email.com", 
  password: "starwars",
  age: 30, 
  political_affiliation: "JavaScript"
)

big_company = User.create!(
  username: "instructors_rock", 
  email: "instructors_rock@email.com", 
  password: "starwars",
  age: 30, 
  political_affiliation: "Instructors"
)


# yips
yip1 = Yip.create!(author_id: david.id, body: "Please use my messaging app, it's way better than Twitter.")
yip2 = Yip.create!(author_id: big_company.id, body: "Hello fellow instructors.")
yip3 = Yip.create!(author_id: big_company.id, body: "Have you seen this sweet instructor merch?")
yip4 = Yip.create!(author_id: justin.id, body: "Sweeeeeet.")
yip5 = Yip.create!(author_id: cathy.id, body: "Kahoots are an opportunity to mess with students.")

yip6 = Yip.create!(author_id: valerie.id, body: "Raaaaaiiiils.")
yip7 = Yip.create!(author_id: cathy.id, body: "This is a random quote I found online. -Some person, 2020.")
yip8 = Yip.create!(author_id: justin.id, body: "JavaScript is the best coding language.")

yip9 = Yip.create!(author_id: david.id, body: "Programmer: A machine that turns coffee into code.")
yip10 = Yip.create!(author_id: big_company.id, body: "You're a wizard, instructor.")


# Likes

# cathy
Like.create!(liker_id: cathy.id, yip_id: yip1.id)
Like.create!(liker_id: cathy.id, yip_id: yip4.id)
Like.create!(liker_id: cathy.id, yip_id: yip6.id)
Like.create!(liker_id: cathy.id, yip_id: yip8.id)
Like.create!(liker_id: cathy.id, yip_id: yip9.id)

# David
Like.create!(liker_id: david.id, yip_id: yip6.id)
Like.create!(liker_id: david.id, yip_id: yip7.id)
Like.create!(liker_id: david.id, yip_id: yip8.id)
Like.create!(liker_id: david.id, yip_id: yip4.id)

# raz
Like.create!(liker_id: raz.id, yip_id: yip4.id)
Like.create!(liker_id: raz.id, yip_id: yip5.id)
Like.create!(liker_id: raz.id, yip_id: yip8.id)

# justin
Like.create!(liker_id: justin.id, yip_id: yip5.id)
Like.create!(liker_id: justin.id, yip_id: yip6.id)

# Big Company
Like.create!(liker_id: big_company.id, yip_id: yip1.id)
Like.create!(liker_id: big_company.id, yip_id: yip4.id)
Like.create!(liker_id: big_company.id, yip_id: yip5.id)
Like.create!(liker_id: big_company.id, yip_id: yip6.id)
Like.create!(liker_id: big_company.id, yip_id: yip7.id)
Like.create!(liker_id: big_company.id, yip_id: yip8.id)
Like.create!(liker_id: big_company.id, yip_id: yip9.id)