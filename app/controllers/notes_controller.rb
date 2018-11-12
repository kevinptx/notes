class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def show
    @note = selected_note
  end

  def edit
    @note = selected_note
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)

    if (@note.save)
      redirect_to notes_path
    else
      render :new
    end
  end

  def update
    @note = selected_note

    if @note.update(note_params)
      redirect_to notes_path
    else
      flash[:errors] = notes.errors.full_messages
      render :edit
    end
  end

  def destroy
    @note = selected_note.destroy
    redirect_to notes_path
  end

  private

  def selected_note
    Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :author, :body)
  end
end
