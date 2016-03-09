require 'pry'

def kinda_like?(fuzzy_word, exact_word)
  fuzzy = fuzzy_word.chars
  exact = exact_word.chars
  difference_counter = (fuzzy.length - exact.length).abs
  common_length = fuzzy.length > exact.length ? exact.length : fuzzy.length
  (0...common_length).each do |i|
    difference_counter += 1 if fuzzy[i] != exact[i]
  end
  if difference_counter.between?(2, 3) && difference_counter < common_length
    flipped_ends?(fuzzy_word, exact_word) || middle_jumbled?(fuzzy, exact, common_length)
  else
    difference_counter < 3
  end
end

def flipped_ends?(fuzzy_word, exact_word)
  fuzzy_word[0] == exact_word.reverse[0] &&
    fuzzy_word.reverse[0] == exact_word[0]
end

def middle_jumbled?(fuzzy, exact, common_length)
  fuzzy.first(common_length).sort ==
    exact.first(common_length).sort
end
