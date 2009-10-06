# == Schema Information
# Schema version: 20090930085359
#
# Table name: clients
#
#  id         :integer(4)      not null, primary key
#  mrc_id     :integer(4)
#  name       :string(255)
#  address    :string(255)
#  address2   :string(255)
#  city       :string(255)
#  state      :string(255)
#  zip        :string(255)
#  phone      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Client < ActiveRecord::Base

  DESCRIPTION = 'Clients'

  include SecuritySubject

  belongs_to :mrc
  has_many :projects ,:dependent => :nullify

  has_many :assignments, :as => :security_subject, :dependent => :destroy

  validates_uniqueness_of :name, :scope => :mrc

  validates_presence_of :name
  validates_length_of   :name, :within => 3..40

end
