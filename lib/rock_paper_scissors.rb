class RockPaperScissors
    SCORE_FOR_SHAPE = {
        'X' => 1,   # Rock
        'Y' => 2,   # Paper
        'Z' => 3    # Scissors
    }

    SCORE_FOR_RESULT = {
        'WIN' => 6,
        'DRAW' => 3,
        'LOSS' => 0
    }

    def calc_total_score(input_file)
        total_score = 0
        File.open(input_file) do |file|
            file.each_line do |line|
                plays = line.split(' ')
                total_score += calc_round_score(plays[0], plays[1])
            end
        end

        return total_score
    end

    def calc_round_score(they_play, i_play)
        return SCORE_FOR_GAME[they_play].call(i_play) + SCORE_FOR_SHAPE[i_play]
    end

    def self.rock_played(my_play)
        case my_play
            when 'X' then SCORE_FOR_RESULT['DRAW']
            when 'Y' then SCORE_FOR_RESULT['WIN']
            else SCORE_FOR_RESULT['LOSS']
        end
    end

    def self.paper_played(my_play)
        case my_play
            when 'X' then SCORE_FOR_RESULT['LOSS']
            when 'Y' then SCORE_FOR_RESULT['DRAW']
            else SCORE_FOR_RESULT['WIN']
        end
    end

    def self.scissors_played(my_play)
        case my_play
            when 'X' then SCORE_FOR_RESULT['WIN']
            when 'Y' then SCORE_FOR_RESULT['LOSS']
            else SCORE_FOR_RESULT['DRAW']
        end
    end
    # This apparently has to be _after_ the definition of each method it uses.
    # Not related to positioning of this map, but apparently methods called like
    # this also need to be static.
    SCORE_FOR_GAME = {
        'A' => method(:rock_played),
        'B' => method(:paper_played),
        'C' => method(:scissors_played),
    }
end

class RockPaperScissorsCorrected
    SCORE_FOR_SHAPE = {
        'ROCK' => 1,
        'PAPER' => 2,
        'SCISSORS' => 3
    }

    SCORE_FOR_RESULT = {
        'Z' => 6,   # Win
        'Y' => 3,   # Draw
        'X' => 0    # Lose
    }

    def calc_total_score(input_file)
        total_score = 0
        File.open(input_file) do |file|
            file.each_line do |line|
                split = line.split(' ')
                total_score += calc_round_score(split[0], split[1])
            end
        end

        return total_score
    end


    def calc_round_score(they_play, result)
        i_play = SHAPE_FOR_RESULT[they_play].call(result)
        return SCORE_FOR_SHAPE[i_play] + SCORE_FOR_RESULT[result]
    end

    def self.rock_played(result)
        case result 
            when 'X' then 'SCISSORS'
            when 'Y' then 'ROCK'
            else 'PAPER'
        end
    end

    def self.paper_played(result)
        case result 
            when 'X' then 'ROCK'
            when 'Y' then 'PAPER'
            else 'SCISSORS'
        end
    end

    def self.scissors_played(result)
        case result 
            when 'X' then 'PAPER'
            when 'Y' then 'SCISSORS'
            else 'ROCK'
        end
    end

    SHAPE_FOR_RESULT = {
        'A' => method(:rock_played),
        'B' => method(:paper_played),
        'C' => method(:scissors_played),
    }
end
