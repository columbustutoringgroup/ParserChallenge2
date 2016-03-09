require 'pry'
require 'facets'

def kinda_like?(fuzzy_word, exact_word)
  end_letters_not_jumbled(fuzzy_word, exact_word) &&
  	(is_exact_match(fuzzy_word, exact_word) ||
  	at_most_one_letter_different(fuzzy_word, exact_word) )
end

def is_exact_match(fuzzy_word, exact_word)
	regex = Regexp.new(fuzzy_word)
	!exact_word.match(regex).nil?
end

def at_most_one_letter_different(fuzzy_word, exact_word)
	extra_fuzzies = fuzzy_word.split(//).frequency - exact_word.split(//).frequency
	extra_exacts = exact_word.split(//).frequency - fuzzy_word.split(//).frequency
	extra_fuzzies.size < 2 && extra_exacts.size < 2
end

def end_letters_not_jumbled(fuzzy_word, exact_word)
	p fuzzy_word[0] != exact_word[-1]
	p fuzzy_word[-1] == exact_word[0]
	fuzzy_word[0] != exact_word[-1] && fuzzy_word[-1] != exact_word[0]
end

