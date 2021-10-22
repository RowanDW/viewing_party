class Actor
  attr_reader :name,
              :character

  def initialize(actor_hash)
    @name = actor_hash[:name]
    @character = actor_hash[:character]
  end
end
