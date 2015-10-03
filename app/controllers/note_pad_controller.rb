class NotePadController < ApplicationController
  
  layout 'note_pad'
  
  def index
    @note_pads = NotePad.all
  end

  def show
    @note_pads = NotePad.all
    @note_pad = NotePad.find(params[:id])
  end

  def new
    @note_pads = NotePad.all
    @note_pad = NotePad.new
  end

  def create
    @note_pad = NotePad.new(note_pad_params)

    if @note_pad.save
      flash[:notice] = "Note created successfully"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
  end

  def update
    #find an existing object using form parameters
    @note_pad = NotePad.find(params[:id])
    #update the object
    if@note_pad.update_attributes(note_pad_params)
    #if update succeeds, redirect to the index action
      flash[:notice] = "Note updated successfully"
      redirect_to(:action => 'index')
    else
    #if failed, redisplay the form so user can fix the problems
      render('show')
    end
  end

  def delete
    @note_pads = NotePad.all
     @note_pad = NotePad.find(params[:id])
  end

  def destroy
    note_pad = NotePad.find(params[:id]).destroy
    flash[:notice] = "Note #{note_pad.title} destroyed successfully"
    redirect_to(:action => 'index')
  end

  private 

  def note_pad_params
    params.require(:note_pad).permit(:title, :content)
  end
end
