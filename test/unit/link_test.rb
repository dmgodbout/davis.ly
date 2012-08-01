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

require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
