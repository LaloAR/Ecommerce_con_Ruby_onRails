class InShoppingCartsController < ApplicationController
	def create
		# Agregar a un carrito de compra
		in_shopping_cart = InShoppingCart.new(product_id: params[:product_id],shopping_cart: @shopping_cart)

		if in_shopping_cart.save
			redirect_to carrito_path, notice: "El producto se añadió a tu carrito de compras"
		else
			redirect_to products_path(id: params[:product_id]), notice: "El producto no se agregó al carrito"
		end
	end

	def destroy
		# Eliminar de un carrito de compra
		@in_shopping_cart = InShoppingCart.find(params[:id])
		@in_shopping_cart.destroy

		redirect_to carrito_path
	end
end
