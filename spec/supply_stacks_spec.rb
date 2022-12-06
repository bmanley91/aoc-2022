require 'supply_stacks'

RSpec.describe SupplyStacks do
    it 'returns the letter for the crate on top of each stack' do
        expected = 'CMZ'

        actual = SupplyStacks.find_top_crates('data/day_5/test_input.txt')

        expect(actual).to eq(expected)
    end

    it 'returns the letter for the crate on top of each stack' do
        expected = 'MCD'

        actual = SupplyStacks.find_top_crates_v2('data/day_5/test_input.txt')

        expect(actual).to eq(expected)
    end

    # it 'Day 5 Solutions' do
    #     puts "Day 5 Solution 1: #{SupplyStacks.find_top_crates('data/day_5/input.txt')}"
    #     puts "Day 5 Solution 2: #{SupplyStacks.find_top_crates_v2('data/day_5/input.txt')}"
    # end
end
