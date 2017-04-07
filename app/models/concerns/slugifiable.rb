module Slugifiable
  module ClassMethods
    def find_by_slug(slug) #"Taylor Swift"
      self.all.find do |obj| #self is referring to actual class
        obj.slug == slug
      end
    end
  end

  module InstanceMethods
    def slug
      slugged = ""
      letters = ("a".."z").to_a
      numbers = ("1".."9").to_a
      self.name.each_char.with_index do |char, i| #instance
        if letters.include?(char.downcase) || numbers.include?(char)
          slugged += char.downcase
        elsif char == " "
          slugged += "-" unless slugged[-1] == "-"
        end
      end
      slugged #"taylor-swift"
    end
  end
end
