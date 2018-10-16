class SnackKind
  include EnumeratedTypeWithBenefits

  declare :sandwich,  cost: 5,  energy: 10
  declare :soda,      cost: 2,  energy: 5
  declare :pizza,     cost: 12, energy: 22
  declare :candy_bar, cost: 3,  energy: 5
  declare :pancake,   cost: 7,  energy: 16
  declare :cookie,    cost: 3,  energy: 5
  declare :coffee,    cost: 2,  energy: 10
  declare :steak,     cost: 15, energy: 25
  declare :juice,     cost: 8,  energy: 13
  declare :milkshake, cost: 9,  energy: 19
end
