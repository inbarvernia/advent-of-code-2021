def sonar_sweep
  counter = 0
  previous_line = nil
  File.foreach("puzzle_input.txt") do |line|
    line = line.to_i
    if !previous_line.nil?
      if line > previous_line
        counter += 1
      end
    end
    previous_line = line
  end
  counter
end
