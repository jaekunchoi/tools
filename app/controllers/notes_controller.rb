class NotesController < ApplicationController

	def index
		@notes = Note.all
	end

	def create
		@note = Note.new(params[:note])
		if @note.save
			UserMailer.note_created_admin(@note).deliver
		end
	end



end