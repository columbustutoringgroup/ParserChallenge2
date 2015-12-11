require 'pry'

def kinda_like?(fuzzy_word, exact_word)
  return false if ends_jumbled?(fuzzy_word, exact_word)

  case letter_differences(fuzzy_word, exact_word)
  when 0..1 then true
  else false
  end
end

private

def letter_differences(fuzzy_word, exact_word)
  common_characters = fuzzy_word.chars & exact_word.chars

  number_of_matches = 0
  common_characters.each do |char|
    number_of_matches += [fuzzy_word.count(char), exact_word.count(char)].min
  end

  [fuzzy_word.length, exact_word.length].max - number_of_matches
end

def ends_jumbled?(fuzzy_word, exact_word)
  fuzzy_word[0] == exact_word[-1] and fuzzy_word[-1] == exact_word[0]
end

# dejumble the middle first
# then compare differences
# if differences is more than
