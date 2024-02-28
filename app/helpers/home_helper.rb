module HomeHelper
  def generate_numbers
    numbers = []

    1.upto(6) do |x| 
      number = Random.rand(1..60)
      numbers.any?(number) ? redo : numbers << number
    end
    numbers.join("-")
  end
end
