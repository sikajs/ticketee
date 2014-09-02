class State < ActiveRecord::Base
  #overriding the default to_s method
  def to_s
    name
  end
end
