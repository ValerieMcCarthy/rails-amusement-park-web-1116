class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user


  def can_take_ride
  end

  def take_ride
 
    if self.user.tickets < self.attraction.tickets
      insufficient_tickets = true
    end

    if self.user.height < self.attraction.min_height
      insufficient_height = true
    end

    if insufficient_tickets && insufficient_height 
      "Sorry. You do not have enough tickets the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}." 
     
     
    elsif insufficient_tickets
      
      "Sorry. You do not have enough tickets the #{self.attraction.name}."

    elsif insufficient_height
      
     "Sorry. You are not tall enough to ride the #{self.attraction.name}."

     
    
    else 
     
      new_tickets = self.user.tickets - self.attraction.tickets
      new_happiness = self.user.happiness + self.attraction.happiness_rating
      new_nausea = self.user.nausea + self.attraction.nausea_rating

      self.user.update({:id => self.user.id,
          :happiness => new_happiness,
          :nausea => new_nausea,
          :tickets => new_tickets
        })
     
      self.save
      "Thanks for riding the #{self.attraction.name}!"
      
    
      # 
       # binding.pry
      # self.user.tickets -= self.attraction.tickets
       #self.user.happiness += self.attraction.happiness_rating
      # self.user.nausea += self.user.nausea + self.attraction.nausea_rating
      # self.user.save
      # NEED TO CREATE RIDE IN CONTROLLER!!!
      # NEED TO UPDATE USER!!
    end
  end 
end





