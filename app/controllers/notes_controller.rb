class NotesController < ApplicationController
  before_action :set_note, only: [:show, :destroy]

  def index
    @notes = Note.all
  end

  def show
  end

  def destroy
    @note.destroy
    redirect_to notes_path
  end

  protected
  def set_note
    @note = Note.find(params[:id])
  end
end
