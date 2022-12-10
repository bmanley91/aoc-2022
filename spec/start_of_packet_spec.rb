require 'start_of_packet'

RSpec.describe StartOfPacket do
    it 'returns the number of characters processed before the first start of packet' do
        expected = 7

        actual = StartOfPacket.chars_until_start_of_packet('data/day_6/test_input.txt')

        expect(actual).to eq(expected)
    end

    it 'returns the number of characters processed before the first start of message' do
        expected = 19

        actual = StartOfPacket.chars_until_start_of_message('data/day_6/test_input.txt')

        expect(actual).to eq(expected)
    end

    # it 'Day 6 Solutions' do
    #     puts
    #     puts "Day 6 Solution 1: #{StartOfPacket.chars_until_start_of_packet('data/day_6/input.txt')}"
    #     puts "Day 6 Solution 2: #{StartOfPacket.chars_until_start_of_message('data/day_6/input.txt')}"
    # end
end
