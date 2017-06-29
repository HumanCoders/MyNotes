class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show, :search]

  def index
    if user_signed_in?
      @notes = current_user.notes.page(params[:page])
    else
      @notes = Note.page(params[:page])
    end
  end

  def search
    @keywords = params[:keywords]
    if user_signed_in?
      @notes = current_user.notes.search(@keywords).page(params[:page])
    else
      @notes = Note.search(@keywords).page(params[:page])
    end
    render :index
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    if @note.save
      redirect_to notes_path, notice: 'Note was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to notes_path, notice: 'Note was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_path, notice: 'Note was successfully destroyed.'
  end

  protected

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
