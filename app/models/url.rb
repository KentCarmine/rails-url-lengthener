class Url < ActiveRecord::Base
  # attr_accessible :title, :body
  before_save :set_lengthened_url
  validates :long_url, format: { with: /^https?:\/\/.+(\..{2,5}).*$/, message: "Must be a valid url."}


  def set_longer_url
    unless lengthened_url
      lengthened_url = generate_random_string
      write_attribute(:longer_url, longer_url)
    end
  end

  def generate_random_string
    random_str = ""

    140.times do
      random_str += generate_random_char
    end

    random_str
  end
end
