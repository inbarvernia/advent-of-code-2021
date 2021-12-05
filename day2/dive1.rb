def dive
  commands = File.read('input.txt').split(/\n/)

  x_commands = []
  y_commands = []

  commands.each do |command|
    if command.start_with? "forward"
      x_commands << command.gsub(/\D/, '').to_i
    elsif command.start_with? "down"
      y_commands << command.gsub(/\D/, '').to_i
    else
      y_commands << command.gsub(/\D/, '').to_i * (-1)
    end
  end

  x = x_commands.sum
  y = y_commands.sum

  x * y
end
