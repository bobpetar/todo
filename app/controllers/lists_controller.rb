class ListsController < ApplicationController
	before_action :set_list, only: :destroy

	def create
		@list = List.new(list_params)
		@list.user = current_user
		if @list.save
			flash[:success] = 'New list was created.'
			redirect_to root_path
		else
			flash[:error] = @list.errors.full_messages.join(', ')
			redirect_to root_path
		end
	end

	def destroy
		@list.destroy
		flash[:success] = 'List was deleted'
		redirect_to root_path
	end

	private

	def list_params
		params.require(:list).permit(:description)
	end

	def set_list
		@list = List.find(params[:id])
	end
end