class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)

    # current_cart.add_product_to_cart(@product) 多加一行竟然有双倍的效果，有意思
    flash[:notice] = "你已经成功将 #{@product.title} 加入购物车"
  else
    flash[:warning] = "你的购物车内已有此物品"
  end
    redirect_to :back
  end
end
