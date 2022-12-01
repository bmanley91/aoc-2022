class CalorieCounter
  def max_calories(input_file)
    max_so_far = 0
    current_total = 0
    File.open(input_file) do |f|
      f.each_line do |line|
        if line =~ /^[[:space:]]*$/
          # Reset running total when we hit a blank line
          current_total = 0
        else
          # If line has content, add it to the current total.
          # Then check to see if current total is greater than the max so far
          current_total += line.to_i
          max_so_far = current_total if current_total > max_so_far
        end
      end
    end

    max_so_far
  end

  # I wanted to do this with a heap
  # BUT APPARENTLY RUBY DOESN'T HAVE THOSE
  def max_calories_from_top_x(input_file, count)
    elves = []
    current_total = 0
    File.open(input_file) do |f|
      f.each_line do |line|
        if line =~ /^[[:space:]]*$/
          # When we hit a blank we're done counting for this elf
          elves.push(current_total)
          current_total = 0
        else
          # If line has content, add it to the current total.
          current_total += line.to_i
        end
      end
      # Add last elf to the array
      elves.push(current_total)
    end

    # Sort the array of elves descending
    # Take the top X
    # Sum their values
    elves.sort_by(&:-@).take(count).sum
  end
end
