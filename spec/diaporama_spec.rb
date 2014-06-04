ROOT_FOLDER		= "#{File.dirname(__FILE__)}/.."

require_relative "../_plugins/diaporama_helpers.rb"

describe Fotorama do
	describe '#render' do
		let(:page_id) { 'test_id' }
		let(:diaporama_name) { 'test_name' }

		subject { Fotorama::render(page_id, diaporama_name, data) }

		shared_examples 'fotorama renderer' do
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

		context 'with a multiline legend' do
			let(:data) do
				{ 'file.jpg' => 'Legend.\nAnother line.' }
			end

			it 'should include the legend as a single-line title' do
				expect(subject).to include "title=\"Legend. Another line.\""
			end

			it 'should include the legend as a multi-line Fotorama caption' do
				expect(subject).to include "data-caption=\"Legend.&lt;br/&gt;Another line.\""
			end
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
