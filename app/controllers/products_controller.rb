class ProductsController < ApplicationController
  def index
    @products = Product.includes(:user).all
    respond_to do |format|
      format.html #show da default view
      format.json {render :json => @products}
    end #format
  end #index
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { render :action => "create" }
        format.json { render :json => @product }
      else
        format.html { render :action => "new" }
        format.json { render :json => @product.errors, :status => :unprocessable_entity }
      end #if
    end #else
  end #create
  def new
    @product = Product.new(:name =>'product name', :price => 69)
  end #new
end
