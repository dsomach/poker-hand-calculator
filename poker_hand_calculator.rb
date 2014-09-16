require_relative 'lib/card.rb'
require_relative 'lib/hand.rb'

# Usage:
# cards = [Card.new(*value*, *suit*)]*5
# best_poker_hand(cards)
def best_poker_hand(cards)
  begin
    Hand.new(cards).best_hand
  rescue Hand::HandSizeError
    puts "Valid hand must have 5 cards."
  end
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