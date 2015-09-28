require 'pry'

# 'f' for fuzzy, 'e' for exact word
def kinda_like?(f,e)
  # exactMatch(f,e)
  f == e || middleJumbled?(f,e) || offByOne?(f,e)
end

# check if you can turn the exact word into the fuzzy one by jumbling up all 
# of the exact word's letters, while keeping the first and last as is
def middleJumbled?(f,e)
  len = e.length
  if len >= 2
    # turn "coffee" into /c[coffee]{3,}e/, for instance
    # the {3,} prohibits cutting out a big chunk of the middle of the word
    regex = Regexp.new "#{e[0]}[#{e}]{#{len-3},}#{e[len-1]}"
    regex === f
  else
    false 
  end
end

# checks whether a single substition, insertion, or deletion will turn the 
# exact word into the fuzzy word
def offByOne?(f,e)
  if f.length == e.length
    return singleSubstition?(f,e)
  else
    return singleInsertion?(f,e)
  end
end

# checks if a single letter-for-letter solution will do the trick
def singleSubstition?(f,e)
  differences = 0
  for i in 0...f.length
    if f[i] != e[i] then differences += 1 end
    if differences > 1 then return false end
  end
  return true
end

# checks if a single insertion or deletion will do the trick
def singleInsertion?(f,e)
  longer = [f,e].max
  shorter = [f,e].min

  offset = 0
  index = 0
  # wherever the two words differ, increase the offset and try again
  while index < shorter.length do
    shorter[index] == longer[index+offset] ? index += 1 : offset += 1
    if offset > 1 then return false end
  end
  return true
end
