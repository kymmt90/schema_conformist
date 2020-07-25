require 'test_helper'

class ProductsControllerWithHyperSchemaTest < ActionDispatch::IntegrationTest
  setup do
    Rails.application.config.schema_conformist.ignored_api_paths = []
    Rails.application.config.schema_conformist.schema_path = Rails.root.join('public', 'schema.json')
  end

  test 'GET /products' do
    get products_url, as: :json
  end

  test 'GET /products/:id' do
    get product_url(products(:one)), as: :json
  end

  test 'POST /products' do
    assert_difference('Product.count') do
      params = {
        product: {
          name: 'new product',
          price: 100,
          stock_count: 100
        }
      }

      post products_url, params: params, as: :json
    end
  end

  test 'POST /invalid_products with unexpected request' do
    assert_raises Committee::InvalidRequest do
      params = {
        product: {
          invalid: 'invalid',
          name: 'new product',
          price: 100,
          stock_count: 100
        }
      }

      post invalid_products_url, params: params, as: :json
    end
  end

  test 'POST /invalid_products with unexpected response' do
    assert_raises Committee::InvalidResponse do
      params = {
        product: {
          name: 'new product',
          price: 100,
          stock_count: 100
        }
      }

      post invalid_products_url, params: params, as: :json
    end
  end

  test 'PUT /products/:id' do
    product = products(:one)

    params = {
      product: {
        name: product.name,
        price: product.price,
        stock_count: 100
      }
    }

    put product_url(product), params: params, as: :json

    assert_response 200
  end

  test 'DELETE /products/:id' do
    assert_difference('Product.count', -1) do
      delete product_url(products(:one)), as: :json
    end
  end

  test 'GET /private with String ignored_api_paths pattern' do
    Rails.application.config.schema_conformist.ignored_api_paths << '/private'
    get private_path
  end

  test 'GET /private with Regexp ignored_api_paths pattern' do
    Rails.application.config.schema_conformist.ignored_api_paths << /private/
    get private_path
  end

  test 'GET /private without ignored API paths' do
    assert_raises Committee::InvalidRequest do
      get private_path
    end
  end
end
