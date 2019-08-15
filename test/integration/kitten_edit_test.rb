require 'test_helper'

class KittenEditTest < ActionDispatch::IntegrationTest
  def setup
    @kitten = kittens(:hillman)
  end

  test 'should save edits to model' do
    new_cuteness = 10
    get edit_kitten_path(@kitten)
    assert_template 'kittens/edit'
    ## invalid edit
    patch kitten_path(@kitten), params: { kitten: { name: 'hillman',
                                                    age: 4,
                                                    cuteness: nil,
                                                    softness: 9 } }
    assert_template 'kittens/edit'
    assert_select 'ul#errors', 1
    #valid edit
    patch kitten_path(@kitten), params: { kitten: { name: 'hillman',
                                                    age: 4,
                                                    cuteness: new_cuteness,
                                                    softness: 9 } }
    follow_redirect!
    assert_template 'kittens/show'
    assert_not_empty flash[:success]
  end
end
