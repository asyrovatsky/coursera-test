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

ActiveRecord::Schema.define(version: 20161128161447) do

  create_table "account_reminders", force: :cascade do |t|
    t.string   "reminder_type", limit: 255
    t.text     "description",   limit: 65535
    t.date     "remind_on"
    t.boolean  "active",        limit: 1,     default: true
    t.integer  "account_id",    limit: 4
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "accounts", force: :cascade do |t|
    t.integer  "company_id",     limit: 4
    t.integer  "address_id",     limit: 4
    t.string   "account_number", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id",        limit: 4
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.text     "body",          limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "namespace",     limit: 255
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_admin_notes_on_resource_type_and_resource_id", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.string   "line1",        limit: 255
    t.string   "line2",        limit: 255
    t.string   "city",         limit: 255
    t.string   "county",       limit: 255
    t.string   "postcode",     limit: 255
    t.string   "country_code", limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "user_id",      limit: 4
    t.boolean  "default",      limit: 1,   default: false
    t.integer  "complaint_id", limit: 4
    t.uuid     "sync_id",      limit: 16,                  null: false
  end

  create_table "case_file_events", force: :cascade do |t|
    t.integer  "case_file_id", limit: 4
    t.integer  "user_id",      limit: 4
    t.text     "description",  limit: 65535
    t.string   "source",       limit: 3,     default: "web"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "case_file_events", ["case_file_id"], name: "index_case_file_events_on_case_file_id", using: :btree

  create_table "case_file_events_latin1", force: :cascade do |t|
    t.integer  "case_file_id", limit: 4
    t.integer  "user_id",      limit: 4
    t.text     "description",  limit: 65535
    t.string   "source",       limit: 3,     default: "web"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "case_file_events_latin1", ["case_file_id"], name: "index_case_file_events_on_case_file_id", using: :btree

  create_table "case_file_exports", force: :cascade do |t|
    t.integer  "case_file_id",     limit: 4
    t.string   "pdf_file_name",    limit: 255
    t.string   "pdf_content_type", limit: 255
    t.integer  "pdf_file_size",    limit: 4
    t.datetime "pdf_updated_at"
    t.string   "zip_file_name",    limit: 255
    t.string   "zip_content_type", limit: 255
    t.integer  "zip_file_size",    limit: 4
    t.datetime "zip_updated_at"
    t.string   "status",           limit: 255
  end

  add_index "case_file_exports", ["case_file_id"], name: "index_case_file_exports_on_case_file_id", using: :btree

  create_table "case_file_items", force: :cascade do |t|
    t.integer  "as_case_file_item_id",   limit: 4
    t.string   "as_case_file_item_type", limit: 255
    t.integer  "case_file_id",           limit: 4
    t.string   "summary",                limit: 255
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "direction",              limit: 4
    t.integer  "feeling",                limit: 4,   default: 1
    t.uuid     "sync_id",                limit: 16,              null: false
  end

  add_index "case_file_items", ["as_case_file_item_id", "as_case_file_item_type"], name: "case_file_items_on_as_case_file_item", using: :btree
  add_index "case_file_items", ["case_file_id"], name: "index_case_file_items_on_case_file_id", using: :btree

  create_table "case_file_versions", force: :cascade do |t|
    t.string   "item_type",      limit: 191,        null: false
    t.integer  "item_id",        limit: 4,          null: false
    t.string   "event",          limit: 255,        null: false
    t.string   "whodunnit",      limit: 255
    t.string   "status",         limit: 255
    t.string   "current_status", limit: 255
    t.boolean  "closed",         limit: 1
    t.boolean  "current_closed", limit: 1
    t.text     "object",         limit: 4294967295
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "case_file_versions", ["item_type", "item_id"], name: "index_case_file_versions_on_item_type_and_item_id", using: :btree

  create_table "case_files", force: :cascade do |t|
    t.string   "reference",                          limit: 255
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.integer  "company_id",                         limit: 4
    t.integer  "service_id",                         limit: 4
    t.string   "token",                              limit: 255
    t.integer  "user_id",                            limit: 4
    t.integer  "current_service_level_id",           limit: 4
    t.boolean  "closed",                             limit: 1
    t.string   "next_action",                        limit: 255
    t.date     "next_action_date"
    t.boolean  "next_action_reminder_sent",          limit: 1,   default: false
    t.integer  "resolver_id",                        limit: 4
    t.boolean  "unread_email_notifications_enabled", limit: 1,   default: true
    t.string   "submit_type",                        limit: 10
    t.uuid     "sync_id",                            limit: 16,                  null: false
    t.string   "dtmf_token",                         limit: 255
    t.string   "status",                             limit: 255
    t.date     "nudge_reminder_send_date"
    t.integer  "issue_type_id",                      limit: 4
    t.string   "from_email_address",                 limit: 255
    t.integer  "case_id",                            limit: 4
    t.string   "flow_complaint_id",                  limit: 255
    t.string   "close_case_token",                   limit: 255
    t.datetime "close_case_datetime"
  end

  add_index "case_files", ["close_case_token"], name: "index_case_files_on_close_case_token", unique: true, using: :btree
  add_index "case_files", ["current_service_level_id"], name: "index_case_files_on_current_service_level_id", using: :btree
  add_index "case_files", ["flow_complaint_id"], name: "index_case_files_on_flow_complaint_id", unique: true, using: :btree
  add_index "case_files", ["from_email_address"], name: "index_case_files_on_from_email_address", using: :btree
  add_index "case_files", ["resolver_id"], name: "index_case_files_on_resolver_id", unique: true, using: :btree
  add_index "case_files", ["status"], name: "index_case_files_on_status", using: :btree
  add_index "case_files", ["token"], name: "index_case_files_on_token", unique: true, using: :btree
  add_index "case_files", ["user_id"], name: "index_case_files_on_user_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name",                             limit: 255
    t.string   "description",                      limit: 255
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
    t.integer  "rank",                             limit: 4
    t.boolean  "accepts_email",                    limit: 1,        default: true
    t.boolean  "accepts_phone",                    limit: 1,        default: true
    t.string   "preferred_method",                 limit: 255,      default: "email"
    t.text     "aliases",                          limit: 16777215
    t.string   "logo_file_name",                   limit: 255
    t.string   "logo_content_type",                limit: 255
    t.integer  "logo_file_size",                   limit: 4
    t.datetime "logo_updated_at"
    t.string   "slug",                             limit: 255
    t.boolean  "visible",                          limit: 1,        default: true
    t.boolean  "test",                             limit: 1
    t.string   "twitter_handle",                   limit: 255
    t.boolean  "receive_nudge_emails",             limit: 1,        default: true
    t.boolean  "receive_nudge_tweets",             limit: 1,        default: true
    t.boolean  "local",                            limit: 1,        default: false,   null: false
    t.string   "manual_form_url",                  limit: 255
    t.boolean  "resolver_friendly",                limit: 1,        default: true
    t.string   "source_id",                        limit: 255
    t.string   "header_logo_file_name",            limit: 255
    t.string   "header_logo_content_type",         limit: 255
    t.integer  "header_logo_file_size",            limit: 4
    t.datetime "header_logo_updated_at"
    t.string   "header_text",                      limit: 255
    t.text     "auto_response_text",               limit: 65535
    t.string   "response_time",                    limit: 255
    t.date     "email_verification_date"
    t.text     "rights",                           limit: 65535
    t.text     "rights_details",                   limit: 65535
    t.boolean  "vas_intelligent_email",            limit: 1,        default: false
    t.boolean  "vas_submitted_notification",       limit: 1,        default: false
    t.text     "domains_whitelist",                limit: 65535
    t.boolean  "vas_require_secure_communication", limit: 1,        default: false
  end

  add_index "companies", ["aliases"], name: "by_aliases", length: {"aliases"=>255}, using: :btree
  add_index "companies", ["local"], name: "index_companies_on_local", using: :btree
  add_index "companies", ["slug"], name: "index_companies_on_slug", unique: true, using: :btree

  create_table "companies_control_groups", id: false, force: :cascade do |t|
    t.integer "control_group_id", limit: 4, null: false
    t.integer "company_id",       limit: 4, null: false
  end

  add_index "companies_control_groups", ["company_id", "control_group_id"], name: "company_id_control_group_id", unique: true, using: :btree
  add_index "companies_control_groups", ["control_group_id", "company_id"], name: "control_group_id_company_id", unique: true, using: :btree

  create_table "companies_sectors", force: :cascade do |t|
    t.integer "company_id", limit: 4
    t.integer "sector_id",  limit: 4
    t.integer "rank",       limit: 4
  end

  add_index "companies_sectors", ["company_id"], name: "index_companies_sectors_on_company_id", using: :btree
  add_index "companies_sectors", ["sector_id", "company_id"], name: "index_companies_sectors_on_sector_id_and_company_id", unique: true, using: :btree
  add_index "companies_sectors", ["sector_id"], name: "index_companies_sectors_on_sector_id", using: :btree

  create_table "companies_users", id: false, force: :cascade do |t|
    t.integer "company_id", limit: 4
    t.integer "user_id",    limit: 4
  end

  add_index "companies_users", ["company_id", "user_id"], name: "companies_users_index", unique: true, using: :btree

  create_table "company_rights", force: :cascade do |t|
    t.integer  "issue_type_id", limit: 4
    t.integer  "company_id",    limit: 4
    t.text     "rights",        limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "company_services", force: :cascade do |t|
    t.integer  "company_id", limit: 4
    t.integer  "service_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "company_translations", force: :cascade do |t|
    t.integer  "company_id",  limit: 4
    t.string   "locale",      limit: 255,   null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "about_info",  limit: 65535
    t.text     "faqs_info",   limit: 65535
    t.text     "help_info",   limit: 65535
    t.text     "summary",     limit: 65535
    t.text     "rights_note", limit: 65535
  end

  add_index "company_translations", ["company_id"], name: "index_company_translations_on_company_id", using: :btree
  add_index "company_translations", ["locale"], name: "index_company_translations_on_locale", using: :btree

  create_table "complaints", force: :cascade do |t|
    t.integer  "case_file_id",  limit: 4
    t.text     "what_happened", limit: 65535
    t.date     "when_happened"
    t.text     "want",          limit: 65535
    t.integer  "feeling",       limit: 4
    t.integer  "issue_type_id", limit: 4
    t.integer  "issue_id",      limit: 4
    t.string   "account",       limit: 255
    t.uuid     "sync_id",       limit: 16
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "complaints", ["case_file_id"], name: "index_complaints_on_case_file_id", using: :btree

  create_table "complaints_bak", force: :cascade do |t|
    t.integer  "case_file_id",          limit: 4
    t.integer  "as_complaint_bak_id",   limit: 4
    t.string   "as_complaint_bak_type", limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.uuid     "sync_id",               limit: 16,  null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "job_title",  limit: 255
    t.string   "email",      limit: 255, null: false
    t.string   "phone",      limit: 255
    t.integer  "company_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "contacts", ["company_id"], name: "index_contacts_on_company_id", using: :btree

  create_table "control_groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string   "attachment_file_name",    limit: 255
    t.string   "attachment_content_type", limit: 255
    t.integer  "attachment_file_size",    limit: 4
    t.datetime "attachment_updated_at"
    t.string   "name",                    limit: 255
    t.string   "document_type",           limit: 255
    t.datetime "attachment_received_at"
    t.string   "status",                  limit: 255
  end

  create_table "documents_emails", id: false, force: :cascade do |t|
    t.integer "document_id", limit: 4
    t.integer "email_id",    limit: 4
  end

  add_index "documents_emails", ["document_id", "email_id"], name: "index_documents_emails_on_document_id_and_email_id", using: :btree
  add_index "documents_emails", ["email_id", "document_id"], name: "index_documents_emails_on_email_id_and_document_id", using: :btree

  create_table "email_failures", force: :cascade do |t|
    t.string   "cause",      limit: 255
    t.integer  "email_id",   limit: 4
    t.string   "to",         limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "emails", force: :cascade do |t|
    t.string   "from",                   limit: 255
    t.string   "to",                     limit: 255
    t.string   "latin_subject",          limit: 255
    t.text     "latin_body",             limit: 65535
    t.boolean  "read",                   limit: 1,          default: false
    t.string   "cc",                     limit: 255
    t.boolean  "attached_case_file",     limit: 1,          default: false
    t.string   "from_name",              limit: 255
    t.text     "latin_body_html",        limit: 65535
    t.integer  "received_email_id",      limit: 4
    t.datetime "sent_at"
    t.datetime "received_at"
    t.boolean  "failed",                 limit: 1,          default: false
    t.datetime "company_opened_at"
    t.integer  "purpose",                limit: 4
    t.string   "checksum",               limit: 255
    t.string   "subject",                limit: 1000
    t.text     "body",                   limit: 4294967295
    t.text     "body_html",              limit: 4294967295
    t.integer  "reply_to_id",            limit: 4
    t.boolean  "on_hold",                limit: 1,          default: false, null: false
    t.float    "nlp_sentiment",          limit: 24
    t.text     "nlp_summary",            limit: 65535
    t.text     "nlp_keywords",           limit: 65535
    t.float    "escalation_probability", limit: 24
    t.string   "probability_group",      limit: 255
  end

  add_index "emails", ["checksum"], name: "index_emails_on_checksum", using: :btree
  add_index "emails", ["received_at"], name: "index_emails_on_received_at", using: :btree
  add_index "emails", ["reply_to_id"], name: "index_emails_on_reply_to_id", using: :btree

  create_table "erb_email_templates", force: :cascade do |t|
    t.integer  "issue_type_id", limit: 4
    t.integer  "feeling",       limit: 4
    t.text     "body",          limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "subject",       limit: 255
  end

  create_table "escalation_email_templates", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.text     "body",          limit: 65535
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "subject",       limit: 255
    t.integer  "issue_type_id", limit: 4
    t.integer  "service_level", limit: 4
    t.boolean  "recommended",   limit: 1
    t.integer  "rank",          limit: 4,     default: 0
  end

  create_table "explanations", force: :cascade do |t|
    t.text     "body",         limit: 65535, null: false
    t.integer  "case_file_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "explanations", ["case_file_id"], name: "index_explanations_on_case_file_id", using: :btree

  create_table "features", force: :cascade do |t|
    t.string   "entity",         limit: 255,                 null: false
    t.boolean  "named",          limit: 1,   default: false
    t.integer  "email_id",       limit: 4
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "trigger_phrase", limit: 255,                 null: false
  end

  add_index "features", ["email_id"], name: "index_features_on_email_id", using: :btree

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "case_file_id",         limit: 4
    t.integer  "feeling",              limit: 4, default: 0, null: false
    t.integer  "company_nps",          limit: 4
    t.integer  "company_satisfaction", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feedbacks", ["case_file_id"], name: "index_feedbacks_on_case_file_id", using: :btree

  create_table "issue_type_form_options", force: :cascade do |t|
    t.string   "reference_label",           limit: 255
    t.string   "reference_placeholder",     limit: 255
    t.string   "reference_value",           limit: 255
    t.string   "what_happened_label",       limit: 255
    t.string   "what_happened_placeholder", limit: 255
    t.text     "what_happened_value",       limit: 65535
    t.string   "want_label",                limit: 255
    t.string   "want_placeholder",          limit: 255
    t.text     "want_value",                limit: 65535
    t.boolean  "show_address",              limit: 1
    t.string   "issue_type_id",             limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "when_happened_label",       limit: 255
  end

  create_table "issue_types", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "issue_id",        limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.text     "rights",          limit: 65535
    t.boolean  "shared",          limit: 1,     default: false
    t.text     "business_rights", limit: 65535
    t.string   "slug",            limit: 255
    t.boolean  "visible",         limit: 1,     default: true,  null: false
    t.string   "flow_app_path",   limit: 255
    t.integer  "starting_level",  limit: 4,     default: 1
    t.string   "rights_details",  limit: 255
  end

  add_index "issue_types", ["issue_id"], name: "issue_types_issue_id", using: :btree
  add_index "issue_types", ["slug"], name: "index_issue_types_on_slug", unique: true, using: :btree

  create_table "issues", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "service_type_id", limit: 4
    t.boolean  "shared",          limit: 1,   default: false
    t.boolean  "visible",         limit: 1,   default: true,  null: false
  end

  add_index "issues", ["service_type_id"], name: "issues_service_type_id", using: :btree

  create_table "long_tail_seos", force: :cascade do |t|
    t.string   "header",     limit: 255
    t.text     "body",       limit: 65535
    t.integer  "company_id", limit: 4
    t.string   "slug",       limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "long_tail_seos", ["company_id"], name: "index_long_tail_seos_on_company_id", using: :btree
  add_index "long_tail_seos", ["slug"], name: "index_long_tail_seos_on_slug", unique: true, using: :btree

  create_table "machine_mail_domains", force: :cascade do |t|
    t.string   "domain",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mm_email_templates", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.string   "type",                 limit: 255
    t.string   "subject",              limit: 255
    t.boolean  "resolver",             limit: 1,   default: false
    t.integer  "complaint_owner_id",   limit: 4
    t.string   "complaint_owner_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rank",                 limit: 4
    t.boolean  "regulator",            limit: 1,   default: false
    t.string   "category",             limit: 255,                 null: false
  end

  create_table "notes", force: :cascade do |t|
    t.string "title", limit: 255
    t.text   "body",  limit: 65535
  end

  create_table "nudge_reminders", force: :cascade do |t|
    t.integer  "feeling",         limit: 4
    t.string   "subject",         limit: 255
    t.text     "text",            limit: 65535
    t.integer  "inactivity_days", limit: 4,     default: 7
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "tweet",           limit: 140
    t.text     "variables",       limit: 65535
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id", limit: 4,    null: false
    t.integer  "application_id",    limit: 4,    null: false
    t.string   "token",             limit: 255,  null: false
    t.integer  "expires_in",        limit: 4,    null: false
    t.string   "redirect_uri",      limit: 2048, null: false
    t.datetime "created_at",                     null: false
    t.datetime "revoked_at"
    t.string   "scopes",            limit: 255
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id", limit: 4
    t.integer  "application_id",    limit: 4,   null: false
    t.string   "token",             limit: 255, null: false
    t.string   "refresh_token",     limit: 255
    t.integer  "expires_in",        limit: 4
    t.datetime "revoked_at"
    t.datetime "created_at",                    null: false
    t.string   "scopes",            limit: 255
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",         limit: 255,               null: false
    t.string   "uid",          limit: 255,               null: false
    t.string   "secret",       limit: 255,               null: false
    t.string   "redirect_uri", limit: 2048,              null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "scopes",       limit: 255,  default: "", null: false
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "partners", force: :cascade do |t|
    t.string   "name",                    limit: 255
    t.string   "username",                limit: 255
    t.string   "password",                limit: 255
    t.boolean  "enabled",                 limit: 1,   default: true
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "access_token",            limit: 255
    t.datetime "access_token_expires_at"
    t.string   "landing_page",            limit: 32
    t.string   "code",                    limit: 32
    t.string   "view",                    limit: 255
  end

  add_index "partners", ["code"], name: "index_partners_on_code", using: :btree

  create_table "phone_calls", force: :cascade do |t|
    t.string   "who",                    limit: 255
    t.text     "promised_what",          limit: 65535
    t.date     "promised_when"
    t.date     "when"
    t.string   "phone_number",           limit: 255
    t.string   "call_sid",               limit: 255
    t.string   "state",                  limit: 255
    t.string   "recording_file_name",    limit: 255
    t.string   "recording_content_type", limit: 255
    t.integer  "recording_file_size",    limit: 4
    t.datetime "recording_updated_at"
    t.string   "dtmf_token",             limit: 255
  end

  create_table "ppi_complaints", force: :cascade do |t|
    t.string   "provider",              limit: 255
    t.string   "policy_number",         limit: 255
    t.string   "account_number",        limit: 255
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "contact_name",          limit: 255
    t.string   "company_name",          limit: 255
    t.string   "telephone",             limit: 255
    t.boolean  "complained_before",     limit: 1
    t.integer  "user_id",               limit: 4
    t.integer  "company_id",            limit: 4
    t.datetime "purchased_at"
    t.boolean  "policy_number_unknown", limit: 1
    t.text     "body",                  limit: 65535
    t.text     "request_paperwork",     limit: 65535
    t.string   "address_line1",         limit: 255
    t.string   "address_line2",         limit: 255
    t.string   "city",                  limit: 255
    t.string   "county",                limit: 255
    t.string   "postcode",              limit: 255
    t.boolean  "completed",             limit: 1,     default: false
    t.string   "credit_card_number",    limit: 255
    t.string   "covered",               limit: 255
  end

  create_table "ppi_complaints_about_you", force: :cascade do |t|
    t.integer  "ppi_complaint_id",                          limit: 4
    t.string   "cover_type",                                limit: 255
    t.string   "title",                                     limit: 255
    t.string   "first_name",                                limit: 255
    t.string   "last_name",                                 limit: 255
    t.date     "date_of_birth"
    t.string   "daytime_phone",                             limit: 255
    t.string   "home_phone",                                limit: 255
    t.string   "mobile",                                    limit: 255
    t.string   "title_partner",                             limit: 255
    t.string   "last_name_partner",                         limit: 255
    t.string   "first_name_partner",                        limit: 255
    t.date     "date_of_birth_partner"
    t.string   "employment_status",                         limit: 255
    t.string   "work",                                      limit: 255
    t.string   "employer_name",                             limit: 255
    t.string   "employment_status_partner",                 limit: 255
    t.string   "work_partner",                              limit: 255
    t.string   "employer_name_partner",                     limit: 255
    t.string   "employment_status_changed",                 limit: 255
    t.string   "employment_status_changed_details",         limit: 255
    t.string   "sick_pay",                                  limit: 255
    t.string   "sick_pay_details",                          limit: 255
    t.string   "sick_pay_partner",                          limit: 255
    t.string   "sick_pay_details_partner",                  limit: 255
    t.string   "repayment_method",                          limit: 255
    t.string   "repayment_method_details",                  limit: 255
    t.string   "repayment_method_partner",                  limit: 255
    t.string   "repayment_method_details_partner",          limit: 255
    t.string   "health_issues",                             limit: 255
    t.text     "health_issues_details",                     limit: 65535
    t.string   "health_issues_partner",                     limit: 255
    t.text     "health_issues_details_partner",             limit: 65535
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.integer  "address_id",                                limit: 4
    t.string   "employment_status_changed_partner",         limit: 255
    t.string   "employment_status_changed_partner_details", limit: 255
    t.integer  "length_of_employment_years",                limit: 4
    t.integer  "length_of_employment_months",               limit: 4
    t.integer  "length_of_employment_partner_years",        limit: 4
    t.integer  "length_of_employment_partner_months",       limit: 4
  end

  create_table "ppi_complaints_details", force: :cascade do |t|
    t.integer  "ppi_complaint_id",       limit: 4
    t.date     "policy_start_date"
    t.string   "sold_method",            limit: 255
    t.string   "given_advice",           limit: 255
    t.string   "payment_method",         limit: 255
    t.string   "current_situation",      limit: 255
    t.date     "date_cancelled"
    t.string   "claimed",                limit: 255
    t.text     "claim_details",          limit: 65535
    t.string   "reason",                 limit: 255
    t.text     "reason_details",         limit: 65535
    t.text     "debt_details",           limit: 65535
    t.string   "missed_payment",         limit: 255
    t.text     "missed_payment_details", limit: 65535
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "ppi_complaints_your_complaint", force: :cascade do |t|
    t.integer "ppi_complaint_id",                        limit: 4
    t.boolean "employment_status",                       limit: 1
    t.boolean "employment_status_status",                limit: 1
    t.string  "employment_status_was",                   limit: 255
    t.string  "employment_status_state",                 limit: 255
    t.boolean "employment_status_work_status_age",       limit: 1
    t.string  "employment_status_age",                   limit: 255
    t.boolean "lender_fined",                            limit: 1
    t.boolean "lender_fined_selling_ppi",                limit: 1
    t.boolean "medical_condition",                       limit: 1
    t.boolean "medical_condition_not_informed",          limit: 1
    t.boolean "medical_condition_not_covered",           limit: 1
    t.string  "medical_condition_condition",             limit: 255
    t.boolean "single_premium",                          limit: 1
    t.boolean "single_premium_paid",                     limit: 1
    t.string  "single_premium_ended",                    limit: 255
    t.string  "single_premium_paid_back_date",           limit: 255
    t.string  "single_premium_cancelled_date",           limit: 255
    t.string  "single_premium_not_eligible_date",        limit: 255
    t.boolean "unable_to_cancel",                        limit: 1
    t.boolean "unable_to_cancel_contacted",              limit: 1
    t.date    "unable_to_cancel_contact_date"
    t.string  "unable_to_cancel_reason",                 limit: 255
    t.string  "unable_to_cancel_refund",                 limit: 255
    t.boolean "compulsory",                              limit: 1
    t.boolean "compulsory_assist",                       limit: 1
    t.string  "compulsory_assist_stated",                limit: 255
    t.boolean "compulsory_pushy",                        limit: 1
    t.boolean "compulsory_optional",                     limit: 1
    t.boolean "compulsory_essential",                    limit: 1
    t.string  "compulsory_essential_stated",             limit: 255
    t.boolean "unaware_of_cover",                        limit: 1
    t.boolean "unaware_of_cover_paying",                 limit: 1
    t.boolean "missold",                                 limit: 1
    t.boolean "missold_not_given_full_information",      limit: 1
    t.boolean "already_covered",                         limit: 1
    t.boolean "already_covered_alternative",             limit: 1
    t.string  "already_covered_alternative_had",         limit: 255
    t.boolean "already_covered_alternative_informed",    limit: 1
    t.boolean "joint_loan",                              limit: 1
    t.boolean "joint_loan_single_name",                  limit: 1
    t.string  "joint_loan_name_covered",                 limit: 255
    t.string  "joint_loan_name_not_covered",             limit: 255
    t.string  "joint_loan_not_covered_reason",           limit: 255
    t.string  "joint_loan_not_covered_informed",         limit: 255
    t.boolean "not_full_length",                         limit: 1
    t.boolean "not_full_length_first_five_years",        limit: 1
    t.string  "not_full_length_first_five_years_covers", limit: 255
    t.boolean "signed_up_in_shop",                       limit: 1
    t.boolean "signed_up_in_shop_not_in_best_interests", limit: 1
    t.boolean "not_told_total_price",                    limit: 1
    t.boolean "not_told_total_price_not_affordable",     limit: 1
    t.text    "more_information",                        limit: 65535
    t.boolean "lender_still_added",                      limit: 1
    t.boolean "lender_still_added_details",              limit: 1
  end

  create_table "ppi_paperwork_requests", force: :cascade do |t|
    t.integer  "company_id",      limit: 4
    t.string   "account_number",  limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "is_account_open", limit: 1
    t.string   "title",           limit: 255
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "email",           limit: 255
    t.text     "body",            limit: 65535
    t.integer  "address_id",      limit: 4
    t.string   "sent_method",     limit: 255
    t.datetime "purchased_at"
  end

  add_index "ppi_paperwork_requests", ["company_id"], name: "index_ppi_paperwork_requests_on_company_id", using: :btree

  create_table "presenter_data", force: :cascade do |t|
    t.integer  "resource_id", limit: 4
    t.string   "key",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "presenter_data", ["key"], name: "index_presenter_data_on_key", using: :btree
  add_index "presenter_data", ["resource_id"], name: "index_presenter_data_on_resource_id", using: :btree

  create_table "presenter_datum_translations", force: :cascade do |t|
    t.integer  "presenter_datum_id", limit: 4,     null: false
    t.string   "locale",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "browser_title",      limit: 255
    t.text     "page_description",   limit: 65535
  end

  add_index "presenter_datum_translations", ["locale"], name: "index_presenter_datum_translations_on_locale", using: :btree
  add_index "presenter_datum_translations", ["presenter_datum_id"], name: "index_presenter_datum_translations_on_presenter_datum_id", using: :btree

  create_table "presenter_datum_translations_latin1", force: :cascade do |t|
    t.integer  "presenter_datum_id", limit: 4,     null: false
    t.string   "locale",             limit: 255,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "browser_title",      limit: 255
    t.text     "page_description",   limit: 65535
  end

  add_index "presenter_datum_translations_latin1", ["locale"], name: "index_presenter_datum_translations_on_locale", using: :btree
  add_index "presenter_datum_translations_latin1", ["presenter_datum_id"], name: "index_presenter_datum_translations_on_presenter_datum_id", using: :btree

  create_table "received_email_attachments", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.boolean  "base64",            limit: 1
    t.string   "mime_type",         limit: 255
    t.string   "attachment_type",   limit: 255
    t.string   "s3_path",           limit: 255
    t.string   "s3_bucket",         limit: 255
    t.integer  "received_email_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "received_email_attachments", ["received_email_id"], name: "index_received_email_attachments_on_received_email_id", using: :btree

  create_table "received_emails", force: :cascade do |t|
    t.text     "latin_json",    limit: 4294967295
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "from_email",    limit: 255
    t.string   "latin_subject", limit: 1000
    t.string   "from_name",     limit: 255
    t.string   "to_email",      limit: 255
    t.string   "to_name",       limit: 255
    t.text     "latin_text",    limit: 4294967295
    t.text     "latin_html",    limit: 4294967295
    t.datetime "sent_at"
    t.text     "source",        limit: 16777215
    t.string   "subject",       limit: 1000
    t.text     "text",          limit: 4294967295
    t.text     "html",          limit: 4294967295
    t.text     "json",          limit: 4294967295
  end

  create_table "received_emails_bak", force: :cascade do |t|
    t.text     "latin_json",    limit: 4294967295
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "from_email",    limit: 255
    t.string   "latin_subject", limit: 1000
    t.string   "from_name",     limit: 255
    t.string   "to_email",      limit: 255
    t.string   "to_name",       limit: 255
    t.text     "latin_text",    limit: 4294967295
    t.text     "latin_html",    limit: 4294967295
    t.datetime "sent_at"
    t.text     "source",        limit: 16777215
    t.string   "subject",       limit: 1000
    t.text     "text",          limit: 4294967295
    t.text     "html",          limit: 4294967295
    t.text     "json",          limit: 4294967295
  end

  create_table "refinery_images", force: :cascade do |t|
    t.string   "image_mime_type", limit: 255
    t.string   "image_name",      limit: 255
    t.integer  "image_size",      limit: 4
    t.integer  "image_width",     limit: 4
    t.integer  "image_height",    limit: 4
    t.string   "image_uid",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refinery_page_part_translations", force: :cascade do |t|
    t.integer  "refinery_page_part_id", limit: 4,     null: false
    t.string   "locale",                limit: 255,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "body",                  limit: 65535
  end

  add_index "refinery_page_part_translations", ["locale"], name: "index_refinery_page_part_translations_on_locale", using: :btree
  add_index "refinery_page_part_translations", ["refinery_page_part_id"], name: "index_refinery_page_part_translations_on_refinery_page_part_id", using: :btree

  create_table "refinery_page_parts", force: :cascade do |t|
    t.integer  "refinery_page_id", limit: 4
    t.string   "title",            limit: 255
    t.text     "body",             limit: 65535
    t.integer  "position",         limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "refinery_page_parts", ["id"], name: "index_refinery_page_parts_on_id", using: :btree
  add_index "refinery_page_parts", ["refinery_page_id"], name: "index_refinery_page_parts_on_refinery_page_id", using: :btree

  create_table "refinery_page_translations", force: :cascade do |t|
    t.integer  "refinery_page_id", limit: 4,   null: false
    t.string   "locale",           limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",            limit: 255
    t.string   "custom_slug",      limit: 255
    t.string   "menu_title",       limit: 255
    t.string   "slug",             limit: 255
  end

  add_index "refinery_page_translations", ["locale"], name: "index_refinery_page_translations_on_locale", using: :btree
  add_index "refinery_page_translations", ["refinery_page_id"], name: "index_refinery_page_translations_on_refinery_page_id", using: :btree

  create_table "refinery_pages", force: :cascade do |t|
    t.integer  "parent_id",           limit: 4
    t.string   "path",                limit: 255
    t.string   "slug",                limit: 255
    t.string   "custom_slug",         limit: 255
    t.boolean  "show_in_menu",        limit: 1,   default: true
    t.string   "link_url",            limit: 255
    t.string   "menu_match",          limit: 255
    t.boolean  "deletable",           limit: 1,   default: true
    t.boolean  "draft",               limit: 1,   default: false
    t.boolean  "skip_to_first_child", limit: 1,   default: false
    t.integer  "lft",                 limit: 4
    t.integer  "rgt",                 limit: 4
    t.integer  "depth",               limit: 4
    t.string   "view_template",       limit: 255
    t.string   "layout_template",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "preview_img",         limit: 255
  end

  add_index "refinery_pages", ["depth"], name: "index_refinery_pages_on_depth", using: :btree
  add_index "refinery_pages", ["id"], name: "index_refinery_pages_on_id", using: :btree
  add_index "refinery_pages", ["lft"], name: "index_refinery_pages_on_lft", using: :btree
  add_index "refinery_pages", ["parent_id"], name: "index_refinery_pages_on_parent_id", using: :btree
  add_index "refinery_pages", ["rgt"], name: "index_refinery_pages_on_rgt", using: :btree

  create_table "refinery_resources", force: :cascade do |t|
    t.string   "file_mime_type", limit: 255
    t.string   "file_name",      limit: 255
    t.integer  "file_size",      limit: 4
    t.string   "file_uid",       limit: 255
    t.string   "file_ext",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refinery_roles", force: :cascade do |t|
    t.string "title", limit: 255
  end

  create_table "refinery_roles_users", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "refinery_roles_users", ["role_id", "user_id"], name: "index_refinery_roles_users_on_role_id_and_user_id", using: :btree
  add_index "refinery_roles_users", ["user_id", "role_id"], name: "index_refinery_roles_users_on_user_id_and_role_id", using: :btree

  create_table "refinery_user_plugins", force: :cascade do |t|
    t.integer "user_id",  limit: 4
    t.string  "name",     limit: 255
    t.integer "position", limit: 4
  end

  add_index "refinery_user_plugins", ["name"], name: "index_refinery_user_plugins_on_name", using: :btree
  add_index "refinery_user_plugins", ["user_id", "name"], name: "index_refinery_user_plugins_on_user_id_and_name", unique: true, using: :btree

  create_table "refinery_users", force: :cascade do |t|
    t.string   "username",               limit: 255, null: false
    t.string   "email",                  limit: 255, null: false
    t.string   "encrypted_password",     limit: 255, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "sign_in_count",          limit: 4
    t.datetime "remember_created_at"
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",                   limit: 255
    t.string   "full_name",              limit: 255
  end

  add_index "refinery_users", ["id"], name: "index_refinery_users_on_id", using: :btree
  add_index "refinery_users", ["slug"], name: "index_refinery_users_on_slug", using: :btree

  create_table "regulator_escalations", force: :cascade do |t|
    t.text     "what_want",          limit: 65535
    t.text     "final_response",     limit: 65535
    t.string   "escalation_reason",  limit: 255
    t.text     "escalation_details", limit: 65535
    t.string   "user_tel_no",        limit: 255
    t.integer  "feelings",           limit: 4
    t.integer  "case_file_id",       limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "regulator_escalations", ["case_file_id"], name: "index_regulator_escalations_on_case_file_id", using: :btree

  create_table "regulator_translations", force: :cascade do |t|
    t.integer  "regulator_id", limit: 4,     null: false
    t.string   "locale",       limit: 255,   null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "notes",        limit: 65535
  end

  add_index "regulator_translations", ["locale"], name: "index_regulator_translations_on_locale", using: :btree
  add_index "regulator_translations", ["regulator_id"], name: "index_regulator_translations_on_regulator_id", using: :btree

  create_table "regulators", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "email",             limit: 255
    t.string   "phone",             limit: 255
    t.string   "address1",          limit: 255
    t.string   "address2",          limit: 255
    t.string   "address3",          limit: 255
    t.string   "postcode",          limit: 255
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size",    limit: 4
    t.datetime "logo_updated_at"
    t.boolean  "visible",           limit: 1,   default: false, null: false
    t.string   "slug",              limit: 255
    t.boolean  "send_case_file",    limit: 1,   default: true
    t.string   "domains_whitelist", limit: 255
  end

  add_index "regulators", ["slug"], name: "index_regulators_on_slug", unique: true, using: :btree

  create_table "reminders", force: :cascade do |t|
    t.string  "title",       limit: 255
    t.text    "description", limit: 65535
    t.date    "remind_on"
    t.boolean "active",      limit: 1,     default: true
  end

  create_table "reply_email_templates", force: :cascade do |t|
    t.integer  "rank",       limit: 4
    t.string   "subject",    limit: 255
    t.text     "body",       limit: 65535
    t.string   "title",      limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "resolver_analytics_case_files", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resolver_analytics_s3_uploaders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resolver_analytics_search_terms", force: :cascade do |t|
    t.string   "text",        limit: 255
    t.integer  "impressions", limit: 4
    t.integer  "clicks",      limit: 4
    t.integer  "ctr",         limit: 4
    t.float    "position",    limit: 24
    t.datetime "searched_on"
    t.string   "scope",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "resolver_analytics_search_terms", ["searched_on"], name: "index_resolver_analytics_search_terms_on_searched_on", using: :btree
  add_index "resolver_analytics_search_terms", ["text"], name: "index_resolver_analytics_search_terms_on_text", using: :btree

  create_table "resolver_email_templates", force: :cascade do |t|
    t.string   "key",         limit: 255
    t.string   "description", limit: 255
    t.text     "text",        limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "variables",   limit: 65535
    t.text     "html",        limit: 65535
    t.string   "subject",     limit: 255
  end

  create_table "resolver_notes", force: :cascade do |t|
    t.string   "key",        limit: 255
    t.text     "text",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "sector_translations", force: :cascade do |t|
    t.integer  "sector_id",  limit: 4
    t.string   "locale",     limit: 255,   null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "faqs_info",  limit: 65535
    t.text     "help_info",  limit: 65535
    t.string   "heading",    limit: 255
    t.text     "summary",    limit: 65535
  end

  add_index "sector_translations", ["locale"], name: "index_sector_translations_on_locale", using: :btree
  add_index "sector_translations", ["sector_id"], name: "index_sector_translations_on_sector_id", using: :btree

  create_table "sectors", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "description",       limit: 255
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.boolean  "visible",           limit: 1,   default: true
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size",    limit: 4
    t.datetime "logo_updated_at"
    t.integer  "rank",              limit: 4
    t.string   "slug",              limit: 255
  end

  add_index "sectors", ["slug"], name: "index_sectors_on_slug", unique: true, using: :btree

  create_table "seo_meta", force: :cascade do |t|
    t.integer  "seo_meta_id",      limit: 4
    t.string   "seo_meta_type",    limit: 255
    t.string   "browser_title",    limit: 255
    t.text     "meta_description", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seo_meta", ["id"], name: "index_seo_meta_on_id", using: :btree
  add_index "seo_meta", ["seo_meta_id", "seo_meta_type"], name: "id_type_index_on_seo_meta", using: :btree

  create_table "service_issue_types", force: :cascade do |t|
    t.integer  "service_id",               limit: 4
    t.integer  "issue_type_id",            limit: 4
    t.integer  "submission_flow_id",       limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.text     "rights",                   limit: 65535
    t.string   "standard_response_header", limit: 255
    t.text     "standard_response_body",   limit: 65535
  end

  create_table "service_level_escalation_counts", force: :cascade do |t|
    t.integer  "service_level_id", limit: 4
    t.integer  "level",            limit: 4
    t.integer  "issue_id",         limit: 4
    t.integer  "feeling_0_count",  limit: 4, default: 0
    t.integer  "feeling_1_count",  limit: 4, default: 0
    t.integer  "feeling_2_count",  limit: 4, default: 0
    t.integer  "feeling_3_count",  limit: 4, default: 0
    t.integer  "feeling_4_count",  limit: 4, default: 0
    t.integer  "feeling_5_count",  limit: 4, default: 0
    t.integer  "feeling_6_count",  limit: 4, default: 0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "service_level_escalation_counts", ["issue_id"], name: "index_service_level_escalation_counts_on_issue_id", using: :btree
  add_index "service_level_escalation_counts", ["service_level_id"], name: "index_service_level_escalation_counts_on_service_level_id", using: :btree

  create_table "service_level_routes", force: :cascade do |t|
    t.integer  "contact_id",             limit: 4
    t.integer  "owner_id",               limit: 4
    t.string   "owner_type",             limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "company_id",             limit: 4
    t.integer  "emotion",                limit: 4
    t.float    "escalation_probability", limit: 24
  end

  add_index "service_level_routes", ["company_id"], name: "index_service_level_routes_on_company_id", using: :btree
  add_index "service_level_routes", ["contact_id"], name: "index_service_level_routes_on_contact_id", using: :btree
  add_index "service_level_routes", ["owner_type", "owner_id"], name: "index_service_level_routes_on_owner_type_and_owner_id", using: :btree

  create_table "service_levels", force: :cascade do |t|
    t.integer  "service_id",              limit: 4
    t.integer  "level",                   limit: 4
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.integer  "min_duration",            limit: 4
    t.integer  "max_duration",            limit: 4
    t.string   "name",                    limit: 255
    t.string   "email",                   limit: 255
    t.string   "phone",                   limit: 255
    t.string   "address1",                limit: 255
    t.string   "address2",                limit: 255
    t.string   "address3",                limit: 255
    t.string   "postcode",                limit: 255
    t.boolean  "send_case_file",          limit: 1,   default: false
    t.integer  "regulator_id",            limit: 4
    t.string   "job_title",               limit: 255
    t.string   "full_name",               limit: 255
    t.string   "nudge_reminder_cc_email", limit: 255
    t.string   "city",                    limit: 255
    t.string   "county",                  limit: 255
  end

  add_index "service_levels", ["service_id", "level"], name: "index_service_levels_on_service_id_and_level", using: :btree

  create_table "service_type_email_templates", force: :cascade do |t|
    t.integer "template_id",     limit: 4
    t.integer "service_type_id", limit: 4
    t.string  "subject",         limit: 255
    t.integer "feeling",         limit: 4,   default: 0
  end

  add_index "service_type_email_templates", ["template_id", "service_type_id"], name: "serv_typ_email_tmpl_ids_index", using: :btree

  create_table "service_type_translations", force: :cascade do |t|
    t.integer  "service_type_id", limit: 4
    t.string   "locale",          limit: 255,   null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.text     "summary",         limit: 65535
  end

  add_index "service_type_translations", ["locale"], name: "index_service_type_translations_on_locale", using: :btree
  add_index "service_type_translations", ["service_type_id"], name: "index_service_type_translations_on_service_type_id", using: :btree

  create_table "service_types", force: :cascade do |t|
    t.string   "name",                         limit: 255
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.string   "account_label",                limit: 255
    t.string   "slug",                         limit: 255
    t.boolean  "visible",                      limit: 1,     default: true
    t.string   "description",                  limit: 255
    t.string   "logo_file_name",               limit: 255
    t.string   "logo_content_type",            limit: 255
    t.integer  "logo_file_size",               limit: 4
    t.datetime "logo_updated_at"
    t.integer  "rank",                         limit: 4
    t.integer  "auto_close_after_weeks",       limit: 4
    t.boolean  "address_required",             limit: 1,     default: false
    t.text     "rights_details",               limit: 65535
    t.text     "rights",                       limit: 65535
    t.boolean  "count_escalations",            limit: 1,     default: false
    t.boolean  "not_visible_on_mobile_app",    limit: 1,     default: false
    t.boolean  "hide_other_none_of_the_above", limit: 1,     default: false
  end

  add_index "service_types", ["slug"], name: "index_service_types_on_slug", unique: true, using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "name",                       limit: 255
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.integer  "service_type_id",            limit: 4
    t.integer  "company_id",                 limit: 4
    t.boolean  "visible",                    limit: 1,     default: true,  null: false
    t.string   "nudge_reminder_cc_email",    limit: 255
    t.string   "domains_whitelist",          limit: 255
    t.integer  "rank",                       limit: 4
    t.text     "auto_response_text",         limit: 65535
    t.string   "response_time",              limit: 255
    t.boolean  "vas_intelligent_email",      limit: 1,     default: false
    t.boolean  "vas_submitted_notification", limit: 1,     default: false
  end

  create_table "services_routes", id: false, force: :cascade do |t|
    t.integer "service_level_id",       limit: 4, null: false
    t.integer "service_level_route_id", limit: 4, null: false
  end

  add_index "services_routes", ["service_level_id", "service_level_route_id"], name: "by_level_route", using: :btree
  add_index "services_routes", ["service_level_route_id", "service_level_id"], name: "by_route_level", using: :btree

  create_table "settings", force: :cascade do |t|
    t.string   "var",        limit: 255,   null: false
    t.text     "value",      limit: 65535
    t.integer  "thing_id",   limit: 4
    t.string   "thing_type", limit: 30
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree

  create_table "social_sharings", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "link",                limit: 255
    t.integer  "company_id",          limit: 4
    t.string   "button_file_name",    limit: 255
    t.string   "button_content_type", limit: 255
    t.integer  "button_file_size",    limit: 4
    t.datetime "button_updated_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "social_sharings", ["company_id"], name: "index_social_sharings_on_company_id", using: :btree

  create_table "standard_complaints", force: :cascade do |t|
    t.text    "what_happened", limit: 65535
    t.date    "when_happened"
    t.text    "want",          limit: 65535
    t.integer "feeling",       limit: 4
    t.integer "issue_type_id", limit: 4
    t.integer "issue_id",      limit: 4
    t.string  "account",       limit: 255
  end

  create_table "submission_flows", force: :cascade do |t|
    t.string   "category",   limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "taggable_id",   limit: 4
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id",     limit: 4
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count", limit: 4,   default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "templates", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.text     "text_body",         limit: 65535
    t.string   "path",              limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.text     "html_body",         limit: 65535
    t.string   "template_renderer", limit: 50,    null: false
    t.integer  "email_template_id", limit: 4
  end

  create_table "testimonials", force: :cascade do |t|
    t.string   "author",     limit: 255
    t.text     "body",       limit: 65535
    t.string   "source",     limit: 255
    t.datetime "posted_at"
    t.integer  "company_id", limit: 4
    t.integer  "sector_id",  limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "testimonials", ["company_id"], name: "index_testimonials_on_company_id", using: :btree
  add_index "testimonials", ["sector_id"], name: "index_testimonials_on_sector_id", using: :btree

  create_table "tombstones", force: :cascade do |t|
    t.integer  "klass_id",   limit: 4
    t.string   "klass_name", limit: 255
    t.string   "sync_id",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tones", force: :cascade do |t|
    t.float    "anger_score",             limit: 24
    t.float    "disgust_score",           limit: 24
    t.float    "fear_score",              limit: 24
    t.float    "joy_score",               limit: 24
    t.float    "sadness_score",           limit: 24
    t.float    "analytical_score",        limit: 24
    t.float    "confident_score",         limit: 24
    t.float    "tentative_score",         limit: 24
    t.float    "openness_score",          limit: 24
    t.float    "conscientiousness_score", limit: 24
    t.float    "extraversion_score",      limit: 24
    t.float    "agreeableness_score",     limit: 24
    t.float    "neuroticism_score",       limit: 24
    t.integer  "email_id",                limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "tones", ["email_id"], name: "index_tones_on_email_id", using: :btree

  create_table "trustmark_complaints", force: :cascade do |t|
    t.string  "what_happened", limit: 255
    t.string  "want",          limit: 255
    t.date    "when_happened"
    t.date    "when_reported"
    t.boolean "ongoing",       limit: 1
    t.integer "issue_id",      limit: 4
    t.integer "issue_type_id", limit: 4
    t.integer "feeling",       limit: 4
  end

  create_table "unread_email_notifications", force: :cascade do |t|
    t.integer  "send_after_days", limit: 4
    t.string   "name",            limit: 255
    t.string   "description",     limit: 255
    t.string   "subject",         limit: 255
    t.text     "body_html",       limit: 65535
    t.text     "body_text",       limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "template_name",   limit: 255
  end

  create_table "unrecognised_email_addresses", force: :cascade do |t|
    t.string   "email",            limit: 255
    t.integer  "case_file_id",     limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "service_level_id", limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                         limit: 255
    t.string   "last_name",                          limit: 255
    t.string   "email",                              limit: 255
    t.string   "encrypted_password",                 limit: 255
    t.string   "reset_password_token",               limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      limit: 4,   default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",                 limit: 255
    t.string   "last_sign_in_ip",                    limit: 255
    t.string   "confirmation_token",                 limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",                  limit: 255
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.string   "invitation_token",                   limit: 64
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit",                   limit: 4
    t.integer  "invited_by_id",                      limit: 4
    t.string   "invited_by_type",                    limit: 255
    t.string   "provider",                           limit: 255
    t.string   "uid",                                limit: 255
    t.string   "subdomain",                          limit: 255
    t.datetime "invitation_created_at"
    t.integer  "company_id",                         limit: 4
    t.boolean  "receive_company_notifications",      limit: 1,   default: false
    t.string   "title",                              limit: 255
    t.date     "date_of_birth"
    t.boolean  "newsletter_signup",                  limit: 1,   default: false
    t.boolean  "receive_failed_email_notifications", limit: 1,   default: false
    t.boolean  "test",                               limit: 1
    t.boolean  "verified",                           limit: 1,   default: false, null: false
    t.string   "verification_token",                 limit: 255
    t.datetime "verification_sent_date"
    t.boolean  "mse_newsletter",                     limit: 1
    t.boolean  "reminded",                           limit: 1,   default: false
    t.boolean  "admin",                              limit: 1,   default: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["verification_token"], name: "index_users_on_verification_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  limit: 191,        null: false
    t.integer  "item_id",    limit: 4,          null: false
    t.string   "event",      limit: 255,        null: false
    t.string   "whodunnit",  limit: 255
    t.text     "object",     limit: 4294967295
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "contacts", "companies"
  add_foreign_key "explanations", "case_files"
  add_foreign_key "features", "emails"
  add_foreign_key "long_tail_seos", "companies"
  add_foreign_key "regulator_escalations", "case_files"
  add_foreign_key "service_level_routes", "companies"
  add_foreign_key "service_level_routes", "contacts"
  add_foreign_key "social_sharings", "companies"
  add_foreign_key "tones", "emails"
end
