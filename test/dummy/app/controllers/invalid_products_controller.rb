class InvalidProductsController < ApplicationController
  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product.attributes.except('name'), status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :price, :stock_count)
    end
end

