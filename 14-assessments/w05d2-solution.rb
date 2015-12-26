$table = {
  "M": 1000,
  "CM": 900,
  "D": 500,
  "CD": 400,
  "C": 100,
  "XC": 90,
  "L": 50,
  "XL": 40,
  "X": 10,
  "IX": 9,
  "V": 5,
  "IV": 4,
  "I": 1,
}

def roman_to_arabic(letter)
  letter = letter.to_sym
  $table.has_key?(letter) ? $table[letter] : nil
end

def letters_to_arabic(letters)
  sum = 0
  index = 0

  while index < letters.length
    two_numerals = roman_to_arabic(letters[index, 2])
    one_numeral = roman_to_arabic(letters[index])

    if two_numerals
      sum += two_numerals
      index += 2
    else
      sum += one_numeral
      index += 1
    end
  end

  sum
end

# puts letters_to_arabic("CCXCI")

def arabic_to_letters(number)

  result = ""
  new_number = number

  while new_number != 0
    $table.each do |roman, arabic|
      times = new_number / arabic
      if times >= 1
        result += roman.to_s * times
        new_number = new_number % arabic
      end
    end
  end

  result
end

# puts arabic_to_letters(1999)

def transform(array)
  array.each_with_index do |item, index|
    if item.class == String
      array[index] = letters_to_arabic(item)
    elsif item.class == Fixnum
      array[index] = arabic_to_letters(item)
    end
  end

  array
end

puts transform(["III", 29, 38, "CCXCI", 1999])
# [3, "XXIX", "XXXVIII", 291, "MCMXCIX"]