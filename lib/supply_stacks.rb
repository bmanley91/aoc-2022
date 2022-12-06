require 'cgi'

class SupplyStacks
    def self.find_top_crates(input_file)
        file_lines = File.readlines(input_file)

        # Find the row with the number of stacks
        column_def_row_index = find_column_def_row(file_lines)

        stacks =  initialize_stacks(file_lines, column_def_row_index)

        # Instructions start two lines after the column definition row
        process_instructions(stacks, file_lines.drop(column_def_row_index+2))

        return build_result(stacks)
    end

    def self.find_top_crates_v2(input_file)
        file_lines = File.readlines(input_file)

        # Find the row with the number of stacks
        column_def_row_index = find_column_def_row(file_lines)

        stacks =  initialize_stacks(file_lines, column_def_row_index)

        # Instructions start two lines after the column definition row
        process_instructions(stacks, file_lines.drop(column_def_row_index+2), true)

        return build_result(stacks)
    end

    def self.find_column_def_row(lines)
        lines.each_with_index do |line, index|
            if line.match(/^ 1/)
                return index
            end
        end
    end

    def self.initialize_stacks(lines, index)
        stacks = []
        row_with_column_defs = lines[index]
        
        # Stupid hack. The string ends with ' \n' and assuming the columns will be correctly numbered in the input file. 
        # This char will be the number of stacks.
        number_of_columns = row_with_column_defs[-3].to_i
        while stacks.length < number_of_columns do
            stacks.push([])
        end

        # Go through the rows in reverse order, starting with the one about the stack definition row
        for i in (index-1).downto(0) do
            chunks = lines[i].scan(/.{4}/m)
            chunks.each_with_index do |chunk, chunk_index|
                crate_letter = chunk.match /\[(\w)\]/
                if crate_letter
                    # Need this index because ruby matcher goofiness
                    stacks[chunk_index].push(crate_letter[1])
                end
            end
        end

        return stacks
    end

    def self.process_instructions(stacks, instruction_lines, is_v2=false)
        instruction_lines.each do |line|
            instruction = parse_instruction_line(line)
            if (is_v2)
                execute_instruction_v2(stacks, instruction)
            else
                execute_instruction(stacks, instruction)
            end
        end
    end

    def self.parse_instruction_line(instruction_string)
        matcher = instruction_string.match /move (?<count>\d+) from (?<from>\d+) to (?<to>\d+)/
        return InstructionDetails.new(matcher[:count].to_i, matcher[:from].to_i - 1, matcher[:to].to_i - 1)
    end

    def self.execute_instruction(stacks, instruction)
        crates_to_move = [] 
        while crates_to_move.length < instruction[:count] do
            crates_to_move.push(stacks[instruction[:from]].pop())
        end

        while !crates_to_move.empty? do
            stacks[instruction[:to]].push(crates_to_move.shift())
        end
    end

    def self.execute_instruction_v2(stacks, instruction)
        crates_to_move = [] 
        while crates_to_move.length < instruction[:count] do
            crates_to_move.push(stacks[instruction[:from]].pop())
        end

        while !crates_to_move.empty? do
            stacks[instruction[:to]].push(crates_to_move.pop())
        end
    end

    def self.build_result(stacks)
        stacks.map{|stack| stack[-1]}.join('')
    end

    InstructionDetails = Struct.new(:count, :from, :to)
end
