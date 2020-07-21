  class TasksController < ApplicationController
   before_action :set_task, only: [:show, :edit, :update, :destroy]
    
    def index
     @tasks = Task.all
    end
    
    def show
     @task = Task.find(params[:id])
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
       flash.now[:danger] = 'タスクが管理されませんでした'
       render :new
     end
    end
   
   def edit
      @tasks = Task.find(params[:id])
   end
    
   def update
     @task = Task.find(params[:id])
     
     if @task.update(task_params)
        flash[:success] = 'タスク管理が正常に管理されました'
        redirect_to @task
     else
        flash.now[:danger] = 'タスクは管理されませんでした'
        render :edit
     end
   end
    
   def destroy
      @tasks = Task.find(params[:id])
      @tasks.destroy
      flash[:success] = 'タスクは正常に削除されました'
      redirect_to tasks_url
   end
   
   private
    
   def set_task
     @task = Task.find(params[:id])
   end
   
   
   def task_params
     params.require(:task).permit(:content, :status)
   end
  end