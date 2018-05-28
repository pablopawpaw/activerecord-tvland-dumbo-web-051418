class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  def list_roles
    # self.shows.merge(self.characters)
    self.shows.map do |show|
      "#{show.characters.first.name} - #{show.name}"
    end
  end
end
