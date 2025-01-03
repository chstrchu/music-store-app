class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.references :user, index: true

      t.timestamp :expired_at
      t.timestamp :completed_at
      t.timestamps
    end
  end
end
