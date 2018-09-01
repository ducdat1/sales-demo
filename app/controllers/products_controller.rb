class ProductsController < ApplicationController
  before_action :set_locale, :authorize
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    #use for query object
    @products = ProductQuery.new(sort_query_params).all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @supports = Supports::Product.new @product
  end

  # GET /products/new
  def new
    @categories = Category.get_category
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @categories = Category.get_category
    @supports = Supports::Product.new @product
  end

  # POST /products
  # POST /products.json
  def create
    @product = ProductForm.new(product_params)
    @categories = Category.get_category
    if @product.insert(product_params)
      redirect_to products_url
      flash[:notice]='Product was successfully created.'
    else
      render :new
      render json: @product.errors, status: :unpocessably_entity
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_url, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :image_url, :price, :category_id)
    end

    #use for query object
    def sort_query_params
      { sort: :by_title, type: :desc }
    end
end
