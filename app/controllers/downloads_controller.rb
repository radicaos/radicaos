class DownloadsController < ApplicationController
  def new
    @download = Download.new
  end

  def create
    @resource = Resource.find_by filename: params[:resource_filename]

    @download = Download.new params[:download]
    @download.resource = @resource
    @download.ip = request.remote_ip

    if verify_recaptcha(model: @download) && @download.save
      path = 'private/' + @resource.filename

      if File.exist?(path)
        send_file path, stream: false
      end
    else
      respond_with @download
    end
  end
end
