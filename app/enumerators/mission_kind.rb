class MissionKind
  include EnumeratedTypeWithBenefits

  declare :help_old_woman,
    level: 1,
    experience: 30,
    energy: -50,
    money: 30,
    strength: 10,
    agility: 10,
    intelligence: 10,
    image: 'mission/old_woman.png'

  declare :stop_robbery,
    level: 2,
    experience: 50,
    energy: -50,
    money: 150,
    strength: 20,
    agility: 20,
    intelligence: 20,
    image: 'mission/robbery.png'

  declare :rescue_hostage,
    level: 3,
    experience: 100,
    energy: -50,
    money: 300,
    strength: 20,
    agility: 20,
    intelligence: 20,
    image: 'mission/hostage.png'
end
