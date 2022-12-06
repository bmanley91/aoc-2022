class StartOfPacket
    def self.chars_until_start_of_packet(input_file)
        chars_until_marker(input_file, 4)
    end

    def self.chars_until_start_of_message(input_file)
        chars_until_marker(input_file, 14)
    end

    def self.chars_until_marker(input_file, marker_size)
        # File should only have one line
        # So only read the first
        buffer = File.open(input_file, &:readline)

        # If the string is shorter than the size of the marker we have a problem
        if buffer.length < marker_size
            return -1
        end

        # Keep track of chars in window with a queue and a map
        # If the map ever has a size matching the marker then we have the right number of unique chars
        # The queue is used to keep track of what char to remove from the map
        queue = []
        char_map = Hash[]
        index = 0

        while index < marker_size
            queue.push(buffer[index])
            add_to_char_map(char_map, buffer[index])
            
            index += 1
        end

        while index < buffer.length && char_map.length != marker_size
            # First remove old char
            old_char = queue.shift()
            remove_char_from_map(char_map, old_char)

            # Then add new one
            queue.push(buffer[index])
            add_to_char_map(char_map, buffer[index])

            index += 1
        end

        return char_map.length == marker_size ? index : -1
    end

    def self.add_to_char_map(char_map, char) 
        if char_map[char]
            char_map[char] = char_map[char] + 1
        else
            char_map[char] = 1
        end
    end

    def self.remove_char_from_map(char_map, char) 
        if char_map[char] == 1
            char_map.delete(char)
        else
            char_map[char] = char_map[char] - 1
        end
    end
end
