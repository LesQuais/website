ROOT_FOLDER		= "#{File.dirname(__FILE__)}/.."

require_relative "../_plugins/diaporama_helpers.rb"

describe Fotorama do
	describe '#render' do
		let(:page_id) { 'test_id' }
		let(:diaporama_name) { 'test_name' }
		let(:data) do
			{ 'file.jpg' => 'legend' }
		end

		subject { Fotorama::render(page_id, diaporama_name, data) }

		it { should_not be_empty }
		it { should include '<img' }

		it 'should contain all images' do
			data.each do |file, caption|
				expect(subject).to include file
				expect(subject).to include caption
			end
		end
	end
end
