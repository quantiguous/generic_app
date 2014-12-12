module HelperMethods
  def create_attachment(ticket)
    file = File.new(Rails.root + 'spec/fixtures/rails.png')
    Factory(:attachment, :note => 'attachment note',:file => ActionDispatch::Http::UploadedFile.new(:tempfile => file, :filename => File.basename(file)), :attachable => ticket)
  end
end
