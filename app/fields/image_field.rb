require "administrate/field/base"

class ImageField < Administrate::Field::Base
  def url
    data.url
  end

  def thumb
    data.url(:thumb)
  end

  def to_s
    data
  end
end
