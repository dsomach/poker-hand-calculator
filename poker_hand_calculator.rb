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

  ##### BEGIN HELPER METHODS FOR WINNING CARD MATCHING
  #####

  # Hand matching helper methods: one_suit?, card_values
  def one_suit?
    @cards.uniq{|card| card.suit}.count == 1
  end

  # Return a list of the card values
  def card_values
    @cards.collect{|card| card.value}
  end

  # Return a list of the card's number values
  # Ace is high or low, so return 1 AND 14 in the case of an Ace
  def card_number_values
    @cards.collect{|card| card.number_value}.flatten.sort
  end

  # Figure out if the hand has a (consecutive) run of length 5.
  # We take the numerical values of the cards and sort them, so
  # subtracting the array index from the card value will give repeating
  # numbers in the case of a run.
  # Then, we can reuse our code for checking for number of cards with same rank.
  # (value_counts is the array of counts of these repeated numbers, so we check
  # for five repeated numbers in order to find a run of five.)
  def run_of_five?
    index_adjusted = []
    card_number_values.each_with_index do |card_value, index|
      index_adjusted << (card_value - index)
    end

    value_counts = array_counts(index_adjusted).values
    value_counts.include?(5)
  end

  # Build a hash which represents card value counters.
  # (Used to find cards of repeating value/rank.)
  # The key is the card value, and the value is the number of times it occurs in the hand.
  def array_counts(array)
    counts = Hash.new(0)
    array.each{|val| counts[val] += 1}
    counts
  end

  ##### BEGIN METHODS FOR WINNING HAND MATCHING
  #####

  # Ace through 10 of the same suit
  def royal_flush?
    has_royal_flush_values = (['A', 'K', 'Q', 'J', 10] - card_values).count == 0
    return has_royal_flush_values && one_suit?
  end

  # Any five-card sequence in the same suit
  def straight_flush?
    return run_of_five? && one_suit?
  end

  # All four cards of the same rank
  def four_of_a_kind?
    counts = array_counts(card_values).values
    return counts.include?(4)
  end

  # Three of a kind combined with a pair
  def full_house?
    counts = array_counts(card_values).values
    return counts.include?(3) && counts.include?(2)
  end

  # Any five cards of the same suit, but not in sequence
  def flush?
    return one_suit?
  end

  # Five cards in sequence, but not in the same suit
  def straight?
    return run_of_five?
  end

  # Three cards of the same rank
  def three_of_a_kind?
    counts = array_counts(card_values).values
    return counts.include?(3)
  end

  # To find if a hand has two separate pairs, look at the counts array to see if
  # we have two values which appear twice.
  def two_pair?
    counts = array_counts(card_values).values
    return counts.count(2) == 2
  end

  # Two cards of the same rank
  def pair?
    counts = array_counts(card_values).values
    return counts.include?(2)
  end
end

# Usage:
# cards = [Card.new(*value*, *suit*)]*5
# best_poker_hand(cards)
def best_poker_hand(cards)
  Hand.new(cards).best_hand
end

# Example for royal flush:
def royal_flush
  cards = [Card.new('Q', 'spades'),
           Card.new('K', 'spades'),
           Card.new(10, 'spades'),
           Card.new('J', 'spades'),
           Card.new('A', 'spades')]

  puts best_poker_hand(cards)
end