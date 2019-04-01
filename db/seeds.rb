# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  category = Category.create([{ name: 'Avengers' }, { name: 'Lord of the Rings' },
                              { name: 'Black widow', parent_id: 1 }, { name: 'Avengers 2', parent_id: 1 },
                              { name: 'Black Panther', parent_id: 1 }, { name: 'Lion King' },
                              { name: 'Trollo lo lo lo' }, { name: 'Voroshilovskii strelok' },
                              { name: 'Men in Black' }, { name: 'Another film' }])

product = Product.create([{ name: 'Norm', info: "about film 1", category_id: 1 },
                          { name: 'Name film 2',  info: "about film 2", category_id: 2 },
                          { name: 'Name film 3',  info: "about film 3", category_id: 3 },
                          { name: 'Name film 4',  info: "about film 4", category_id: 4 },
                          { name: 'Name film 5',  info: "about film 5", category_id: 1 },
                          { name: 'Name film 6',  info: "about film 6", category_id: 2 },
                          { name: 'Name film 7',  info: "about film 7", category_id: 1 },
                          { name: 'Name film 8',  info: "about film 8", category_id: 5 }])


#   Character.create(name: 'Luke', movie: movies.first)
