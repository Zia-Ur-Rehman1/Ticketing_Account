class CustomerSuppliersController < ApplicationController
  before_action :set_customer_supplier, only: %i[ show edit update destroy ]

  # GET /customer_suppliers or /customer_suppliers.json
  def index
    @customer_suppliers = CustomerSupplier.all
  end

  # GET /customer_suppliers/1 or /customer_suppliers/1.json
  def show
  end

  # GET /customer_suppliers/new
  def new
    @customer_supplier = CustomerSupplier.new
  end

  # GET /customer_suppliers/1/edit
  def edit
  end

  # POST /customer_suppliers or /customer_suppliers.json
  def create
    @customer_supplier = CustomerSupplier.new(customer_supplier_params)

    respond_to do |format|
      if @customer_supplier.save
        format.html { redirect_to customer_supplier_url(@customer_supplier), notice: "Customer supplier was successfully created." }
        format.json { render :show, status: :created, location: @customer_supplier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer_supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_suppliers/1 or /customer_suppliers/1.json
  def update
    respond_to do |format|
      if @customer_supplier.update(customer_supplier_params)
        format.html { redirect_to customer_supplier_url(@customer_supplier), notice: "Customer supplier was successfully updated." }
        format.json { render :show, status: :ok, location: @customer_supplier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer_supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_suppliers/1 or /customer_suppliers/1.json
  def destroy
    @customer_supplier.destroy

    respond_to do |format|
      format.html { redirect_to customer_suppliers_url, notice: "Customer supplier was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_supplier
      @customer_supplier = CustomerSupplier.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_supplier_params
      params.require(:customer_supplier).permit(:sector, :passenger_name, :reservation_num, :reservation_type, :supplier, :air_line, :travel_date, :current_date, :ref_date, :deal, :sale, :purchase, :customer)
    end
end
