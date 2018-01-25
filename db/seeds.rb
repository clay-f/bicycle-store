Category.destroy_all
Product.destroy_all
User.destroy_all

Category.create(id: 1, name: '超级英雄')
Category.create(id: 2, name: '自行车')
Category.create(id: 3, name: '婴儿车')
Category.create(id: 4, name: '潮流装备')
Category.create(id: 5, name: '大牌尖货')

Product.create(name: 'iFun516', info: 'DC', price: 910, category_id: 1)
Product.create(name: 'Amplify 1', info: 'DC', price: 1150, category_id: 1)
Product.create(name: 'Amplify 2', info: 'DC', price: 1150, category_id: 1)
Product.create(name: 'ATX-20D', info: 'DC', price: 1558, category_id: 1)
Product.create(name: 'Rocker 1', info: 'DC', price: 3598, category_id: 1)

Product.create(name: 'DIY短袖', info: '玩家潮品', price: 351, category_id: 5)
Product.create(name: 'HOII遮阳伞', info: '玩家潮品', price: 1580, category_id: 5)
Product.create(name: 'HOII伸缩帽', info: '玩家潮品', price: 968, category_id: 5)
Product.create(name: 'HOII伸缩遮阳帽', info: '玩家潮品', price: 998, category_id: 5)

User.create(name: 'f', password: '123456')