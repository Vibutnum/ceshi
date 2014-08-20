#encoding: utf-8
class ProductsController < ApplicationController
  # GET /products
  # GET /products.json

  def index
    @check = params[:check] if params[:check].present?
    @where = params[:where] if params[:where].present?
    @products = Product.search(params).paginate(:page => params[:page], :per_page => 20)
    @category1_name, @category2_name, @brand, @color, @target = Product.cache

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end
end
