class NotesController < ApplicationController
  def create
    @note = Note.create(note_params)
    @note.content = parse(params[:note][:content])
    @note.save
    if @note.save
      redirect_to user_meetings_path(params[:note][:user_id])
    else
      render "new"
    end
  end

  private

  def note_params
    params.require(:note).permit(:user_id, :author)
  end

  def parse(text)
    MarkdownParser.call(text)
  end
end
