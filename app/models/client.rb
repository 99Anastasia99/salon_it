class Client < ApplicationRecord
  has_many :visits, dependent: :destroy
  def total_visits
    average_visits = self.visits.count
    self.update(:average_visits => average_visits)
    return average_visits
  end
  def total_spending
    average_spending = 0.0
    self.visits.each do |visit|
      average_spending += visit.price
    end
    self.update(:average_spending => average_spending)
    return average_spending
  end

end
