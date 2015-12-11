class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update, :destroy]

  def index
	@worker = Worker.new    
    @workers = Worker.orderall()
  end

  def show	
	@workorders = Workorder.where("worker_id = #{@worker.id}")
	respond_to do |format|		    
			format.js
	end
  end

  def new    
    @worker = Worker.new
		respond_to do |format|
			format.js
		end
  end

  def edit
    @workers = Worker.all.order('lower(first_name), last_name ASC');	
		respond_to do |format|		    
			format.js
		end
  end

  def create
    @worker = Worker.new(worker_params)
     if @worker.save
	    @worker = Worker.new
	    flash[:worker_notice] = "Worker created successfully"
        @workers = Worker.orderall()
      else
         render 'create_error'    
      end    
  end

  def update
    respond_to do |format|
      if @worker.update(worker_params)
        @workers = Worker.orderall()
		flash[:worker_notice] = "Worker updated successfully"
		format.js
      else
	    @workers = Worker.orderall()
		flash[:worker_notice] = "Worker Not Updated"
	    format.js        
      end
    end
  end

  def destroy
    respond_to do |format|
	  if ( Workorder.where("worker_id = #{@worker.id}").count == 0 )	    
		@worker.destroy
		@workers = Worker.orderall()
		flash[:worker_notice] = "Worker deleted successfully"
		format.js		
	  else
	    @workers = Worker.orderall()
		flash[:worker_notice] = "Worker cannot be deleted because work order is assigned to the worker."
	    format.js
	  end
    end
  end
  
  def hide
	respond_to do |format|
		@worker = Worker.new    
		format.js
	end
  end

  private    
    def set_worker
      @worker = Worker.find(params[:id])
    end

    def worker_params
      params.require(:worker).permit(:first_name, :last_name)
    end
end
