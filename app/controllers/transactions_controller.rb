class TransactionsController < ApplicationsController


def create
	book = Book.find_by!(slug: params[:slug])
	token = params[:stripeToken]

	begin
		charge = Stripe::Charge.create(
			amount: book.price
			currency: "usd"
			card: token
			description: current_user.email
			)

	@sale = book.sales.create!(buyer_email: current_user.email)
		redirect_to pickup_url(uuid: @sale.uuid)
    

	rescue Stripe::CardError => e
  	flash[:notice] = e.message
  	redirect_to book_path(book)

end

end

def pickup
end

end

