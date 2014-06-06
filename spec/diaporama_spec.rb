ROOT_FOLDER		= "#{File.dirname(__FILE__)}/.."

require_relative "../_plugins/diaporama_helpers.rb"

describe Fotorama do
	shared_examples 'metadata renderer' do
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

	describe '#html_metadata' do

		subject { Fotorama::html_metadata(caption) }

		context 'with a multiline legend' do
			let(:caption) { 'Legend.\nAnother line.' }

			it { should include "title=\"Legend. Another line.\"" }

			it { should include "data-caption=\"Legend.&lt;br/&gt;Another line.\"" }
		end
	end

	describe '#render' do
		let(:page_id) { 'test_id' }
		let(:diaporama_name) { 'test_name' }

		subject { Fotorama::render(page_id, diaporama_name, data) }

		shared_examples 'fotorama renderer' do
			it { should include '<img' }

			it_should_behave_like 'metadata renderer'

			it 'should link the first image as an img for degradability' do
				file = data.keys[0]

				expect(subject).to include "src=\"/images/diaporamas/#{page_id}/#{diaporama_name}/#{file}\""
			end

			it 'should lazy-load all other images' do
				lazy_loaded = data.clone
				lazy_loaded.shift

				lazy_loaded.each do |file, caption|
					expect(subject).to include "href=\"/images/diaporamas/#{page_id}/#{diaporama_name}/#{file}\""
				end
			end

			it { should_not include '""' }
		end


		context 'with one entry' do
			let(:data) do
				{ 'file.jpg' => 'legend' }
			end

			it_should_behave_like 'fotorama renderer'
		end

		context 'with multiple entries' do
			let(:data) do
				{ 'file.png' => 'legend', 'second file.jpg' => 'another legend' }
			end

			it_should_behave_like 'fotorama renderer'
		end
	end
end

describe DiaporamaParser do
	describe '#parse' do
		subject { DiaporamaParser::parse(input) }

		context 'with one entry' do
			let(:input) do
<<INPUT
file.png
legend
INPUT
			end

			it { should eq({ 'file.png' => 'legend' }) }
		end

		context 'with leading whitespace' do
			let(:input) do
<<INPUT

file.png
legend
INPUT
			end

			it { should eq({ 'file.png' => 'legend' }) }
		end

		context 'with multiple entries' do
			let(:input) do
<<INPUT
file.png
legend

second file.jpg
another legend
INPUT
			end

			it { should eq({ 'file.png' => 'legend', 'second file.jpg' => 'another legend' }) }
		end

				context 'with a multiline entry' do
			let(:input) do
<<INPUT
file.png
legend first line
legend second line
INPUT
			end

			it { should eq({ 'file.png' => 'legend first line\nlegend second line' }) }
		end
	end
end
