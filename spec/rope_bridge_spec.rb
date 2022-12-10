require 'rope_bridge'

RSpec.describe RopeBridge do
    it 'returns the number of unique locations that the tail visited' do
        expected = 13

        actual = RopeBridge.find_unique_tail_positions('data/day_9/test_input.txt')

        expect(actual).to eq(expected)
    end

    it 'Day 6 Solutions' do
        puts
        puts "Day 7 Solution 1: #{RopeBridge.find_unique_tail_positions('data/day_9/input.txt')}"
        # puts "Day 6 Solution 2: #{StartOfPacket.chars_until_start_of_message('data/day_6/input.txt')}"
    end
end
