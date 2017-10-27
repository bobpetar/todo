class ListsController < ApplicationController
	before_action :set_list, only: [:edit, :show, :update, :destroy]

	def new
		@list = List.new
	end

	def edit; end
	def show; end

	def create
		@list = List.new(list_params)
		@list.user = current_user
		if @list.save
			flash[:success] = "New list was created."
			redirect_to root_path
		else
			flash[:error] = "Something went wrong"
			redirect_to root_path
		end
	end

	def update
		if @list.update(list_params)
			flash[:success] = "Updated"
			redirect_to root_path
		else
			flash[:error] = "Something went wrong"
			redirect_to :back
		end
	end

	def destroy
		@list.destroy
		flash[:success] = "List was deleted"
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