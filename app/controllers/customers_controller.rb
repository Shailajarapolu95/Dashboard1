class CustomersController < ApplicationController
    def index
      @customers =Customer.all
    end
    def new
      @customer =Customer.new
    end
  
    def edit
      @customer=Customer.find(params[:id])
    end
    def create
      @customer = Customer.new(customer_params)
      # render json: @customer #test when submit form
      if @customer.save
        flash[:notice] ="added new record successfully"
        redirect_to "/"
      else
        flash[:notice]="failed adding new record"
        render action: "new"
      end
    end
    def update
      @customer = Customer.find(params[:id])
     if @customer.update(customer_params)
      # if @customer.update(customer_params)
        flash[:notice] = "Updated record Succesfully"
        redirect_to action: "index"
      else
        flash[:notice] = "failled to update the record"
        render action: "edit"
      end
    end
  def show
    @customer = Customer.find(params[:id])
  end
    def destroy
      @customer =Customer.find(params[:id])
      @customer.destroy
      flash[:note] = "delete record succesfully"
      redirect_to  "/"
    end
    private
    def customer_params
       params.require(:customer).permit(:name, :gender)
    end
  end
  