require 'pry'

def kinda_like?(fuzzy_word, exact_word)
  fuzzy_chars = fuzzy_word.chars
  exact_chars = exact_word.chars

  a = diff(fuzzy_chars.dup, exact_chars.dup)
  b = diff(exact_chars.dup, fuzzy_chars.dup)

  (
    (a > 1) ||
    (b > 1) ||
    end_letters_switched?(fuzzy_word, exact_word)
  ) ? false : true
end

def diff(a, b)
  a.each do |char|
    if (index = b.find_index char)
      b.delete_at index
    end
  end
  b.size
end

def end_letters_switched?(a, b)
  first = ->(a) { a.chars.first }
  last = ->(a) { a.chars.last }
  c = b.reverse
  first.(a) == first.(c) && last.(a) == last.(c)
end

