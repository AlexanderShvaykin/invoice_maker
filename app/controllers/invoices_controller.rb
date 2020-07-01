class InvoicesController < ApplicationController
  def index
    @orders = current_user.invoices
  end

  def new
    @invoice = organization.invoices.build(
      number: ::Invoices::Forms::Create.generate_number(current_user), user: current_user
    )
  end

  def create
    invoice = ::Invoices::Forms::Create.call(
      user: current_user, organization: organization, item_data: item_params
    )
    redirect_to invoice_path(invoice)
  end

  def show
    @order_data = Invoices::Decorators::Show.new(Invoice.find(params[:id]))
    respond_to do |format|
      format.html
      format.pdf do
        render pdf:         "Invoice No. #{@order_data.number}",
               page_size:   'A4',
               template:    "invoices/show.html.erb",
               layout:      "pdf.html",
               orientation: "Landscape",
               lowquality:  true,
               zoom:        1,
               dpi:         75
      end
    end
  end

  def destroy
    invoice.destroy!
    redirect_to invoices_path
  end

  private

  def organization
    @organization = Organization.find(params[:organization_id])
  end

  def invoice
    @invoice ||= current_user.invoices.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :count, :price)
  end
end


