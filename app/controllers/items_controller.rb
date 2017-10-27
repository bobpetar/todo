class ItemsController < ApplicationController
	before_action :set_item, only: [:update, :destroy]

	def create
		@item = Item.new(item_params)
		if @item.save
			flash[:success] = 'New item was added'
			redirect_to root_path
		else
			flash[:error] = 'Something went wrong'
			redirect_to root_path
		end
	end

	def update
		if @item.update(item_params)
			flash[:success] = 'Item was updated'
			redirect_to root_path
		else
			flash[:error] = 'Something went wrong'
			redirect_to root_path
		end
	end

	def destroy
		@item.destroy
		flash[:success] = 'Item was successfuly removed'
		redirect_to root_path
	end

	private

	def set_item
		@item = Item.find(params[:id])
	end

	def item_params
		params.require(:item).permit(:description, :done, :list_id)
	end
end