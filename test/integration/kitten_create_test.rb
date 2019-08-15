require 'test_helper'

class KittenCreateTest < ActionDispatch::IntegrationTest
  test 'should create kitten then delete' do
    get new_kitten_path
    assert_template 'kittens/new'
    assert_difference 'Kitten.count' do
      post kittens_path, params: { kitten: { name: 'Hill',
                                        age: 3,
                                        cuteness: 5,
                                        softness: 1 } }
    end
    @kitten = assigns(:kitten)
    follow_redirect!
    assert_template 'kittens/show'
    assert_not_empty flash[:success]
    assert_select 'a.delete', 1
    assert_difference 'Kitten.count', -1 do
      delete kitten_path(@kitten)
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_not_empty flash[:success]
  end
end
