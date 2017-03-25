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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170325105926) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "admin_comments_02"
  add_index "active_admin_comments", ["namespace"], name: "admin_comments_01"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "admin_notes_01"

  create_table "admin_roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_roles", ["name", "resource_type", "resource_id"], name: "admin_roles_01"
  add_index "admin_roles", ["name"], name: "index_admin_roles_on_name"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                             default: "",    null: false
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "unique_session_id",      limit: 20
    t.boolean  "inactive",                          default: false
    t.integer  "failed_attempts",                   default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "admin_users_admin_roles", id: false, force: :cascade do |t|
    t.integer "admin_user_id"
    t.integer "admin_role_id"
  end

  add_index "admin_users_admin_roles", ["admin_user_id", "admin_role_id"], name: "admin_roles_02"

  create_table "branches", force: :cascade do |t|
    t.string   "name"
    t.integer  "cluster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cl_incoming_files", force: :cascade do |t|
    t.string "file_name", limit: 100
  end

  add_index "cl_incoming_files", ["file_name"], name: "cl_incoming_files_01", unique: true

  create_table "cl_incoming_records", force: :cascade do |t|
    t.integer "incoming_file_record_id"
    t.string  "file_name",               limit: 100
  end

  add_index "cl_incoming_records", ["incoming_file_record_id"], name: "cl_incoming_records_01", unique: true

  create_table "clusters", force: :cascade do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "fm_audit_steps", force: :cascade do |t|
    t.string   "auditable_type",               null: false
    t.integer  "auditable_id",                 null: false
    t.integer  "step_no",                      null: false
    t.integer  "attempt_no",                   null: false
    t.string   "step_name",       limit: 100,  null: false
    t.string   "status_code",     limit: 25
    t.string   "fault_code",      limit: 50
    t.string   "fault_subcode",   limit: 50
    t.string   "fault_reason",    limit: 1000
    t.string   "req_reference",   limit: 255
    t.datetime "req_timestamp"
    t.string   "rep_reference"
    t.datetime "rep_timestamp"
    t.datetime "reconciled_at"
    t.text     "req_bitstream"
    t.text     "rep_bitstream"
    t.text     "fault_bitstream"
  end

  create_table "incoming_file_records", force: :cascade do |t|
    t.integer  "incoming_file_id"
    t.integer  "record_no"
    t.text     "record_txt"
    t.string   "status",              limit: 20
    t.string   "fault_code",          limit: 50
    t.string   "fault_subcode",       limit: 50
    t.string   "fault_reason",        limit: 1000
    t.datetime "created_at",                       null: false
    t.datetime "updated_at"
    t.text     "fault_bitstream"
    t.string   "rep_status",          limit: 50
    t.string   "rep_fault_code",      limit: 50
    t.string   "rep_fault_subcode",   limit: 50
    t.string   "rep_fault_reason",    limit: 500
    t.text     "rep_fault_bitstream"
    t.string   "overrides",           limit: 50
    t.integer  "attempt_no"
  end

  add_index "incoming_file_records", ["incoming_file_id", "record_no"], name: "in_file_records_1", unique: true

  create_table "incoming_file_types", force: :cascade do |t|
    t.integer "sc_service_id",                                 null: false
    t.string  "code",                limit: 50,                null: false
    t.string  "name",                limit: 50,                null: false
    t.string  "msg_domain",          limit: 255
    t.string  "msg_model",           limit: 255
    t.string  "validate_all",        limit: 1,   default: "N"
    t.string  "auto_upload",         limit: 1,   default: "N"
    t.string  "skip_first",          limit: 1,   default: "N"
    t.string  "build_response_file", limit: 1
    t.string  "correlation_field"
    t.string  "comment"
    t.string  "db_unit_name"
    t.string  "records_table"
    t.string  "can_override",        limit: 1,   default: "N", null: false
    t.string  "can_skip",            limit: 1,   default: "N", null: false
    t.string  "can_retry",           limit: 1,   default: "N", null: false
    t.string  "build_nack_file",     limit: 1,   default: "N", null: false
    t.string  "skip_last",           limit: 1,   default: "N", null: false
  end

  add_index "incoming_file_types", ["sc_service_id", "code"], name: "in_file_types_1", unique: true

  create_table "incoming_files", force: :cascade do |t|
    t.string   "service_name",               limit: 10
    t.string   "file_type",                  limit: 10
    t.string   "file"
    t.string   "file_name",                  limit: 100
    t.integer  "size_in_bytes"
    t.integer  "line_count"
    t.string   "status",                     limit: 1
    t.date     "started_at"
    t.date     "ended_at"
    t.string   "created_by",                 limit: 20
    t.string   "updated_by",                 limit: 20
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at"
    t.string   "fault_code",                 limit: 50
    t.string   "fault_subcode",              limit: 50
    t.string   "fault_reason",               limit: 1000
    t.integer  "lock_version",                            default: 0, null: false
    t.string   "broker_uuid",                limit: 255
    t.integer  "failed_record_count"
    t.string   "rep_file_name"
    t.string   "rep_file_path"
    t.string   "rep_file_status",            limit: 1
    t.string   "pending_approval",           limit: 1
    t.string   "file_path"
    t.string   "last_process_step",          limit: 1
    t.integer  "record_count"
    t.integer  "skipped_record_count"
    t.integer  "completed_record_count"
    t.integer  "timedout_record_count"
    t.integer  "alert_count"
    t.datetime "last_alert_at"
    t.integer  "bad_record_count"
    t.text     "fault_bitstream"
    t.integer  "pending_retry_record_count"
    t.integer  "overriden_record_count"
    t.string   "nack_file_name",             limit: 150
    t.string   "nack_file_path"
    t.string   "nack_file_status",           limit: 1
    t.text     "header_record"
  end

  add_index "incoming_files", ["service_name", "status", "pending_approval"], name: "in_incoming_files_2"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "sc_services", force: :cascade do |t|
    t.string "code", limit: 50, null: false
    t.string "name", limit: 50, null: false
  end

  add_index "sc_services", ["code"], name: "in_sc_services_1", unique: true
  add_index "sc_services", ["name"], name: "in_sc_services_2", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "",    null: false
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "inactive",                          default: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "unique_session_id",      limit: 20
    t.string   "mobile_no"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
