require 'calorie_counter'

RSpec.describe CalorieCounter do
  it 'returns the highest number of calories carried by a single elf' do
    EXPECTED = 24_000

    counter = CalorieCounter.new
    actual = counter.max_calories('data/day_1/test_input.txt')

    expect(actual).to eq(EXPECTED)
  end

  it 'returns the total carried by the 3 elves with the most calories' do
    EXPECTED = 45_000

    counter = CalorieCounter.new
    actual = counter.max_calories_from_top_x('data/day_1/input.txt', 3)

    expect(actual).to eq(EXPECTED)
  end
end
