class RopeBridge
    def self.find_unique_tail_positions(input_file)
        # Define starting positions
        head_position = Position.new(0, 0)
        tail_position = Position.new(0, 0)

        # Keep track of unique positions that the tail visits
        tail_positions = Set.new()
        
        # Add initial position to set
        tail_positions.add(tail_position)

        instructions = read_instructions_from_file(input_file)

        instructions.each do |instruction|
            # Move step by step
            step = 0
            while step < instruction.amount do
                # Save where head starts
                # If tail has to move, it will go to where head was
                head_original = head_position

                head_position = move_head(head_position, instruction.direction)

                # If we have to move the tail, add the new position to the set
                if tail_should_move(head_position, tail_position)
                    tail_position = head_original
                    tail_positions.add(tail_position)
                end

                step += 1
            end
        end

        return tail_positions.size()
    end

    def self.read_instructions_from_file(input_file)
         File.readlines(input_file).map { |line| 
            split_str = line.chomp.split(' ')
            Instruction.new(split_str[0], split_str[1].to_i)
        }
    end

    # Tail should only move if it's no longer touching Head
    def self.tail_should_move(head_position, tail_position)
        (head_position.y - tail_position.y).abs() > 1 ||    # Check Up/Down
        (head_position.x - tail_position.x).abs() > 1       # Check Left/Right
    end

    def self.move_head(starting_position, direction)
        case direction
        when 'U'
            return Position.new(starting_position.x, starting_position.y + 1)
        when 'D'
            return Position.new(starting_position.x, starting_position.y - 1)
        when 'L'
            return Position.new(starting_position.x - 1, starting_position.y)
        else 'R'
            return Position.new(starting_position.x + 1, starting_position.y)
        end
    end

    Position = Struct.new(:x, :y)
    Instruction = Struct.new(:direction, :amount)
end
