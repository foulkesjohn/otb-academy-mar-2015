class Line

end

class Frame

end

class Scorer

end

RSpec.describe 'bowling' do

	context 'when line is all strikes' do

		let(:line) { Line.new }

		it 'has score of 300' do
			expect(Scorer.score(line)).to eq(300)
		end

	end

	context 'when line is all spares' do

	end

	context 'when line is all opens' do

	end

	context 'when line is all misses' do

		it 'has score of 0' do

		end

	end

	context 'when line has strike at end' do

		it 'has score of 248' do

		end

	end

	context 'when line has spare at end' do

		it 'has score of 200' do

		end

	end

end
