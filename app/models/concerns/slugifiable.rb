# module Slugifiable
#   module ClassMethods
#     def find_by_slug(artist) #classmethods module
#       self.all.find do |obj|
#       obj.slug == artist.name
#       slug(artist)
#       end
#     end
#   end
#
#   module InstanceMethods
#     def slug(artist) #instancemethods module
#       slugged = ""
#       exceptions = ["$", "&", "-", "[", "]", "+", "(", ")", "."]
#       artist.name.each_char do |char|
#         if exceptions.include?(char)
#           next
#         elsif char == " "
#           slugged += "-"
#         else
#           slugged += char.downcase
#         end
#       end
#       slugged
#     end
#   end
# end

module Slugifiable
  module ClassMethods
    def find_by_slug(slug) #taylor-swift
      self.all.find do |obj| #self is referring to actual class
      obj.slug == slug
      end
    end
  end

  module InstanceMethods
    def slug
      slugged = ""
      letters = ("a".."z").to_a
      numbers = ("1".."10").to_a
      self.name.each_char.with_index do |char, i| #instance
        if letters.include?(char.downcase) || numbers.include?(char)
          slugged += char.downcase
        elsif char == " "
          slugged += "-" unless slugged[-1] == "-"
        end
      end
      slugged
    end
  end
end
