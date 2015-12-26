require 'roman_arabic'
require_relative 'spec_helper'

describe RomanArabic, "#translate" do
  it "should return the correct values for each type passed" do
    translated = RomanArabic.translate(["III", 29, 38, "CCXCI", 1999])
    translated[0].should == 3
    translated[1].should == "XXIX"
    translated[2].should == "XXXVIII"
    translated[3].should == 291
    translated[4].should == "MCMXCIX"
  end
end

describe RomanArabic, "#letters_to_arabic" do
  describe "One numeral" do
    it "should return 1 with an I string" do
      arabic = RomanArabic.letters_to_arabic('I')
      arabic.should == 1
    end

    it "should return 5 with an V string" do
      arabic = RomanArabic.letters_to_arabic('V')
      arabic.should == 5
    end

    it "should return 10 with an X string" do
      arabic = RomanArabic.letters_to_arabic('X')
      arabic.should == 10
    end

    it "should return 50 with an L string" do
      arabic = RomanArabic.letters_to_arabic('L')
      arabic.should == 50
    end

    it "should return 100 with an C string" do
      arabic = RomanArabic.letters_to_arabic('C')
      arabic.should == 100
    end

    it "should return 500 with an D string" do
      arabic = RomanArabic.letters_to_arabic('D')
      arabic.should == 500
    end
  end

  describe "Two_numerals" do
    it "should return 4 with an IV string" do
      arabic = RomanArabic.letters_to_arabic('IV')
      arabic.should == 4
    end

    it "should return 9 with an IX string" do
      arabic = RomanArabic.letters_to_arabic('IX')
      arabic.should == 9
    end

    it "should return 40 with an XL string" do
      arabic = RomanArabic.letters_to_arabic('XL')
      arabic.should == 40
    end

    it "should return 90 with an XC string" do
      arabic = RomanArabic.letters_to_arabic('XC')
      arabic.should == 90
    end

    it "should return 400 with an CD string" do
      arabic = RomanArabic.letters_to_arabic('CD')
      arabic.should == 400
    end

    it "should return 900 with an CM string" do
      arabic = RomanArabic.letters_to_arabic('CM')
      arabic.should == 900
    end
  end

  describe "Adding numbers together" do
    it "should return 2 with an II string" do
      arabic = RomanArabic.letters_to_arabic('II')
      arabic.should == 2
    end

    it "should return 3 with an III string" do
      arabic = RomanArabic.letters_to_arabic('III')
      arabic.should == 3
    end

    it "should return 6 with an VI string" do
      arabic = RomanArabic.letters_to_arabic('VI')
      arabic.should == 6
    end

    it "should return 7 with an VII string" do
      arabic = RomanArabic.letters_to_arabic('VII')
      arabic.should == 7
    end
  end

end

describe RomanArabic, "#roman_to_arabic" do
  it "should return false with an FER string" do
    arabic = RomanArabic.roman_to_arabic('FER')
    arabic.should == false
  end

  it "should return 1 with an I string" do
    arabic = RomanArabic.roman_to_arabic('I')
    arabic.should == 1
  end

  it "should return 4 with an IV string" do
    arabic = RomanArabic.roman_to_arabic('IV')
    arabic.should == 4
  end

  it "should return 5 with an V string" do
    arabic = RomanArabic.roman_to_arabic('V')
    arabic.should == 5
  end

  it "should return 9 with an IX string" do
    arabic = RomanArabic.roman_to_arabic('IX')
    arabic.should == 9
  end

  it "should return 10 with an X string" do
    arabic = RomanArabic.roman_to_arabic('X')
    arabic.should == 10
  end

  it "should return 40 with an XL string" do
    arabic = RomanArabic.roman_to_arabic('XL')
    arabic.should == 40
  end

  it "should return 50 with an L string" do
    arabic = RomanArabic.roman_to_arabic('L')
    arabic.should == 50
  end

  it "should return 90 with an XC string" do
    arabic = RomanArabic.roman_to_arabic('XC')
    arabic.should == 90
  end

  it "should return 100 with an C string" do
    arabic = RomanArabic.roman_to_arabic('C')
    arabic.should == 100
  end

  it "should return 400 with an CD string" do
    arabic = RomanArabic.roman_to_arabic('CD')
    arabic.should == 400
  end

  it "should return 500 with an D string" do
    arabic = RomanArabic.roman_to_arabic('D')
    arabic.should == 500
  end

  it "should return 900 with an CM string" do
    arabic = RomanArabic.roman_to_arabic('CM')
    arabic.should == 900
  end

  it "should return 1000 with an M string" do
    arabic = RomanArabic.roman_to_arabic('M')
    arabic.should == 1000
  end
end
