require_relative '../line.rb'

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
