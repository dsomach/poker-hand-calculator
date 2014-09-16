class Card
  attr_accessor :value, :suit

  NUMBER_VAL = {'A' => [1, 14],
                'J' => 11,
                'Q' => 12,
                'K' => 13}

  # value in  ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
  # suit in  ['clubs', 'diamonds', 'hearts', 'spades']
  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  # Return the numberical value of the card (convert ace/face card to value)
  def number_value
    NUMBER_VAL[@value] || @value
  end
end

