class JobKind
  include EnumeratedTypeWithBenefits

  declare :warehouse,
    experience: 5,
    energy: -5,
    money: 10,
    strength: nil,
    agility: nil,
    intelligence: nil,
    image: 'job/warehouse.png'
end
