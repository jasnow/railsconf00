class HostsController < ApplicationController
  before_action :authenticate, only: [:index, :edit, :update,
    :destroy, :show]
  # GET /hosts
  # GET /hosts.json
  def index
    @hosts = Host.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hosts }
    end
  end

  # GET /hosts/1
  # GET /hosts/1.json
  def show
    @host = Host.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @host }
    end
  end

  # GET /hosts/new
  # GET /hosts/new.json
  def new
    @host = Host.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @host }
    end
  end

  # GET /hosts/1/edit
  def edit
    @host = Host.find(params[:id])
  end

  # POST /hosts
  # POST /hosts.json
  def create
    @host = Host.new(params[:host])

    respond_to do |format|
      if @host.save
        createmailer(@host)
      else
        format.html { render action: "new" }
        format.json {
          render json: @host.errors,
            status: :unprocessable_entity
        }
      end
    end
  end

  # PUT /hosts/1
  # PUT /hosts/1.json
  def update
    @host = Host.find(params[:id])

    respond_to do |format|
      if @host.update(params[:host])
        format.html {
          redirect_to @host,
            notice: "Host was successfully updated."
        }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json {
          render json: @host.errors,
            status: :unprocessable_entity
        }
      end
    end
  end

  # DELETE /hosts/1
  # DELETE /hosts/1.json
  def destroy
    @host = Host.find(params[:id])
    @host.destroy

    respond_to do |format|
      format.html { redirect_to hosts_url }
      format.json { head :no_content }
    end
  end

  def createmailer(hostp)
    AdminMailer.submission(hostp).deliver
    format.html { redirect_to thanks_hosts_url }
    format.json {
      render json: hostp, status: :created,
        location: hostp
    }
  end
end
