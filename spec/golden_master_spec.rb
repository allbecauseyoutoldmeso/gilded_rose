golden_master = File.read('golden_master.txt')
golden_master_lines = golden_master.split("\n")

current_output = `ruby texttest_fixture.rb 40 'gilded_rose.rb'`
current_output_lines = current_output.split("\n")

lines_to_compare = [golden_master_lines.count, current_output_lines.count].max

describe 'Golden Master for GildedRose' do
  lines_to_compare.times do |line_num|
    it "match line #{line_num}: #{current_output_lines[line_num]} should equal #{golden_master_lines[line_num]}" do
      expect(current_output_lines[line_num]).to eq golden_master_lines[line_num]
    end
  end
end
