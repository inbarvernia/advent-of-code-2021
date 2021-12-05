def diagnose
  binaries = File.read('input.txt').split(/\n/)
  # binaries = ["00100", "11110", "10110", "10111", "10101", "01111", "00111", "11100", "10000", "11001", "00010", "01010"]

  ones = 0
  zeroes = 0
  oxygen_arr = binaries
  co2_arr = binaries
  oxygen_rating = 0
  co2_rating = 0

  for i in (0..binaries[0].length - 1)
    oxygen_arr.each do |number|
      if number[i] == "1"
        ones += 1
      else
        zeroes += 1
      end
    end
    
    if ones >= zeroes
      oxygen_arr = oxygen_arr.select { |num| num[i] == "1" }
    else
      oxygen_arr = oxygen_arr.select { |num| num[i] == "0" }
    end

    if oxygen_arr.length == 1
      oxygen_rating = oxygen_arr[0].to_i(2)
      break
    end
    
    ones = 0
    zeroes = 0
  end

  for i in (0..binaries[0].length - 1)
    co2_arr.each do |num|
      if num[i] == "1"
        ones += 1
      else
        zeroes += 1
      end
    end

    if ones >= zeroes
      co2_arr = co2_arr.select { |num| num[i] == "0" }
    else
      
      co2_arr = co2_arr.select { |num| num[i] == "1" }
    end

    if co2_arr.length == 1
      co2_rating = co2_arr[0].to_i(2)
      break
    end
    
    ones = 0
    zeroes = 0
  end

  life_support_rating = oxygen_rating * co2_rating

  p life_support_rating
end

diagnose