# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
category1 = Category.new(name: 'History', priority: 1)
category2 = Category.new(name: 'Technology', priority: 2)
category3 = Category.new(name: 'Music', priority: 3)
category4 = Category.new(name: 'Movies', priority: 4)
category1.save unless category1.valid? == false
category2.save unless category2.valid? == false
category3.save unless category3.valid? == false
category4.save unless category4.valid? == false