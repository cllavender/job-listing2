class AddCityLocationFieldRequireTimeToJob < ActiveRecord::Migration[5.0]
  def change
        add_column :jobs, :city, :string, default: "上海"
        add_column :jobs, :location, :string, default: "静安区"
        add_column :jobs, :field,    :string, default: "跑腿"
        add_column :jobs, :require_time, :datetime
  end
end
