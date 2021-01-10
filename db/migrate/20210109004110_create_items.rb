class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :name,                    null: false, default: ""
      t.text        :description,             null: false
      t.integer     :category_id,             null: false
      t.integer     :status_id,               null: false
      t.integer     :delivery_pay_method_id,  null: false
      t.integer     :sender_region_id,        null: false
      t.integer     :delivery_duration_id,    null: false
      t.integer     :price,                   null: false
      t.references  :user,                    null: false


      t.timestamps
    end
  end
end
