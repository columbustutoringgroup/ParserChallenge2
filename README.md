ParserChallenge2
================

Does the word match fuzzily?

Write a method `kinda_like?` that will determine if a word fuzzily matches another word. The details are in the documentation below.

Run the tests with `bundle exec rspec kinda_like_spec.rb -f d --color`

The output of rspec is also the documentation:

```
#kinda_like?
  returns booleans true and false
    should return true for kinda_like?('fish', 'fish')
    should return false for kinda_like?('fish', 'dog')
  should match words that are at most one letter different; e.g.:
    should indicate that these are pretty much the same:
      'dog' and 'dog'
      'bog' and 'dog'
      'doge' and 'dog'
      'wlofz' and 'wolf'
      'koffee' and 'coffee'
      'melk' and 'milk'
  should match words that have middle letters jumbled; e.g.:
    should indicate that these are pretty much the same:
      'wlof' and 'wolf'
      'wloff' and 'wolf'
  should not match words that end letters jumbled; e.g.:
    should indicate that these are not the same:
      'wolf' and 'flow'
      'acetone' and 'enoteca'
  should not match words that are more than two letters different; e.g.:
    should indicate that these are not the same:
      'cat' and 'dog'
      'bag' and 'dog'
      'coffee' and 'caffeine'
      'cawffee' and 'coffee'
      'cofi' and 'coffee'

Finished in 0.00364 seconds (files took 0.2567 seconds to load)
17 examples, 0 failures
```
