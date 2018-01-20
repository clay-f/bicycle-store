Category.destroy_all

Category.create(id: 1, name: '超级英雄')
Category.create(id: 2, name: '自行车')
Category.create(id: 3, name: '婴儿车')
Category.create(id: 4, name: '潮流装备')
Category.create(id: 5, name: '大牌尖货')

Bicycle.create(name: 'iFun516', info: 'DC', 910, category_id: 1)
Bicycle.create(name: 'Amplify', info: 'DC', 1150, category_id: 1)
Bicycle.create(name: 'iFun516', info: 'DC', 1150, category_id: 1)
Bicycle.create(name: 'iFun516', info: 'DC', 1558, category_id: 1)
Bicycle.create(name: 'iFun516', info: 'DC', 3598, category_id: 1)
