class BudgetsController < ApplicationController
  def download
    files = Post.find(params[:post_id])
    begin
      if ExportService.download
        name = File.open("#{Rails.root}/public/file_downloads/")
        send_data name, type: "application/xlsx", x_sendfile: true,
                        disposition: "attachment",filename: "#{files.title}.xlsx"
      end
    rescue Errno::ENOENT, IOError => e
      Rails.logger.error e.message
    end
  end
end