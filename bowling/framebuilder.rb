require_relative 'frame.rb'

class FrameBuilder

	def self.frames(rolls)
		padded_rolls(rolls).each_slice(2).to_a.map do |roll_pair|
			Frame.new(roll_pair[0], roll_pair.fetch(1, 0))
		end
	end

	def self.padded_rolls(rolls)
		rolls.reduce([]) { |padded_rolls, roll|
			padded_rolls << roll
			if roll == 10 && padded_rolls.size % 2 != 0
				padded_rolls << 0
			end
			padded_rolls
		}
	end

end