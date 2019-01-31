class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!
  # GET /orders
  # GET /orders.json
  def index
    Order.reindex
    if current_user.admin?
      @orders = Order.all
    else
      @orders = Order.where(user: current_user.email)
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @random_number = "#{Date.today.yday()}#{SecureRandom.random_number(100000)}"
    @order = Order.new
    @consumable = Consumable.all

  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create


    @order = Order.new(order_params)
    @order.user = current_user.email
    puts @random_number
    puts @order.inspect
    respond_to do |format|
      if @order.save
        RemoveStockWorker.perform_async(@order.id)
        Order.reindex
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|

      @order.inspect
      if @order.finalized == "TRUE"
        logger.debug "order finalized, lets set the status.^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        @order.status = "Finalized"
      end
      if @order.update(order_params)
        RemoveStockWorker.perform_async(@order.id)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:id, :status, :order_id, :user, :finalized, :_destory, line_item_attributes: [:id, :consumable_id, :order_id, :quantity, :_destroy], consumable_attributes: [:id])
    end
end
