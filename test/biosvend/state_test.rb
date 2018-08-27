require "test_helper"

class BiosvendStateTest < Minitest::Test

  def subject
    Biosvend::State.new
  end

  def test_it_does_something_useful
    assert subject
  end

  def test_it_can_add_item
    assert subject.increment_inventory(:A1)
  end
end
