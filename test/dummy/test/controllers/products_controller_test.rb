require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'GET /products' do
    get products_url, as: :json
  end

  test 'GET /products/:id' do
    get product_url(products(:one)), as: :json
  end

  test "POST /products" do
    assert_difference('Product.count') do
      post products_url, params: { product: { name: 'new product', price: 100, stock_count: 100 } }, as: :json
    end
  end

  test "PUT /products/:id" do
    product = products(:one)
    put product_url(product), params: { product: { name: product.name, price: product.price, stock_count: 100 } }, as: :json
    assert_response 200
  end

  test "DELETE /products/:id" do
    assert_difference('Product.count', -1) do
      delete product_url(products(:one)), as: :json
    end
  end
end