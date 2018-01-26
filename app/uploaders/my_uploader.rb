class MyUploader < CarrierWave::Uploader::Base
  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end