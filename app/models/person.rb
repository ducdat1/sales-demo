class Person < ApplicationRecord

  belongs_to :user, foreign_key: :user_id
  def address
    Address.new(city, state)
  end

  def address=(address)
    self[:city] = address.city
    self[:state] = address.state
    @address = address
  end
end
class Address
  attr_reader :city, :state

  def initialize(city, state)
    @city, @state = city, state
  end

  def ==(other_address)
    city == other_address.city && state == other_address.state
  end
end