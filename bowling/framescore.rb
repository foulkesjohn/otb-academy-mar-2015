class FrameScore

	def self.score(first_frame, second_frame, third_frame)
		if first_frame.is_strike? && second_frame.is_strike?
			total_pins(first_frame, second_frame) + third_frame.first_roll
		elsif first_frame.is_strike?
			total_pins(first_frame, second_frame)
		elsif first_frame.is_spare?
			first_frame.total_pins + second_frame.first_roll
		else
			total_pins(first_frame)
		end
	end

	def self.total_pins(*frames)
		frames.reduce(0) do |sum, frame|
			sum += frame.total_pins
		end
	end

end