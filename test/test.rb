require_relative '../poker_hand_calculator.rb'
require 'test/unit'

class TestWinningHands < Test::Unit::TestCase
  def test_royal_flush
    cards = [Card.new(10, 'hearts'),
             Card.new('K', 'hearts'),
             Card.new('Q', 'hearts'),
             Card.new('A', 'hearts'),
             Card.new('J', 'hearts')]

    assert_equal(best_poker_hand(cards), "Royal Flush")
  end
  
  def test_straight_flush
    cards = [Card.new(2, 'diamonds'),
             Card.new('A', 'diamonds'),
             Card.new(5, 'diamonds'),
             Card.new(3, 'diamonds'),
             Card.new(4, 'diamonds')]

    assert_equal(best_poker_hand(cards), "Straight Flush")
  end
  
  def test_four_of_a_kind
    cards = [Card.new(10, 'hearts'),
             Card.new(2, 'hearts'),
             Card.new(10, 'diamonds'),
             Card.new(10, 'clubs'),
             Card.new(10, 'spades')]

    assert_equal(best_poker_hand(cards), "Four of a Kind")
  end
  
  def test_full_house
    cards = [Card.new(3, 'hearts'),
             Card.new('K', 'hearts'),
             Card.new(3, 'clubs'),
             Card.new('K', 'spades'),
             Card.new('K', 'diamonds')]

    assert_equal(best_poker_hand(cards), "Full House")
  end
  
  def test_flush
    cards = [Card.new(8, 'hearts'),
             Card.new('K', 'hearts'),
             Card.new(2, 'hearts'),
             Card.new('A', 'hearts'),
             Card.new(5, 'hearts')]

    assert_equal(best_poker_hand(cards), "Flush")
  end
  
  def test_straight
    cards = [Card.new(10, 'hearts'),
             Card.new('K', 'hearts'),
             Card.new('Q', 'hearts'),
             Card.new('A', 'spades'),
             Card.new('J', 'hearts')]

    assert_equal(best_poker_hand(cards), "Straight")
  end
  
  def test_three_of_a_kind
    cards = [Card.new('A', 'clubs'),
             Card.new('K', 'hearts'),
             Card.new('A', 'hearts'),
             Card.new('A', 'spades'),
             Card.new('J', 'diamonds')]

    assert_equal(best_poker_hand(cards), "Three of a Kind")
  end
  
  def test_two_pair
    cards = [Card.new(10, 'hearts'),
             Card.new(2, 'diamonds'),
             Card.new('A', 'hearts'),
             Card.new(2, 'clubs'),
             Card.new(10, 'clubs')]

    assert_equal(best_poker_hand(cards), "Two Pair")
  end
  
  def test_pair
    cards = [Card.new(7, 'spades'),
             Card.new(5, 'clubs'),
             Card.new(5, 'diamonds'),
             Card.new(3, 'hearts'),
             Card.new('J', 'hearts')]

    assert_equal(best_poker_hand(cards), "Pair")
  end
  
  def test_high_card
    cards = [Card.new(10, 'hearts'),
             Card.new('A', 'hearts'),
             Card.new('K', 'hearts'),
             Card.new(3, 'hearts'),
             Card.new(6, 'diamonds')]

    assert_equal(best_poker_hand(cards), "High Card")
  end
  
  def test_invalid_hand_length
    cards = [Card.new(10, 'hearts'),
             Card.new('A', 'hearts'),
             Card.new('K', 'hearts'),
             Card.new(6, 'diamonds')]

    assert_equal(best_poker_hand(cards), "Valid hand must have 5 cards.")
  end
end