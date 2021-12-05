def dive
  commands = File.read('input.txt').split(/\n/)
  # commands = ["forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2"]

  horizontal_position = 0
  aim = 0
  depth = 0

  commands.each do |command|
    if command.start_with? "down"
      aim += command.gsub(/\D/, '').to_i
    elsif command.start_with? "up"
      aim -= command.gsub(/\D/, '').to_i
    else
      number = command.gsub(/\D/, '').to_i
      horizontal_position += number
      depth += (aim * number)
    end
  end

  horizontal_position * depth
end
