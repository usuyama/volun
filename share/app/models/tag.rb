class Tag < ActiveRecord::Base
  has_many :classifications
  has_many :contents, :through => :classifications

  def self.get_contents(tags)
    (tags.map { |tag| tag.contents }).flatten.uniq
  end

end
