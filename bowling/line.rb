require_relative 'framebuilder.rb'
require_relative 'scorer.rb'

class Line

	def initialize(rolls)
		@frames = FrameBuilder.frames(rolls)
	end

	def score
		Scorer.score(@frames)
	end

end