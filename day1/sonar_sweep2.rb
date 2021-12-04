def sonar_sweep
  counter = 0

  file = File.open('puzzle_input.txt')
  measurements = file.read.split().map(&:to_i)
  file.close

  new_measurements = []

  measurements.each_with_index do |num, index|
    if index < (measurements.length - 2)
      new_measurements.push(measurements[index] + measurements[index + 1] + measurements[index + 2])
    end
  end
  previous_value = nil
  new_measurements.each do |value|
    if !previous_value.nil?
      if value > previous_value
        counter += 1
      end
    end
    previous_value = value
  end
  counter
end
