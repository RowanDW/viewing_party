class Review
  attr_reader :author,
              :content

  def initialize(review_hash)
    # require "pry"; binding.pry 
    @author = review_hash[:author]
    @content = review_hash[:content]
  end
end
