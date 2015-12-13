require 'pry'

def kinda_like?(fuzzy_word, exact_word)
  diff_count(fuzzy_word, exact_word) < 2 and !ends_jumbled?(fuzzy_word, exact_word)
end

private

def diff_count(fuzzy_word, exact_word)
  [fuzzy_word.length, exact_word.length].max - match_count(fuzzy_word, exact_word)
end

def match_count(fuzzy_word, exact_word)
  fuzzy_word.chars.uniq.inject(0) do |memo, char|
    memo += [fuzzy_word.count(char), exact_word.count(char)].min
  end
end

def ends_jumbled?(fuzzy_word, exact_word)
  fuzzy_word[0] == exact_word[-1] and fuzzy_word[-1] == exact_word[0]
end
