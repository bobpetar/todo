class ListsController < ApplicationController
	before_action :set_list, only: [:edit, :show, :update, :destroy]

	def new
		@list = List.new
	end

	def edit; end
	def show; end

	def create
		@list = List.new(list_params)
		if @list.save
			flash[:success] = "New list was created."
			redirect_to lists_path
		else
			flash[:error] = "Something went wrong"
			redirect_to :back
		end
	end

	def update
		if @list.update(list_params)
			flash[:success] = "Updated"
			redirect_to lists_path
		else
			flash[:error] = "Something went wrong"
			redirect_to :back
		end
	end

	def destroy
		@list.destroy
		flash[:success] = "List was deleted"
		redirect_to lists_path
	end

	private

	def list_params
		params.require(:list).permit(:description)
	end

	def set_list
		@list = List.find(params[:id])
	end
end