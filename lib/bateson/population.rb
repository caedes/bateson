module Bateson
  class Population
    attr_reader :chromosomes, :value

    def initialize(chromosomes = 10_000)
      @chromosomes = chromosomes.times.map { |i| Chromosome.new }
    end

    def evaluate(value)
      @value = value
      chromosomes.each do |chromosome|
        chromosome.evaluate @value
      end
    end

    def sorted_chromosomes
      @chromosomes.sort_by { |chromosome| chromosome.score }
    end

    def reasonable_chromosomes
      @chromosomes.select do |chromosome|
        chromosome.score && chromosome.score < (@value || 0)
      end
    end

    def selected_chromosomes
      max = reasonable_chromosomes.size
      median = (max + 1) / 4
      sorted_chromosomes[0..median]
    end

    def has_solution?
      solutions.any?
    end

    def solutions
      @chromosomes.select { |chromosome| chromosome.score == 0 }
    end
  end
end
