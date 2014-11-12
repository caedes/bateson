require 'bateson'

CODAGE = {
  '0000' => '0',
  '0001' => '1',
  '0010' => '2',
  '0011' => '3',
  '0100' => '4',
  '0101' => '5',
  '0110' => '6',
  '0111' => '7',
  '1000' => '8',
  '1001' => '9',
  '1010' => '+',
  '1011' => '-',
  '1100' => '/',
  '1101' => '',
  '1110' => '',
  '1111' => ''
}

population = Bateson::Population.new
population.evaluate 987

if population.has_solution?
  puts 'Found!'
  p population.solutions.map(&:formula)
else
  print 'Selected parents for next generation: '
  p population.selected_chromosomes.size
end
