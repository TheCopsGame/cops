class SnackKind
  include EnumeratedTypeWithBenefits

  ##
  # Each inventory related enum must contain the following properties:
  #
  # :experience, :energy, :money, :strength, :agility, :intelligence
  #
  # - Negative properties will be considered as costs.
  # - Positive properties will be considered as gains.
  # - Nil properties will be ignored.

  declare :sandwich,
    experience: nil,
    energy: 10,
    money: -5,
    strength: nil,
    agility: nil,
    intelligence: nil,
    image: 'snack/burger.png'

  declare :soda,
    experience: nil,
    energy: 5,
    money: -2,
    strength: nil,
    agility: nil,
    intelligence: nil,
    image: 'snack/soda.png'

  declare :pizza,
    experience: nil,
    energy: 22,
    money: -12,
    strength: nil,
    agility: nil,
    intelligence: nil,
    image: 'snack/pizza.png'

  declare :candy_bar,
    experience: nil,
    energy: 5,
    money: -3,
    strength: nil,
    agility: nil,
    intelligence: nil,
    image: 'snack/candy.png'

  declare :pancake,
    experience: nil,
    energy: 16,
    money: -7,
    strength: nil,
    agility: nil,
    intelligence: nil,
    image: 'snack/pancake.png'

  declare :cookie,
    experience: nil,
    energy: 5,
    money: -3,
    strength: nil,
    agility: nil,
    intelligence: nil,
    image: 'snack/cookies.png'

  declare :coffee,
    experience: nil,
    energy: 10,
    money: -2,
    strength: nil,
    agility: nil,
    intelligence: nil,
    image: 'snack/hot-drink.png'

  declare :steak,
    experience: nil,
    energy: 25,
    money: -15,
    strength: nil,
    agility: nil,
    intelligence: nil,
    image: 'snack/steak.png'

  declare :juice,
    experience: nil,
    energy: 13,
    money: -8,
    strength: nil,
    agility: nil,
    intelligence: nil,
    image: 'snack/juice.png'

  declare :milkshake,
    experience: nil,
    energy: 19,
    money: -9,
    strength: nil,
    agility: nil,
    intelligence: nil,
    image: 'snack/milkshake.png'
end
