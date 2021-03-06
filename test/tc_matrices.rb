require "matrc"
require "test/unit"

class MatEntero < Matrc::MatrizDensa
  def zero
    0
  end
end

class MatFraction < Matrc::MatrizDensa
  def zero
    Matrc::Fraction.new(0, 1)
  end
end


class TestMatrizDensa < Test::Unit::TestCase

  def setup
     
    @m1 = MatEntero.new(2, 2)
    @m2 = MatEntero.new(2, 2)
    @m3 = MatEntero.new(2, 2)
   
    @mf1 = MatFraction.new(2,2)
    @mf2 = MatFraction.new(2,2)
    @mf3 = MatFraction.new(2,2)


    @m1[0, 0] = 1
    @m1[0, 1] = 2
    @m1[1, 0] = 3
    @m1[1, 1] = 4

    @m2[0, 0] = 2
    @m2[0, 1] = 3
    @m2[1, 0] = 4
    @m2[1, 1] = 5

        
    @mf1[0, 0] = Matrc::Fraction.new(1, 4)
    @mf1[0, 1] = Matrc::Fraction.new(1, 4)
    @mf1[1, 0] = Matrc::Fraction.new(1, 4)
    @mf1[1, 1] = Matrc::Fraction.new(1, 4)

    @mf2[0, 0] = Matrc::Fraction.new(1, 4)
    @mf2[0, 1] = Matrc::Fraction.new(1, 4)
    @mf2[1, 0] = Matrc::Fraction.new(1, 4)
    @mf2[1, 1] = Matrc::Fraction.new(1, 4)

   
  end

  def tear_down
    #nothing
  end

   def test_simple
    @m3[0, 0] = 3
    @m3[0, 1] = 5
    @m3[1, 0] = 7
    @m3[1, 1] = 9		
    assert_equal(@m3, @m1+@m2)
    
    @m3[0, 0] = -1
    @m3[0, 1] = -1
    @m3[1, 0] = -1
    @m3[1, 1] = -1	
    assert_equal(@m3, @m1-@m2)

    @m3[0, 0] = 10
    @m3[0, 1] = 13
    @m3[1, 0] = 22
    @m3[1, 1] = 29	
    assert_equal(@m3, @m1*@m2)

    @mf3[0, 0] = Matrc::Fraction.new(1, 2)
    @mf3[0, 1] = Matrc::Fraction.new(1, 2)
    @mf3[1, 0] = Matrc::Fraction.new(1, 2)
    @mf3[1, 1] = Matrc::Fraction.new(1, 2)
    assert_equal(@mf3,@mf1+@mf2)

    @mf3[0, 0] = Matrc::Fraction.new(1, 8)
    @mf3[0, 1] = Matrc::Fraction.new(1, 8)
    @mf3[1, 0] = Matrc::Fraction.new(1, 8)
    @mf3[1, 1] = Matrc::Fraction.new(1, 8)
    assert_equal(@mf3,@mf1*@mf2)
    
    end

   def test_failure
		 @mf3[0, 0] = Matrc::Fraction.new(1, 2)
     @mf3[0, 1] = Matrc::Fraction.new(1, 2)
     @mf3[1, 0] = Matrc::Fraction.new(1, 2)
     @mf3[1, 1] = Matrc::Fraction.new(1, 2)
     assert_not_equal(@mf3,@mf1*@mf2)
   end

  def test_type
    assert_kind_of(MatEntero, @m1)
    assert_kind_of(MatFraction, @mf2)
  end
     
   
end

class MatEnterod < Matrc::MatrizDispersa
  def zero
    0
  end
end

class MatFractiond < Matrc::MatrizDispersa
  def zero
    Matrc::Fraction.new(0, 1)
  end
end

class TestMatrizDispersa < Test::Unit::TestCase

  def setup
     
    @md = MatEnterod.new(2,2)
    @mdf = MatFractiond.new(2,2)
    @mdf1 = MatFractiond.new(2,2)
   
    @md[0, 0] = 2
    @md[0, 1] = 0 
    @md[1, 0] = 0     
    @md[1, 1] = 5

    @mdf[0, 0] = Matrc::Fraction.new(0, 1)
    @mdf[0, 1] = Matrc::Fraction.new(0, 1)   
    @mdf[1, 0] = Matrc::Fraction.new(0, 1)
    @mdf[1, 1] = Matrc::Fraction.new(1, 5)

  end

   def test_simple
    @mdf1[0, 0] = Matrc::Fraction.new(2, 1)
    @mdf1[0, 1] = Matrc::Fraction.new(0, 1)
    @mdf1[1, 0] = Matrc::Fraction.new(0, 1)
    @mdf1[1, 1] = Matrc::Fraction.new(26, 5)		
    assert_equal(@mdf1, @mdf+@md)

   end

   def test_failure
     @mdf1[0, 0] = Matrc::Fraction.new(1, 2)
     @mdf1[0, 1] = Matrc::Fraction.new(1, 2)
     @mdf1[1, 0] = Matrc::Fraction.new(1, 2)
     @mdf1[1, 1] = Matrc::Fraction.new(1, 2)
     assert_not_equal(@mdf1, @mdf-@md)
   end
     
   
end


