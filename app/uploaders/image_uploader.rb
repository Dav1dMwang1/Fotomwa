# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  include Piet::CarrierWaveExtension

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def cache_dir
    '/tmp/fotomwa-cache'
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    # For Rails 3.1+ asset pipeline compatibility:
    # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))

    "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Piet library optimizes images
  process optimize: [{quality: 90}]
  # process resize_to_limit: [640, 640]
  process :custom_optimize

  # Medium
  version :medium do
    process resize_to_limit: [300, 300]
    process :custom_optimize
  end

  # Small
  version :small do
    process resize_to_limit: [200, 200]
    process :custom_optimize
  end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fit => [64, 64]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def content_type_whitelist
    [/image\//]
  end

  def content_type_blacklist
    %w(application/text application/json)
  end

  def mimetype
    IO.popen(["file", "--brief", "--mime-type", path], in: :close, err: :close) { |io| io.read.chomp.sub(/image\//, "") }
  end


  def custom_optimize
    case mimetype
    when "png" then pngquant
    when "jpeg", "gif" then optimize(quality: 90)
    else
      # type code here
    end
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
