class Review
  def initialize(review_hash)
    @author = review_hash[:author]
    @content = review_hash[:content]
  end
end
