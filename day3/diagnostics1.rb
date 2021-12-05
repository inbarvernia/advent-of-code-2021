def diagnose
  binaries = File.read('input.txt').split(/\n/)
  # binaries = ["00100", "11110", "10110", "10111", "10101", "01111", "00111", "11100", "10000", "11001", "00010", "01010"]

  ones = []
  zeroes = []
  gamma_arr = []

  for i in (0..binaries[0].length - 1)
    binaries.each do |num|
      if num[i] == "1"
        ones << num[i]
      else
        zeroes << num[i]
      end
    end

    if ones.length > zeroes.length
      gamma_arr << "1"
    else
      gamma_arr << "0"
    end
    
    ones = []
    zeroes = []
  end

  epsilon_arr = gamma_arr.map { |num| num == "1" ? num = "0" : num = "1" }
  epsilon_rate = epsilon_arr.join.to_i(2)
  gamma_rate = gamma_arr.join.to_i(2)

  power_consumption = epsilon_rate * gamma_rate
end
