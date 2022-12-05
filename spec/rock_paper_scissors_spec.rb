require 'rock_paper_scissors'

RSpec.describe RockPaperScissors do
    it 'returns the total score if the strategy guide is followed' do
        expected = 15

        actual = RockPaperScissors.new.calc_total_score('data/day_2/test_input.txt')
    
        expect(actual).to eq(expected)
    end

    it 'returns the total score if the strategy guide with corrected instructions is followed' do
        expected = 12

        actual = RockPaperScissorsCorrected.new.calc_total_score('data/day_2/test_input.txt')
    
        expect(actual).to eq(expected)
    end

    # it 'Day 2 solutions' do
    #     puts "Day 2 Solution 1 #{RockPaperScissors.new.calc_total_score('data/day_2/input.txt')}"
    #     puts "Day 2 Solution 2 #{RockPaperScissorsCorrected.new.calc_total_score('data/day_2/input.txt')}"
    # end
end
