class CampCleanup
    def self.find_full_overlaps(input_file)
        full_overlap_count = 0
        File.open(input_file) do |file|
            file.each_line do |line|
                ranges = parse_range_line(line)

                if does_range_contain(ranges[0], ranges[1]) || does_range_contain(ranges[1], ranges[0])
                    full_overlap_count+=1
                end
            end
        end
        return full_overlap_count
    end

    def self.find_any_overlaps(input_file)
        overlap_count = 0
        File.open(input_file) do |file|
            file.each_line do |line|
                ranges = parse_range_line(line)
                
                if do_ranges_overlap(ranges[0], ranges[1])
                    overlap_count+=1
                end
            end
        end
        return overlap_count
    end

    # Split format 1-2,3-4 into two range structs
    def self.parse_range_line(file_line)
        range_strings = file_line.split(',')
        return range_strings.map { |range_string|
            numbers = range_string.split('-')
            CleanupRange.new(numbers[0].to_i, numbers[1].to_i)
        }
    end

    def self.does_range_contain(range1, range2)
        return range1.start <= range2.start && range1.finish >= range2.finish
    end

    def self.do_ranges_overlap(range1, range2)
        return range2.start <= range1.finish && range1.start <= range2.finish
    end
end

CleanupRange = Struct.new('CleanupRange', :start, :finish)
