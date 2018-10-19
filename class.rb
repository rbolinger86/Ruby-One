class Character
  attr_accessor :name, :actor_name
end
class StarWars < Character
  attr_writer :force_sensitive
  end
  def get_force_sensitive
    @force_sensitive = @force_sensitive.chr.downcase
    if @force_sensitive == "y"
      @force_sensitive = true
      print "The Force is strong with this one. "
    elsif @force_sensitive == "n"
      @force_sensitive = false
      print "This one does not know the power of the Force. "
    end
  end
end
my_fave = StarWars.new
my_fave.set_name="Obi-Wan Kenobi"
fave_name=my_fave.get_name
my_fave.set_actor_name="Ewan McGregor"
actor_name=my_fave.get_actor
my_fave.set_force_sensitive="Yes"
fave_force=my_fave.get_force_sensitive
puts "My favorite Star Wars character is #{fave_name} played by #{actor_name}."
