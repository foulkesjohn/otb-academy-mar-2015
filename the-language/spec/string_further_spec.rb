RSpec::describe 'string' do

	it 'succs' do
		expect("uselesr".succ).to eq 'useless'
	end

	it 'tr' do
		expect('useless'.tr('s', '?')).to eq 'u?ele??'
	end

	it 'squeezes' do
		expect('useless'.squeeze).to eq 'useles'
	end

	it 'paritions' do
		expect('useless'.partition('l')).to eq ['use', 'l', 'ess']
	end

end
