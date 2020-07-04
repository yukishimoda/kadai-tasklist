  class TasksController < ApplicationController
   before_action :set_message, only: [:show, :edit, :update, :destroy]
    
    def index
     @tasks = Task.all
    end
    
    def show
     @tasks = Task.find(params[:id])
    end
    
    def new
     @task = Task.new
    end
    
   def create
     @task = Task.new(task_params)
     if @task.save
       flash[:success] = 'タスクが正常に管理されました'
       redirect_to @task
     else
       flash.now[:danger] = 'タスクが投稿されませんでした'
       render :new
     end
   end
    
   def edit
      @tasks = Task.find(params[:id])
   end
    
   def update
     @tasks = Task.find(params[:id])
     if @tasks.update(task_params)
        flash[:success] = 'タスク管理が正常に更新されました'
        redirect_to @tasks
     else
        flash.now[:danger] = 'タスクは更新されませんでした'
        render :edit
     end
   end
    
   def destroy
      @tasks = Task.find(params[:id])
      @tasks.destroy
      flash[:success] = 'タスクは正常に削除されました'
      redirect_to tasks_url
   end
    
   def set_message
     @task = Task.find(params[:id])
   end
   
 　 def message_params
  　  params.require(:task).permit(:content)
   end
  end