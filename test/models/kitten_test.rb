require 'test_helper'

class KittenTest < ActiveSupport::TestCase
  def setup
    @kitten = kittens(:hillman)
  end

  test 'hillman is valid' do
    assert @kitten.valid?
  end

  test 'name should be present' do
    @kitten.name = ''
    assert_not @kitten.valid?
  end

  test 'age should be present' do
    @kitten.age = nil
    assert_not @kitten.valid?
  end

  test 'cuteness should be present' do
    @kitten.cuteness = nil
    assert_not @kitten.valid?
  end

  test 'softness should be present' do
    @kitten.softness = nil
    assert_not @kitten.valid?
  end
end
