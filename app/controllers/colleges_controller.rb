class CollegesController < ApplicationController
	# def index
	# 	@college = College.all 
	# end

	def new
		@college = College.new()
	end

	def create
		#byebug
		@college = College.new(collegename: params[:college][:collegename],collegecode: params[:college][:collegecode])
		@college.save
		redirect_to root_path

	end
	def edit
		#byebug
		@college = College.find(params[:id])
	end

	def update
		@college = @college = College.find(params[:id])
		@college.update(collegename: params[:college][:collegename],collegecode: params[:college][:collegecode])
		redirect_to root_path
	end
	def destroy
		@college = College.find(params[:id])
		@college.destroy
		redirect_to root_path

	end

	def show 
		#byebug
		@college = College.find(params[:id])
		@colleges = @college.users
	end
end
