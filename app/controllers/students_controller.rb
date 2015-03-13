class StudentsController < ApplicationController

	def create
		student = Student.create student_params
		render json: student
	end

	def update
		student = Student.update params[:id], student_params
		render json: student.reload
	end

	def destroy
		student = Student.find params[:id]
		student.destroy
		head :no_content
	end

	def student_params
		params.require(:student).permit :name,:email,:folder_id
	end

end
