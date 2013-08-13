def correct_answers(round)
  puts round
  truth = round.guesses.where(correct: true).count
  puts truth.to_f
  puts round.deck.cards.length.to_f
  correct_answers = (truth.to_f / round.deck.cards.length.to_f) * 100
  correct_answers.to_i
end


def truth(round)
  truth = round.guesses.where(correct: true).count
end
