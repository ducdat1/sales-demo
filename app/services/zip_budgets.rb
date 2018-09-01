module ZipBudgets
  class << self
    def perform files
      begin
        temp = Tempfile.new('ZipPost')
        Zip::File.open(temp.path, Zip::File::CREATE) do |zipfile|
          files.each do |file|
            zipfile.add "#{file}.xls", "#{Rails.root}/#{file}.xls"
          end
        end
        files.each do |file|
          File.delete "#{file}.xls"
        end
      rescue Errno::ENOENT, IOError => e
        Rails.logger.error e.message
        temp.close
      end
      temp
    end
  end
end