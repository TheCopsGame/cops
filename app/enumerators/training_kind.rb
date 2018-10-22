class TrainingKind
  include EnumeratedTypeWithBenefits

  declare :running,
    experience: nil,
    energy: -5,
    money: nil,
    strength: nil,
    agility: 5,
    intelligence: nil,
    image: 'gym/running.png'

  declare :weightlifting,
    experience: nil,
    energy: -5,
    money: nil,
    strength: 5,
    agility: nil,
    intelligence: nil,
    image: 'gym/weightlifting.png'
end
