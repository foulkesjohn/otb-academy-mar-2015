class Line

	def initialize(rolls)
		@frames = FrameBuilder.frames(rolls)
	end

	def score
		Scorer.score(@frames)
	end

end

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

class FrameBuilder

	def self.frames(rolls)
		padded_rolls = []
		rolls.each_with_index do |roll, idx|
			padded_rolls << roll
			if roll == 10 && padded_rolls.size % 2 != 0
				padded_rolls << 0
			end
		end

		padded_rolls.each_slice(2).to_a.map do |roll_pair|
			Frame.new(roll_pair[0], roll_pair.fetch(1, 0))
		end
	end

end

class FrameScore

	def self.score(first_frame, second_frame, third_frame)
		if first_frame.is_strike? && second_frame.is_strike?
			first_frame.total_pins + second_frame.total_pins + third_frame.first_roll
		elsif first_frame.is_strike?
			first_frame.total_pins + second_frame.total_pins
		elsif first_frame.is_spare?
			first_frame.total_pins + second_frame.first_roll
		else
			first_frame.total_pins
		end
	end

end

class Scorer

	def self.score(frames)
		total_score = 0
		frames.each_with_index do |item, idx|
			if idx < 10
				total_score += FrameScore.score(item, frames.fetch(idx+1, Frame.new), frames.fetch(idx+2, Frame.new))
			end
		end
		total_score
	end

end

RSpec.describe 'A line of bowling' do

	context 'when line is all strikes' do

		let(:rolls) { [ 10,10,10,10,10,10,10,10,10,10,10,10 ] }
		let(:line) { Line.new(rolls) }

		it 'has score of 300' do
			expect(line.score).to eq(300)
		end

	end

	context 'when line is all misses' do

		let(:rolls) { [ 0,0,0,0,0,0,0,0,0,0 ] }
		let(:line) { Line.new(rolls) }

		it 'has score of 0' do
			expect(line.score).to eq(0)
		end

	end

	context 'when line is all spares and strike' do

		let(:rolls) { [ 5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,10 ] }
		let(:line) { Line.new(rolls) }

		it 'has score of 155' do
			expect(line.score).to eq(155)
		end

	end

	context 'when line is all spares and open' do

		let(:rolls) { [ 6,4,6,4,6,4,6,4,6,4,6,4,6,4,6,4,6,4,6,4,7 ] }
		let(:line) { Line.new(rolls) }

		it 'has score of 161' do
			expect(line.score).to eq(161)
		end

	end

	context 'when line has strike at end' do

		let(:rolls) { [ 6,3,6,3,6,3,6,3,6,3,6,3,6,3,6,3,6,3,6,4,10 ] }
		let(:line) { Line.new(rolls) }

		it 'has score of 101' do
			expect(line.score).to eq(101)
		end

	end

	context 'when line has no spares or strikes' do

		let(:rolls) { [ 6,3,6,3,6,3,6,3,6,3,6,3,6,3,6,3,6,3,6,3 ] }
		let(:line) { Line.new(rolls) }

		it 'has score of 101' do
			expect(line.score).to eq(90)
		end

	end

		context 'when line has open pins' do

		let(:rolls) { [ 0,3,6,3,0,3,6,3,6,3,6,3,6,3,6,3,0,3,6,3 ] }
		let(:line) { Line.new(rolls) }

		it 'has score of 72' do
			expect(line.score).to eq(72)
		end

	end

end
