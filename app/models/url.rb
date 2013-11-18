class Url < ActiveRecord::Base
  attr_accessible :original_url, :lengthened_url
  before_save :set_lengthened_url
  validates :original_url, format: { with: /^https?:\/\/.+(\..{2,5}).*$/, message: "Must be a valid url."}
  has_many :link_views

  def set_lengthened_url
    unless lengthened_url
      lengthened_url = generate_random_string
      write_attribute(:lengthened_url, lengthened_url)
    end
  end

  def generate_random_string
    random_str = ""

    140.times do
      random_str += generate_random_char
    end

    random_str
  end

  def generate_random_char
    char_list = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    char_index = rand(0..61)
    char = char_list[char_index]
    char
  end

  # def increment_click_count
  #   incremented_counter = self.click_count + 1
  #   write_attribute(:click_count, incremented_counter)
  #   self.save
  # end

end
