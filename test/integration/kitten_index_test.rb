require 'test_helper'

class KittenIndexTest < ActionDispatch::IntegrationTest
  test 'should pageinate kittens and also little quick edit/delete buttons' do
    get root_url
    assert_select 'li.kitten', maximum: Kitten.per_page
  end
end
