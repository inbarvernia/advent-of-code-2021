def diagnose
  binaries = File.read('input.txt').split(/\n/)
  # binaries = ["00100", "11110", "10110", "10111", "10101", "01111", "00111", "11100", "10000", "11001", "00010", "01010"]

  oxygen_arr = binaries
  co2_arr = binaries
  
  oxygen_rating = minimise(oxygen_arr, 'ox')[0].to_i(2)
  co2_rating = minimise(co2_arr, 'co2')[0].to_i(2)

  life_support_rating = oxygen_rating * co2_rating
end

def minimise(array, type)
  for i in (0..array[0].length - 1)
    ones = 0
    zeroes = 0

    array.each do |number|
      if number[i] == "1"
        ones += 1
      else
        zeroes += 1
      end
    end
    
    case type
    when "ox"
      if ones >= zeroes
        array = array.select { |num| num[i] == "1" }
      else
        array = array.select { |num| num[i] == "0" }
      end
    when "co2"
      if ones >= zeroes
        array = array.select { |num| num[i] == "0" }
      else
        array = array.select { |num| num[i] == "1" }
      end
    end

    if array.length == 1
      return array
    end
  end
end
