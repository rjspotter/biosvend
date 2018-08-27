# Shared Mutable State is the root of all evil.

# This holds the current state of the whole system.  Since vending machines are
# used by only on user at a time I'm not worried about locking.
module Biosvend
  class State
    include Contracts::Core

    def initialize
      @@config ||= Config.new
      @@inventory ||= @@config
                        .valid_slots
                        .inject({}) {|m,x| m[x] = 0; m}
      @@price_list ||= @@config
                         .valid_slots
                         .inject({}) {|m,x| m[x] = 0.0; m}
      @@coin_inventory ||= @@config
                        .valid_coins
                        .inject({}) {|m,x| m[x] = 0; m}
      @@inserted_coins ||= @@config
                             .valid_coins
                             .inject({}) {|m,x| m[x] = 0; m}
    end

    Contract C::Enum[*Config.new.valid_slots] => State
    def increment_inventory(slot)
      @@inventory[slot] += 1
      self
    end
  end
end
