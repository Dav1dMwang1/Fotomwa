class CreateReportItems < ActiveRecord::Migration[5.2]
  def change
    create_table :report_items do |t|

      t.timestamps
    end
  end
end
