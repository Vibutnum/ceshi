require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { brand: @product.brand, category1_name: @product.category1_name, category2_name: @product.category2_name, color: @product.color, created_at: @product.created_at, image_url: @product.image_url, name: @product.name, price: @product.price, target: @product.target }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    put :update, id: @product, product: { brand: @product.brand, category1_name: @product.category1_name, category2_name: @product.category2_name, color: @product.color, created_at: @product.created_at, image_url: @product.image_url, name: @product.name, price: @product.price, target: @product.target }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
