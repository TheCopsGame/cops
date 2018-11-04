class BookKind
  include EnumeratedTypeWithBenefits

  declare :police_manual,
    experience: nil,
    energy: -3,
    money: -5,
    strength: nil,
    agility: nil,
    intelligence: 7,
    image: 'library/police_manual.png'

  declare :art_of_war,
    experience: nil,
    energy: -5,
    money: -9,
    strength: nil,
    agility: nil,
    intelligence: 12,
    image: 'library/art_of_war.png'

  declare :men_in_blue,
    experience: nil,
    energy: -1,
    money: -3,
    strength: nil,
    agility: nil,
    intelligence: 6,
    image: 'library/men_in_blue.png'

  declare :cop,
    experience: nil,
    energy: -12,
    money: -25,
    strength: nil,
    agility: nil,
    intelligence: 27,
    image: 'library/cop.png'

  declare :busting_bad_guys,
    experience: nil,
    energy: -4,
    money: -17,
    strength: nil,
    agility: nil,
    intelligence: 16,
    image: 'library/busting_bad_guys.png'
end
