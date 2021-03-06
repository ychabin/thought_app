class ThoughtsController < ApplicationController
  def index
    @thoughts = Thought.all
  end

  def new
    @thought = Thought.new
  end

  def create
    @thought = Thought.new(thought_params)
    if @thought.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
    @thought = Thought.find(params[:id])
    @comment = Comment.new
    @comments = @thought.comments.includes(:user)
  end

  def destroy
    thought = Thought.find(params[:id])
    if thought.destroy
       redirect_to root_path
    end
  end

  def edit
    @thought = Thought.find(params[:id])
  end

  def update
    thought = Thought.find(params[:id])
    if thought.update(thought_params)
      redirect_to root_path
    else
      render action: :update
    end
  end

private

  def thought_params
    params.require(:thought).permit( :title, :content).merge(user_id: current_user.id)
  end
end
