class User < ActiveRecord::Base
  has_many :contents, :through => :appliers
end
