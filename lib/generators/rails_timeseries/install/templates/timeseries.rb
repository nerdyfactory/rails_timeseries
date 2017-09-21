class Timeseries < ActiveRecord::Base
  def self.generate
    ActiveRecord::Base.subclasses.each do |model|
      next unless model.respond_to?(:timeseries_scopes)
      model.send(:timeseries_scopes).each do |scope|
        timeseries = Timeseries.find_or_initialize_by(date: Time.now.to_date, scope: scope.to_s)
        timeseries.count = model.send(scope).count
        timeseries.save
      end
    end
    return
  end

  def self.data(scope)
    data = where(scope: scope).order(:date).pluck(:date, :count)
    Hash[data]
  end
end
