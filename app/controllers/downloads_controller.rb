class DownloadsController < ApplicationController
  def index
    @downloads = Download.all
    respond_with(@downloads)
  end

  def show
    @download = Download.find(params[:id])
    respond_with(@download)
  end

  def new
    @download = Download.new
    respond_with(@download)
  end

  def edit
    @download = Download.find(params[:id])
  end

  def create
    @download = Download.new(params[:download])
    @download.save
    respond_with(@download)
  end

  def update
    @download = Download.find(params[:id])
    @download.update_attributes(params[:download])
    respond_with(@download)
  end

  def destroy
    @download = Download.find(params[:id])
    @download.destroy
    respond_with(@download)
  end
end
