module VisitsHelper
  def masters_for_select
    options_from_collection_for_select(Master.all, 'id', 'name')
  end
end
