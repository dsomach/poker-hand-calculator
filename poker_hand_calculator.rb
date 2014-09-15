class Card
  attr_accessor :value, :suit
  
  def initialize(value, suit)
    @value = value
    @suit = suit
  end
end

class Hand
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end
end


def best_hand(hand)
end