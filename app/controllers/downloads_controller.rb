class DownloadsController < ApplicationController

  def create
    if verify_recaptcha
      @resource = Resource.find_by filename: params[:resource_filename]

      @download = Download.new params[:download]
      @download.resource = @resource
      @download.ip = request.remote_ip

      if @download.save
        path = 'private/' + @resource.filename

        if File.exist?(path)
          send_file path, stream: false
        end
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end
end
