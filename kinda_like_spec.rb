require_relative 'spec_helper'
require_relative 'parser'
require 'pry'

describe "#kinda_like?" do
  context "returns booleans true and false" do
    it "should return true for kinda_like?('fish', 'fish')" do
      expect( kinda_like?('fish', 'fish')).to be true
    end

    it "should return false for kinda_like?('fish', 'dog')" do
      expect(kinda_like?('fish', 'dog')).to be false
    end
  end

  context "should match words that are at most one letter different; e.g.:" do
    context "should indicate that these are pretty much the same:" do
      [
        ['dog', 'dog'],
        ['bog', 'dog'],
        ['doge', 'dog'],
        ['wlofz', 'wolf'],
        ['koffee', 'coffee'],
        ['melk', 'milk'],
      ].each do |test|
        fuzzy_word, exact_word = *test
        it "'#{fuzzy_word}' and '#{exact_word}'" do
          expect(kinda_like?(fuzzy_word, exact_word)).to be true
        end
      end
    end
  end

  context "should match words that have middle letters jumbled; e.g.:" do
    context "should indicate that these are pretty much the same:" do
      [
        ['wlof', 'wolf'],
        ['wloff', 'wolf'],
      ].each do |test|
        fuzzy_word, exact_word = *test
        it "'#{fuzzy_word}' and '#{exact_word}'" do
          expect(kinda_like?(fuzzy_word, exact_word)).to be true
        end
      end
    end
  end

  context "should not match words that end letters jumbled; e.g.:" do
    context "should indicate that these are not the same:" do
      [
        ['wolf', 'flow'],
        ['acetone', 'enoteca'],
      ].each do |test|
        fuzzy_word, exact_word = *test
        it "'#{fuzzy_word}' and '#{exact_word}'" do
          expect(kinda_like?(fuzzy_word, exact_word)).to be false
        end
      end
    end
  end

  context "should not match words that are more than two letters different; e.g.:" do
    context "should indicate that these are not the same:" do
      [
        ['cat', 'dog'],
        ['bag', 'dog'],
        ['coffee', 'caffeine'],
        ['cawffee', 'coffee'],
        ['cofi', 'coffee'],
      ].each do |test|
        fuzzy_word, exact_word = *test
        it "'#{fuzzy_word}' and '#{exact_word}'" do
          expect(kinda_like?(fuzzy_word, exact_word)).to be false
        end
      end
    end
  end
end
