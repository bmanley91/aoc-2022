require 'camp_cleanup'

RSpec.describe CampCleanup do
    it 'returns the total number of pairs in which one range completely contains the other' do
        expected = 2

        actual = CampCleanup.find_full_overlaps('data/day_4/test_input.txt')
        
        expect(actual).to eq(expected)
    end

    it 'returns the total number of pairs which have an overlap' do
        expected = 4

        actual = CampCleanup.find_any_overlaps('data/day_4/test_input.txt')
        
        expect(actual).to eq(expected)
    end

    it 'Day 4 solutions' do
        puts "Day 4 Solution 1 #{CampCleanup.find_full_overlaps('data/day_4/input.txt')}"
        puts "Day 4 Solution 2 #{CampCleanup.find_any_overlaps('data/day_4/input.txt')}"
    end
end
