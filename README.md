# A venerable poker hand calculator.

## Usage:
```ruby
cards = [Card.new(*value*, *suit*)]*5
best_poker_hand(cards)
```

## Example for royal flush:

```ruby
def royal_flush
  cards = [Card.new('Q', 'spades'),
           Card.new('K', 'spades'),
           Card.new(10, 'spades'),
           Card.new('J', 'spades'),
           Card.new('A', 'spades')]

  puts best_poker_hand(cards)
end
```