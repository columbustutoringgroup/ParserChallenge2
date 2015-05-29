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
		array_w1 = w1.split("")
		array_w2 = w2.split("")
		array_w1.each do |x|
			# if array_w2.include?(x)
			# 	array_w1.delete(x)
			# end
				array_w2.delete(x)
			
		end
		# arrxay_w2
		# array_w1 - array_w2

		array_w2.count + jumbled(w1,w2) 

	end

	def jumbled(w1,w2)
		if w1.split("").last == w2.split("").last
			0
		elsif w1.split("").first != w2.split("").first
			2
		else
			1
		end
	end
# end


p fouls("cawffee", "coffee")  # 1
p fouls("doge", "dog")
# p kinda_like?("doge", "dog")
# p kinda_like?("flow", "wolf")

# test = Advparser.new
# p test.fouls("bog", "dog")

# p kinda_like?("fish", "fish")

# p kinda_like?("fish", "dog")

# p test.kinda_like?("bog", "dog")
#def another_private_method
#end

#def some_private_method
#end

