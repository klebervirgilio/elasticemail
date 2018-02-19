module Elasticemail
  class Files
    def self.upload
      file = ElasticFile::Upload.new
      yield file
      file.perform
    end

    def self.remove(file_name, api_key=nil)
      attachment = ElasticFile::DeleteFile.new(api_key, file_name)
      yield attachment if block_given?
      attachment.perform
    end

    def self.load(file_name, attachment_id, api_key=nil)
      attachment = ElasticFile::LoadFile.new(api_key, file_name)
      yield attachment if block_given?
      attachment.perform
    end
  end
end
