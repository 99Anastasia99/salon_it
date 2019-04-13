class Client < ApplicationRecord
  has_many :visits, dependent: :destroy
  def total_visits
    average_visits = self.visits.count
    self.update(:average_visits => average_visits)
    return average_visits
  end
  def birthday
    self.date_of_birth.strftime("%Y-%d-%m")
  end
  def total_spending
    average_spending = 0.0
    self.visits.each do |visit|
      average_spending += visit.price
    end
    self.update(:average_spending => average_spending)
    return average_spending
  end
  filterrific(
     default_filter_params: { sorted_by: 'average_spending_desc' },
     available_filters: [:sorted_by,:search_query, :average_visits, :average_spending]
   )

   scope :search_query, lambda {|query|
   return nil  if query.blank?
   terms = query.downcase.split(/\s+/)
   terms = terms.map { |e|
     (e.tr("*", "%") + "%").gsub(/%+/, "%")
   }
   num_or_conds = 3
   where(
     terms.map { |_term|
       "(LOWER(clients.name) LIKE ? OR LOWER(clients.surname) LIKE ? OR LOWER(clients.patronymic) LIKE ?)"
     }.join(" AND "),
     *terms.map { |e| [e] * num_or_conds }.flatten,
   )
 }
 scope :average_visits, lambda {|reference_time|
  where("clients.average_visits >= ?", reference_time)
}
scope :average_spending, ->(reference_time) {
 where("clients.average_spending >= ?", reference_time)
}
 scope :sorted_by, lambda  {|sort_option|
  direction = /desc$/.match?(sort_option) ? "desc" : "asc"
  case sort_option.to_s
  when /^surname_/
    order("LOWER(clients.surname) #{direction},LOWER(clients.name) #{direction}")
  when /^date_of_birth_/
    order("clients.date_of_birth #{direction}")
  when /^average_visits_/
    order("clients.average_visits) #{direction}")
  when /^average_spending_/
    order("clients.average_spending) #{direction}")
  else
    raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
  end
}
end
