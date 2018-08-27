require "test_helper"

class BiosvendConfigTest < Minitest::Test

  def subject
    Biosvend::Config.new
  end

  def test_it_does_something_useful
    assert subject.valid_coins
    assert subject.valid_slots
  end
end
