ActiveRecord::Schema.define do

  create_table "cities", :force => true do |t|
    t.string   "name", :limit => 50
  end

  create_table "seo_fields", :force => true do |t|
    t.string   "name",             :limit => 50
    t.string   "value",            :limit => 200
    t.integer  "optimizable_id",                  :null => false
    t.string   "optimizable_type", :limit => 20,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end
end
