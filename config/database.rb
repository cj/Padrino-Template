ActiveRecord::Base.configurations[:"#{PADRINO_ENV}"] = {
  :adapter   => 'mysql',
  :encoding  => 'utf8',
  :reconnect => true,
  :database  => PADRINO_ENV == 'test' ? "test_" + ENV['DB_DATABASE'] : ENV['DB_DATABASE'],
  :pool      => 5,
  :username  => ENV['DB_USERNAME'],
  :password  => ENV['DB_PASSWORD'],
}

# Setup our logger
ActiveRecord::Base.logger = logger

# Include Active Record class name as root for JSON serialized output.
ActiveRecord::Base.include_root_in_json = true

# Store the full class name (including module namespace) in STI type column.
ActiveRecord::Base.store_full_sti_class = true

# Use ISO 8601 format for JSON serialized times and dates.
ActiveSupport.use_standard_json_time_format = true

# Don't escape HTML entities in JSON, leave that for the #json_escape helper.
# if you're including raw json in an HTML page.
ActiveSupport.escape_html_entities_in_json = false

# Now we can estabilish connection with our db
ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations[Padrino.env])
