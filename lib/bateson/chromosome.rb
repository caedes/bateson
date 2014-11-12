module Bateson
  class Chromosome
    attr_reader :genes, :score

    def initialize(genes = 12)
      @score = nil
      @genes = genes.times.map { |i| Gene.new }
    end

    def formula
      @genes.map(&:value).join
    end

    def evaluate(value)
      begin
        result = (value - eval(formula)).abs
      rescue Exception
        result = 999_999_999_999
      end
      result = 999_999_999_999 unless result.is_a?(Integer)

      @score = result
    end

    def to_s
      @genes.join
    end
  end
end
