require_relative 'framescore.rb'
require_relative 'frame.rb'

class Scorer

	def self.score(frames)
		frames.take(10).each_with_index.inject(0) do |sum,(item,idx)|
			sum += FrameScore.score(item, frames.fetch(idx+1, Frame.new), frames.fetch(idx+2, Frame.new))
		end
	end

end