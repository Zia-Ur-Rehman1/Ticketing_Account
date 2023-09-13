class CustomerSuppliersController < ApplicationController
  before_action :set_customer_supplier, only: %i[ show edit update destroy ]
  require 'csv'

  
  def export_csv
    selected_columns= ["sector", "passenger_name", "reservation_num", "supplier", "air_line", "travel_date", "deal", "sale", "purchase", "customer", 'created_at']

    base_query = CustomerSupplier.select(selected_columns)
    if params[:customer].present?
      base_query = base_query.where(customer: params[:customer])
    end

    if params[:supplier].present?
      base_query = base_query.where(supplier: params[:supplier])
    end

    if params[:start_date].present?
      base_query = base_query.where("created_at >= ?", params[:start_date])
    end

    if params[:end_date].present?
      base_query = base_query.where("created_at <= ?", params[:end_date])
    end
    if base_query.where_values_hash.present?
      records = base_query.all
      csv_data = CsvExporter.new(records).to_csv
    end
    if csv_data.present? 
      send_data csv_data, filename: 'customer_suppliers.csv', type: 'text/csv'
      return
    end
    flash[:alert] = "No Record Found"
    redirect_to root_path
  end

  def index
    @customer_names = CustomerSupplier.distinct.pluck(:customer)
    @supplier_names = CustomerSupplier.distinct.pluck(:supplier)
    @q = CustomerSupplier.ransack(params[:q])
    @pagy, @customer_suppliers = pagy(@q.result(distinct: true).order(created_at: :asc), items: 10)
  end
  # GET /customer_suppliers/1 or /customer_suppliers/1.json
  def show
  end

  def range
    start_date = params[:start_date]
    end_date = params[:end_date]
    @customer_suppliers = CustomerSupplier.where(created_at: start_date..end_date)
    if @customer_suppliers.length.eql?(0)
      flash[:alert] = "No Record Found"
      redirect_to root_path
    else
      redirect_to range_customer_suppliers_path
    end
  end

  def customers
    @customers_with_balances = CustomerSupplier.select('customer, SUM(COALESCE(sale, 0) - COALESCE(purchase, 0)) AS balance').group(:customer)
    @total_balance = @customers_with_balances.sum(&:balance)
  end

  def suppliers
    @suppliers = CustomerSupplier.select('supplier, SUM(COALESCE(purchase, 0)) AS balance').group(:supplier)
    @total_balance = @suppliers.sum(&:balance)
  end

  def customer
    @customer = CustomerSupplier.where(customer: params[:name])
    @name = params[:name]
    @total_balance = @customer.sum(:sale) - @customer.sum(:purchase)
  end

  def supplier
    @supplier = CustomerSupplier.where(supplier: params[:name])
    @name = params[:name]
    @total_balance = @supplier.sum(:sale) - @supplier.sum(:purchase)
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
      params.require(:customer_supplier).permit(:sector, :passenger_name, :reservation_num,  :supplier, :air_line, :travel_date,  :deal, :sale, :purchase, :customer)
    end
end
