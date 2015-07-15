class NotesController < ApplicationController
  def create
    @note = Note.create(note_params)
    if @note.save
      redirect_to user_meetings_path(params[:note][:user_id])
    else
      render "new"
    end
  end

  private

  def note_params
    params.require(:note).permit(:content, :user_id, :author)
  end
end
