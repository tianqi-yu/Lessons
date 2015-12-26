class RomanArabic
  @@table = {
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

  def self.translate(roman_arabic_array)
    array = []

    roman_arabic_array.each do |roman_arabic|
      array.push self.letters_to_arabic(roman_arabic) if roman_arabic.class == String
      array.push self.arabic_to_letters(roman_arabic) if roman_arabic.class == Fixnum
    end

    array
  end

  def self.roman_to_arabic(letter)
    letter = letter.to_sym
    @@table.has_key?(letter) ? @@table[letter] : false
  end

  def self.arabic_to_letters(number)
    result = ""
    new_number = number

    while new_number != 0
      @@table.each do |roman, arabic|
        times = new_number / arabic
        if times >= 1
          result += roman.to_s * times
          new_number = new_number % arabic
        end
      end
    end

    result
  end

  private
  def self.letters_to_arabic(letters)
    sum = 0
    index = 0

    while index < letters.length
      # First two letters in @@table ?
      two_numerals = roman_to_arabic(letters[index, 1])
      one_numeral  = roman_to_arabic(letters[index])

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
end
