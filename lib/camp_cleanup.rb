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

    def self.parse_range_line(file_line)
        matches = file_line.match /(?<r1_start>\d+)-(?<r1_end>\d+),(?<r2_start>\d+)-(?<r2_end>\d+)/
        return [(matches[:r1_start]...matches[:r1_end]), (matches[:r2_start]...matches[:r2_end])]
    end

    def self.does_range_contain(range1, range2)
        return range1.begin <= range2.end && range1.begin >= range2.end
    end

    def self.do_ranges_overlap(range1, range2)
        return range2.begin <= range1.end && range1.begin <= range2.end
    end
end
