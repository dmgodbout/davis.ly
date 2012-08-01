# == Schema Information
#
# Table name: links
#
#  id          :integer          not null, primary key
#  in_url      :string(255)
#  out_url     :text
#  http_status :integer          default(301)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Link < ActiveRecord::Base
  validates :in_url, :out_url, :http_status, :presence => true
  validates :in_url, :uniqueness => true
end
