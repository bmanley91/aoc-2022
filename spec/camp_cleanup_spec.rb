require 'camp_cleanup'

RSpec.describe CampCleanup do
    it 'returns the total number of pairs in which one range completely contains the other' do
    expected = 2

    actual = CampCleanup.find_total_overlaps('data/day_4/test_input.txt')
    
    expect(actual).to eq(expected)
    end
end
