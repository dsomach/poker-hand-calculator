class Card
  attr_accessor :value, :suit

  # value in  ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
  # suit in  ['club', 'diamond', 'heart', 'spade']
  def initialize(value, suit)
    @value = value
    @suit = suit
  end
end

class Hand
  attr_accessor :cards

  WINNING_ORDER = {'Royal Flush' => :royal_flush?,
                   'Straight Flush' => :straight_flush?,
                   'Four of a Kind' => :four_of_a_kind?,
                   'Full House' => :full_house?,
                   'Flush' => :flush?,
                   'Straight' => :straight?,
                   'Three of a Kind' => :three_of_a_kind?,
                   'Two Pair' => :two_pair?,
                   'Pair' => :pair?}

  def initialize(cards = random_hand)
    @cards = cards
  end

  # Go through the winning order and check to see if the hand matches each one.
  # As soon as we have a match, return the hand name (as it is the highest scoring hand).
  # If no hands match, the best hand is 'High Card' :(
  def best_hand

    #TODO enforce a 5-card hand

    WINNING_ORDER.each do |hand_name, hand_method|
      return hand_name if self.send(hand_method)
    end

    return 'High Card'
  end

  private

  def random_hand
    #TODO implement random hand generation
  end

  # Hand matching helper methods: one_suit?, card_values
  def one_suit?
    @cards.uniq{|card| card.suit}.count == 1
  end

  # Return a list of the card values
  def card_values
    @cards.collect{|card| card.value}
  end

  # Ace through 10 of the same suit
  def royal_flush?
    has_royal_flush_values = (['A', 'K', 'Q', 'J', 10] - card_values).count == 0
    return has_royal_flush_values && one_suit?
  end

  def straight_flush?
    return false
  end

  def four_of_a_kind?
    return false
  end

  def full_house?
    return false
  end

  def flush?
    return false
  end

  def straight?
    return false
  end

  def three_of_a_kind?
    return false
  end

  def two_pair?
    return false
  end

  def pair?
    return false
  end
end


def best_hand(hand)
end