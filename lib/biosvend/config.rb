# Holds the current configuration. The item codes, valid coins, et al.

# Right now these are hard coded values but, in the future it could be replaced
# with something file based or interrogate the hardware for these values
module Biosvend
  class Config
    include Contracts::Core

    Contract C::None => C::ArrayOf[Float]
    def valid_coins
      @@valid_coins ||= [0.05, 0.1, 0.25, 1.0].freeze
    end

    Contract C::None => C::ArrayOf[Symbol]
    def valid_slots
      @@valid_slots ||= %w[A B C D]
                          .product([1, 2, 3, 4])
                          .map(&:join)
                          .sort
                          .map(&:to_sym)
                          .freeze
    end
  end
end
