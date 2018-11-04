class CharacterLevel
  include EnumeratedTypeWithBenefits

  declare :level_1,
    experience: 0,
    strength: 0,
    agility: 0,
    intelligence: 0

  declare :level_2,
    experience: 500,
    strength: 500,
    agility: 500,
    intelligence: 500

  declare :level_3,
    experience: 1000,
    strength: 1000,
    agility: 1000,
    intelligence: 1000

  declare :level_4,
    experience: 2000,
    strength: 2000,
    agility: 2000,
    intelligence: 2000

  declare :level_5,
    experience: 5000,
    strength: 5000,
    agility: 5000,
    intelligence: 5000

  def self.level_properties
    [:experience, :strength, :agility, :intelligence]
  end
end
