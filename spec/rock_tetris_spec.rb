require 'rock_tetris'

RSpec.describe RockTetris do
    it 'returns the height of the tower after the given number of rocks' do
        expected = 3068

        actual = RockTetris.find_height('data/day_17/test_input.txt', 2022)

        expect(actual).to eq(expected)
    end
    
end
