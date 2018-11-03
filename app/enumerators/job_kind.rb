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

  declare :paper_work,
    experience: 10,
    energy: -10,
    money: 20,
    strength: nil,
    agility: nil,
    intelligence: nil,
    image: 'job/paper_work.png'

  declare :patrol,
    experience: 15,
    energy: -15,
    money: 30,
    strength: nil,
    agility: nil,
    intelligence: nil,
    image: 'job/patrol.png'
end
