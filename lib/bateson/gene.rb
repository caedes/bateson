module Bateson
  class Gene
    attr_reader :bits

    def initialize(bits = 4)
      @bits = (0...bits).map { rand(2) }.join
    end

    def value
      CODAGE.fetch @bits
    end

    def to_s
      @bits
    end
  end
end
