#----------------------GET--------------------------------------
get '/deck_list' do
  @decks = Deck.all
  erb :deck_list
end

get '/play/:deck_id' do
  @card = Deck.find(params[:deck_id]).cards.first
  @card_id = @card.id
  @deck = Deck.find(params[:deck_id])
  @round = Round.create(deck_id: @deck.id, user_id: current_user.id)

  session[:array_position] = 0
  erb :game
end

get '/play/:deck_id/:round_id/:card_id' do
  @card = Card.find_by_id(params[:card_id])
  @card_id = @card.id
  @deck = Deck.find(params[:deck_id])
  @round = Round.find_by_id(params[:round_id])

  erb :game
end

#-------------------------POST----------------------------

post '/play/:deck_id/:round_id/:card_id' do
  deck_id = params[:deck_id]
  round_id = params[:round_id]
  card_id = params[:card_id]
  last_card = Round.find_by_id(params[:round_id]).deck.cards.last.id

  check_answer(params)

  if card_id.to_i == last_card.to_i
    if request.xhr?
      link = "/user/#{current_user.id}/profile"
      content_type :json
      answer = {answer: Card.find(card_id).answer, 
      guess: Card.find(card_id).
      guesses.find_by_round_id(round_id).correct,
      link: link}.to_json
    else
      redirect "/user/#{current_user.id}/profile"
    end
  else
    if request.xhr?
      session[:array_position] += 1
      next_card = Round.find_by_id(round_id).deck.cards[session[:array_position]].id
      link = "/play/#{deck_id}/#{round_id}/#{next_card}"

      content_type :json
      answer = {answer: Card.find(card_id).answer, 
      guess: Card.find(card_id).
      guesses.find_by_round_id(round_id).correct, 
      link: link}.to_json
    end
  end
end
