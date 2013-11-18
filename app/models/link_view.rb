class LinkView < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :url
end
