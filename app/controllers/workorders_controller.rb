class WorkordersController < ApplicationController
  before_action :set_workorder, only: [:show, :edit, :update, :destroy, :assign]

  def index     
	@workorders = Workorder.orderall()			
  end
  
  def filter_status    
	if(params.has_key?(:status_id))
		@selected_status = params[:status_id]  
		@workorders = Workorder.search(@selected_status).joins(:worker).order('lower(first_name),last_name ASC')	
		respond_to do |format|
			format.js
		end
	end			
  end

  def show
	@worker = Worker.find_by_id(@workorder.worker_id)	
	@workorders = Workorder.where("worker_id = #{@worker.id}")
  end

  def new
    @workorder = Workorder.new
		respond_to do |format|
			format.js
		end
  end

  def edit
   @workorders = Workorder.all
		respond_to do |format|
			format.js
		end
  end  
  
  def assign
	@workorder.last_updated_at =DateTime.now
		    respond_to do |format|
			format.js
		end
  end

  def create
    @workorder = Workorder.new(workorder_params)
     if @workorder.save
	    @workorder = Workorder.new
	    flash[:workorder_notice] = "Workorder created successfully"
        @workorders = Workorder.orderall();
      else
         render 'create_error'    
      end    
  end

  def update
    respond_to do |format|
      if @workorder.update(workorder_params)
        @workorders = Workorder.orderall();
		flash[:workorder_notice] = "Workorder updated successfully"
		format.js
      else
	    @workorders = Workorder.orderall();
		flash[:workorder_notice] = "Workorder Not Updated"
	    format.js        
      end
    end
  end

  def destroy
    respond_to do |format|
	  @workorder.destroy
	  @workorders = Workorder.orderall();
	  flash[:workorder_notice] = "Workorder deleted successfully"
          format.js		
     end
  end
  
  def hide
	respond_to do |format|
		@workorder = Workorder.new    
		format.js
	end
  end

  private    
    def set_workorder
      @workorder = Workorder.find(params[:id])
    end
    
    def workorder_params
      params.require(:workorder).permit(:work_details, :worker_id, :status_id, :date_of_creation, :last_updated_at)
    end
end
