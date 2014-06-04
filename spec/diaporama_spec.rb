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

		it 'should include all images and build their path' do
			data.each do |file, caption|
				expect(subject).to include "src=\"/images/diaporamas/#{page_id}/#{diaporama_name}/#{file}\""
			end
		end

		it 'should include all legends as titles' do
			data.each do |file, caption|
				expect(subject).to include "title=\"#{caption}\""
			end
		end

		it 'should include all legends as Fotorama captions' do
			data.each do |file, caption|
				expect(subject).to include "data-caption=\"#{caption}\""
			end
		end
	end
end

describe DiaporamaParser do
	describe '#parse' do
		subject { DiaporamaParser::parse(input) }

		context 'with one line' do
			let(:input) { 'file.png : legend' }

			it { should eq({ 'file.png' => 'legend' }) }
		end
	end
end
