class Frame

	attr_reader :first_roll
	attr_reader :second_roll

	def initialize(first_roll = 0, second_roll = 0)
		@first_roll = first_roll
		@second_roll = second_roll
	end

	def is_strike?
		@first_roll == 10
	end

	def is_spare?
		@first_roll + @second_roll == 10 && @first_roll < 10
	end

	def total_pins
		@first_roll + @second_roll
	end

end