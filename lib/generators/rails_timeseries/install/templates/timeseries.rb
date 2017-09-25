class Timeseries < ApplicationRecord
  def self.generate
    ApplicationRecord.subclasses.each do |model|
      next unless model.respond_to?(:timeseries_scopes)
      model.send(:timeseries_scopes).each do |scope|
        timeseries = Timeseries.find_or_initialize_by(date: Time.now.to_date, scope: scope.to_s)
        timeseries.count = model.send(scope).count
        timeseries.save
      end
    end
    return
  end

  def self.data(scope, options = {})
    options.symbolize_keys!
    data = where(scope: scope)
    data = data.where('date > ?', options[:start_date]) if options[:start_date]
    data = data.where('date < ?', options[:end_date]) if options[:end_date]
    data = data.order(:date).pluck(:date, :count)
    Hash[data]
  end
end
