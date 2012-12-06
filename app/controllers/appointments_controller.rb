class AppointmentsController < ApplicationController
  before_filter :require_user
  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appointments }
    end
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
    @appointment = Appointment.find(params[:id])
    @creator = User.find(@appointment.author_id)
    @shares = Shares.find(:all, :conditions => { :appointment_id => @appointment.id }) 
    @participants = User.all(:conditions => ["id IN (?)", @shares.map{|s| s.user_id}])
    @assignment = Shares.find(:first, :conditions => [ 'appointment_id = ? AND user_id = ?', @appointment.id, current_user.id ] )
    @new_comment = @appointment.comments.build
    @comments = @appointment.comments.all
    @participants.each do |p|
      if p.id == current_user.id
        @assigned = true
      end
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appointment }
    end
  end

  # GET /appointments/new
  # GET /appointments/new.json
  def new
    @appointment = Appointment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appointment }
    end
  end

  # GET /appointments/1/edit
  def edit
    @appointment = Appointment.find(params[:id])
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.create(params[:appointment])
    @appointment.author_id = current_user.id

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render json: @appointment, status: :created, location: @appointment }
      else
        format.html { render action: "new" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /appointments/1
  # PUT /appointments/1.json
  def update
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      if @appointment.update_attributes(params[:appointment])
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to appointments_url }
      format.json { head :no_content }
    end
  end
  
  def destroy_all
    Appointment.delete_all

    respond_to do |format|
      format.html { redirect_to appointments_url }
      format.json { head :no_content }
    end

  end

  def create_dummies
    for i in 1..20
    	Appointment.create(:name => "Dummy#{i}", :description => "testdescription", :time => Time.now, :author_id => current_user.id)
    end
    redirect_to :back
  end
end
