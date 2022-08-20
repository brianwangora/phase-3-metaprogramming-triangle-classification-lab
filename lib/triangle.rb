class Triangle
  attr_reader :num1, :num2, :num3

  def initialize(num1, num2, num3)
    @num1 = num1
    @num2 = num2
    @num3 = num3
  end

  def kind
    validate_triangle
    if num1 == num2 && num2 == num3
      :equilateral
    elsif num1 == num2 || num2 == num3 || num1 == num3
      :isosceles
    else
      :scalene
    end
  end

  def sides_greater_than_zero?
    [num1, num2, num3].all?(&:positive?)
  end

  def valid_triangle_inequality?
    num1 + num2 > num3 && num1 + num3 > num2 && num2 + num3 > num1
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
  end

  class TriangleError < StandardError
  end

end
