helpers do 
  def check_answer(params = {})
    @deck = Deck.find_by_id(params[:deck_id])
    card = @deck.cards.find_by_id(params[:card_id])
    round = Round.find_by_id(params[:round_id])

    correct = card.answer.downcase == params[:answer].downcase

    guess = Guess.create(correct: correct, round_id: round.id, 
                         card_id: card.id)
  end
end 
