require "test_helper"

class IndexControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get root_url
    assert_response :success
  end

  test 'should get output with error message if no param supplied' do
    get index_output_url
    assert_response :success
    assert_nil assigns[:result]
    assert_equal 'Число не задано', assigns[:error]
  end

  test 'should get output with error message if not only digits supplied' do
    get index_output_url, params: { InputNumber: '100 f' }
    assert_response :success
    assert_nil assigns[:result]
    assert_equal 'Некорректный ввод', assigns[:error]
  end

  test 'should returns only palinrome numbers' do
    get index_output_url, params: { InputNumber: '1000' }
    assert_response :success
    assert_equal [0, 1, 2, 3, 11, 22, 101, 111, 121, 202, 212], assigns[:result]
    assert_nil assigns[:error]
  end
end
