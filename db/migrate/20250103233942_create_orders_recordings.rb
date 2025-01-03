class CreateOrdersRecordings < ActiveRecord::Migration[7.2]
  def change
    create_table :orders_recordings, id: false do |t|
      t.belongs_to :order, index: true
      t.belongs_to :recording, index: true

      t.timestamps
    end
  end
end
