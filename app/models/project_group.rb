# == Schema Information
# Schema version: 20090930085359
#
# Table name: project_groups
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class ProjectGroup < ActiveRecord::Base

  validates_presence_of :name
  validates_uniqueness_of :name

end
