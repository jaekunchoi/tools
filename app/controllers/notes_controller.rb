class NotesController < ApplicationController

	def create
		@note = Note.new(params[:note])
		if @note.save
			UserMailer.note_created_admin(@note).deliver
	end

end
