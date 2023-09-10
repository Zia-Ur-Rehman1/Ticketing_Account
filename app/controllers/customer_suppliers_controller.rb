class CustomerSuppliersController < ApplicationController
  before_action :set_customer_supplier, only: %i[ show edit update destroy ]
  require 'csv'
  # GET /customer_suppliers or /customer_suppliers.json
  def export_csv
    file = "#{Rails.root}/public/supplier.csv"
    data = CustomerSupplier.all
    headers = CustomerSupplier.column_names
    CSV.open(file,'w', write_headers: true, headers: headers) do |csv|
      data.each do |row|
        row_data = headers.map { |header| row[header] }
        csv << row_data
      end
    end
    respond_to do |format|
      format.html { redirect_to root_url, notice: "CSV file successfully created." }
    end
  end

  def index
    @q = CustomerSupplier.ransack(params[:q])
    @pagy, @customer_suppliers = pagy(@q.result(distinct: true).order(created_at: :asc), items: 10)
  end
  # GET /customer_suppliers/1 or /customer_suppliers/1.json
  def show
  end

  def customers
    @customers_with_balances = CustomerSupplier.select('customer, SUM(sale - purchase) AS balance').group(:customer)
    @total_balance = @customers_with_balances.sum(&:balance)
  end

  def suppliers
    @suppliers = CustomerSupplier.select('supplier, SUM(purchase) AS balance').group(:supplier)
    @total_balance = @suppliers.sum(&:balance)
  end

  def customer
    @customer = CustomerSupplier.where(customer: params[:name])
    @name = params[:name]
    @total_balance = @customer.sum('sale-purchase')
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
        format.html { redirect_to root_url, notice: "Customer supplier was successfully created." }
        format.json { redirect_to root_url, status: :created }
        # format.json { render :show, status: :created, location: @customer_supplier }
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
        format.html { redirect_to root_url, notice: "Customer supplier was successfully Updated." }
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
      format.html { redirect_to root_url, notice: "Customer supplier was successfully destroyed." }
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
