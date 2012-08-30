# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120414074213) do

  create_table "activities", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "starttime"
    t.datetime "endtime"
    t.integer  "location_id"
    t.string   "title"
    t.text     "slogan"
    t.text     "content"
    t.integer  "user_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "activity_columns", :force => true do |t|
    t.integer  "activity_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activity_comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.integer  "to_user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activity_livereports", :force => true do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.integer  "to_user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activity_refs", :force => true do |t|
    t.integer  "activity_id"
    t.string   "ref_name"
    t.integer  "refnum"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activity_tags", :force => true do |t|
    t.integer  "activity_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activity_tweets", :force => true do |t|
    t.integer  "activity_id"
    t.integer  "acticity_column_id"
    t.integer  "tweet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activity_user_actions", :force => true do |t|
    t.integer  "user_id"
    t.string   "action_type"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "activity_id"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.text     "content"
    t.integer  "tweet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["tweet_id"], :name => "index_comments_on_tweet_id"

  create_table "location_have_locations", :force => true do |t|
    t.integer  "location_id"
    t.integer  "child_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "location_map_point_imgs", :force => true do |t|
    t.integer  "point_id"
    t.string   "imgurl"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "location_map_points", :force => true do |t|
    t.string   "point_name"
    t.integer  "target_id"
    t.integer  "cox"
    t.integer  "coy"
    t.integer  "point_img_id"
    t.integer  "location_map_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "width"
    t.integer  "height"
  end

  add_index "location_map_points", ["location_map_id"], :name => "index_location_map_points_on_location_map_id"

  create_table "location_maps", :force => true do |t|
    t.integer  "location_id"
    t.string   "inuse"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "map_file_name"
    t.string   "map_content_type"
    t.integer  "map_file_size"
    t.datetime "map_updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "uptree"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "wiki"
    t.string   "location_icon_file_name"
    t.string   "location_icon_content_type"
    t.integer  "location_icon_file_size"
    t.datetime "location_icon_updated_at"
    t.string   "nametree"
  end

  create_table "tags", :force => true do |t|
    t.text     "wiki"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "refnum"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
  end

  create_table "tweets", :force => true do |t|
    t.integer  "user_id"
    t.integer  "location_id"
    t.string   "content"
    t.integer  "retweetsnum"
    t.integer  "commentsnum"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "retweet_id"
    t.integer  "activity_id"
    t.string   "t_photo_file_name"
    t.string   "t_photo_content_type"
    t.integer  "t_photo_file_size"
    t.datetime "t_photo_updated_at"
  end

  create_table "user_curlocations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "location_id"
    t.time     "open_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "inuse"
  end

  create_table "user_follow_locations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "follow_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_follow_tags", :force => true do |t|
    t.integer  "user_id"
    t.integer  "follow_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_follow_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "follow_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_group_follows", :force => true do |t|
    t.integer  "user_group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_groups", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
