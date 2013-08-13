require "csv"


files  = ["ios", "french_football", "sat_vocab", "songs"]

files.each do |file|
  the_deck = Deck.create(title: file)
  CSV.foreach("#{APP_ROOT}/db/data/#{file}.csv", {headers: [:question, :answer], 
              col_sep: "|"}) do |row|
    the_deck.cards << Card.create(question: row[:question].strip, 
                                  answer: row[:answer].strip)
  end 
end 



