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
  def show
    @product = Product.where(:id => params[:id]).first
  end #show
  def edit
    @product = Product.where(:id => params[:id]).first
  end #edit
  def update
    @product = Product.where(:id => params[:id]).first

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, :notice => 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, :status => :unprocessable_entity }
      end
    end
  end #update
  def destroy
    @product = Product.where(:id => params[:id]).first
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
