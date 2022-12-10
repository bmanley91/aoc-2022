require 'treehouse_finder'

RSpec.describe TreehouseFinder do
    it 'returns the number of trees visibile from outside the grid' do
        expected = 21

        actual = TreehouseFinder.new('data/day_8/test_input.txt').count_visible_trees()

        expect(actual).to eq(expected)
    end

    # it 'Day 8 Solutions' do
    #     puts
    #     puts "Day 8 Solution 1: #{TreehouseFinder.new('data/day_8/input.txt').count_visible_trees()}"
    # end
end
