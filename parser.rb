require 'pry'

# class Advparser

	def kinda_like?(fuzzy_word, exact_word)
		if fuzzy_word == exact_word
			return true
		elsif fouls(fuzzy_word, exact_word) < 2
			return true
		else 
			return false
		end
	end

	# private

	def fouls(w1,w2)
		array_w1 = w1.chars
		array_w2 = w2.chars
		array_w1.each do |x|
			# if array_w2.include?(x)
			# 	array_w1.delete(x)
			# end
				array_w2.delete(x)
				# array_w1.delete(x)
			
		end
		z = 0
		# z = 1 if jumbled(w1,w2) != 0 && w1.size != w2.size
		# z = 1 if array_w2.count >= 1

		wd1 = w1.chars
		wd2 = w2.chars

		z = 1 if wd1.last == wd2.last && wd1.first == wd2.first && w1.size != w2.size

		# p z
		# p array_w2
		array_w2.count + jumbled(w1,w2) + z

	end

	def jumbled(w1,w2)
		if w1.chars.last == w2.chars.last
			0
		elsif w1.chars.first != w2.chars.first
			2
		else
			1
		end
	end
# end


# p fouls("cawffee", "coffee")  # 1
# p fouls("bog", "dog")
p kinda_like?("doge", "dog") == true
p kinda_like?("bog", "dog") == true
p kinda_like?("flow", "wolf") == false
p kinda_like?("cawffee", "coffee") == false

# test = Advparser.new
# p test.fouls("bog", "dog")

# p kinda_like?("fish", "fish")

# p kinda_like?("fish", "dog")

# p test.kinda_like?("bog", "dog")
#def another_private_method
#end

#def some_private_method
#end

