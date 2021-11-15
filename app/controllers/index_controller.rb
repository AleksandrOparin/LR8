class String
  def palindrome?
    self == reverse
  end
end

class Integer
  def palindrome?
    to_s.palindrome?
  end
end

class IndexController < ApplicationController
  def input
  end

  def output
    @result = 0.upto(Integer(params[:InputNumber]))&.select { |number| number.palindrome? && (number**2).palindrome? }
  rescue ArgumentError
    @error = 'Некорректный ввод'
  rescue TypeError
    @error = 'Пустая строка'
  end
end
