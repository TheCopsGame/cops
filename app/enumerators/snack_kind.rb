class SnackKind
  include EnumeratedTypeWithBenefits

  declare :sandwich,  cost: 5,  energy: 10, image: 'snack/burger.png'
  declare :soda,      cost: 2,  energy: 5,  image: 'snack/soda.png'
  declare :pizza,     cost: 12, energy: 22, image: 'snack/pizza.png'
  declare :candy_bar, cost: 3,  energy: 5,  image: 'snack/candy.png'
  declare :pancake,   cost: 7,  energy: 16, image: 'snack/pancake.png'
  declare :cookie,    cost: 3,  energy: 5,  image: 'snack/cookies.png'
  declare :coffee,    cost: 2,  energy: 10, image: 'snack/hot-drink.png'
  declare :steak,     cost: 15, energy: 25, image: 'snack/steak.png'
  declare :juice,     cost: 8,  energy: 13, image: 'snack/juice.png'
  declare :milkshake, cost: 9,  energy: 19, image: 'snack/milkshake.png'
end
