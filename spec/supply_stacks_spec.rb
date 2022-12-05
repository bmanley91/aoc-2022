require 'supply_stacks'

RSpec.describe SupplyStacks do
    it 'returns the letter for the crate on top of each stack' do
        expected = 'CMZ'

        actual = SupplyStacks.find_top_crates('data/day_5/test_input.txt')
        
        expect(actual).to eq(expected)
    end
end
