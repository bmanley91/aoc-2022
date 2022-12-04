class CampCleanup
    def self.find_total_overlaps(input_file)
        total_overlap_count = 0
        File.open(input_file) do |file|
            file.each_line do |line|
                # Parse each line into pairs
                ranges = parse_range_line(line)
                # puts ranges.to_s
                if does_range_contain(ranges[0], ranges[1]) || does_range_contain(ranges[1], ranges[0])
                    total_overlap_count+=1
                end
            end
        end
        return total_overlap_count
    end

    # Split format 1-2,3-4 into two ranges
    def self.parse_range_line(file_line)
        range_strings = file_line.split(',')
        range_strings.map { |range_string|
            numbers = range_string.split('-')
            CleanupRange.new(numbers[0].to_i, numbers[1].to_i)
        }
    end

    def self.does_range_contain(range1, range2)
        range1.start <= range2.start && range1.finish >= range2.finish
    end
end

CleanupRange = Struct.new('CleanupRange', :start, :finish)
