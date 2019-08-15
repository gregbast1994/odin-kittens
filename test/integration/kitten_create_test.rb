require 'test_helper'

class KittenCreateTest < ActionDispatch::IntegrationTest
  test 'should create kitten' do
    get new_kitten_path
    assert_template 'kittens/new'
    assert_difference 'Kitten.count' do
      post kittens_path, params: { kitten: { name: 'Hill',
                                        age: 3,
                                        cuteness: 5,
                                        softness: 1 } }
    end
    @kitten = assigns(:kitten)
    assert_redirected_to @kitten
  end
end
