require 'rock_paper_scissors'

RSpec.describe RockPaperScissors do
    it 'returns the total score if the strategy guide is followed' do
        expected = 15

        actual = RockPaperScissors.calc_total_score('data/day_2/test_input.txt')
    
        expect(actual).to eq(expected)
    end
end
