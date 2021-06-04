# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


MakeupBag.destroy_all
Bag.destroy_all
Makeup.destroy_all
User.destroy_all



GQ = User.create(name: "David", username: "gqmoney", email:  "gqmoney1@gmail.com", password: "money")
Flygirl = User.create(name: "Shannel", username: "flygirlcoco" , email: "flygirlcoco@gmail.com", password: "flygirl" )
Saweetie = User.create(name: "Abby", username: "icygrl" , email: "icygrl@gmail.com" , password: "icygrl")
JT = User.create(name: "Jatavia", username: "thegirlJT", email: "thegirlJT@gmail.com" , password:  "citygirl")
Shenseaa = User.create(name: "Denise", username: "shenyeng", email: "shenyeng@gmail.com", password: "shenyeng")



Makeup.create(product: "blush", name: "NARS Orgasm", description: "a cream blush", color: "Burnt sienna")
Makeup.create(product: "beauty blender", name: "Beauty Blender", description: "the best blending tool on the beauty market", color: "nil")
Makeup.create(product: "lipgloss", name: "Fenty Gloss", description: "a gloss in 50 different shades", color: "butter pecan")
Makeup.create(product: "foundation", name: "NARS Sheer Glow", description: " a buildable coverage foundation", color: "Syracuse")
Makeup.create(product: "AHA cleanser", name: "The Ordinary", description: " a cleanser for your face", color: "nil")



Bag.create(name: "Flygirl's bag", user_id: Flygirl.id)
Bag.create(name: "GQMoney's Bag", user_id: GQ.id)
Bag.create(name: "Saweetie's Bag", user_id: Saweetie.id)
Bag.create(name: "JT's Bag", user_id: JT.id)
Bag.create(name: "Shenseaa's bag", user_id: Shenseaa.id)




MakeupBag.create(bag: Bag.all.sample, makeup: Makeup.all.sample, store_location: "Sephora", price: 38 , quantity: 15)
MakeupBag.create(bag: Bag.all.sample, makeup: Makeup.all.sample, store_location: "Ulta", price: 20, quantity: 1)
MakeupBag.create(bag: Bag.all.sample, makeup: Makeup.all.sample, store_location: "Ulta.com", price: 20 , quantity: 5)
MakeupBag.create(bag: Bag.all.sample, makeup: Makeup.all.sample, store_location: "Target.com", price: 25, quantity: 3)
MakeupBag.create(bag: Bag.all.sample, makeup: Makeup.all.sample, store_location: "theordinary.com", price: 7 , quantity: 10)




puts "

YERRRR! IT'S LIT!


"