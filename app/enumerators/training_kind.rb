class TrainingKind
  include EnumeratedTypeWithBenefits

  declare :running,       cost: 5, agility: 5, strength: 0
  declare :weightlifting, cost: 5, agility: 0, strength: 5
end
