class TreehouseFinder
    def initialize(input_file)
      @input_file = input_file
      @tree_grid = populate_tree_grid()
      puts @tree_grid.to_s
      set_visibility()
      puts @tree_grid.to_s
    end

    def populate_tree_grid()
        File.readlines(@input_file)
            .map { |line| 
                line.chomp().split('').map{ |char|
                    Tree.new(char.to_i)
                }
            }
    end

    def set_visibility()
        max_rows = @tree_grid.length - 1
        max_cols = @tree_grid[0].length - 1

        # Go in order to set North and West
        for row in 0..max_rows do
            for col in 0..max_cols do
                # Set North
                if row != 0
                    @tree_grid[row][col].max_to_north = 
                        [
                            @tree_grid[row - 1][col].max_to_north,
                            @tree_grid[row - 1][col].height
                        ].max()
                else
                    @tree_grid[row][col].max_to_north = 0
                end
                
                # Set West
                if row != 0
                    @tree_grid[row][col].max_to_west = 
                        [
                            @tree_grid[row - 1][col].max_to_west,
                            @tree_grid[row - 1][col].height
                        ].max()
                else
                    @tree_grid[row][col].max_to_west = 0
                end
            end
        end

        # Go in reverse to set South and East
        max_rows.downto(0).each { |row|
            max_cols.downto(0).each { |col|
                puts "Row #{row} Col #{col}"
                # South
                if row != max_rows
                    @tree_grid[row][col].max_to_south = 
                        [
                            @tree_grid[row + 1][col].max_to_south,
                            @tree_grid[row + 1][col].height
                        ].max()
                else
                    puts "All the way south"
                    @tree_grid[row][col].max_to_south = 0
                end

                # East
                if col != max_cols
                    @tree_grid[row][col].max_to_east = 
                        [
                            @tree_grid[row][col + 1].max_to_east,
                            @tree_grid[row][col + 1].height
                        ].max()
                else
                    puts "All the way east"
                    @tree_grid[row][col].max_to_east = 0
                end
            }
        }
        
    end

    def count_visible_trees()
        visible_count = 0
        @tree_grid.each_with_index { |row, row_index|
            row.each_with_index { |tree, index|
                if tree_is_visible(tree) || tree_is_on_edge(@tree_grid, row_index, index)
                    puts "Visible at row #{row_index} index #{index}"
                    visible_count += 1
                end
            }
        }
        return visible_count
    end

    def tree_is_visible(tree)
        tree.height > tree.max_to_north ||
        tree.height > tree.max_to_south ||
        tree.height > tree.max_to_west ||
        tree.height > tree.max_to_east
    end

    def tree_is_on_edge(grid, row, column)
        row == 0 || column == 0 ||
        row == grid.length - 1 || column == grid[0].length - 1
    end
    
end

class Tree
    attr_reader :height
    attr_accessor :max_to_north, :max_to_south, :max_to_west, :max_to_east

    def initialize(height) #, max_to_north
        @height = height
    end
end


