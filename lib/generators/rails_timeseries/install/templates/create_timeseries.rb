class CreateTimeseries < ActiveRecord::Migration<%="[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]"%>
  def change
    create_table :timeseries do |t|
      t.date      "date", null: false, index: true
      t.string    "scope", null: false, index: true
      t.integer   "count", null: false
      t.timestamps null: false
    end
  end
end
