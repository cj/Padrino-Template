# A sample Guardfile
# More info at https://github.com/guard/guard#readme

# other available options
# :task (defaults to resque:work)
# :verbose
# :trace
# :queue (defaults to "*")
# :count (defaults to 1)


# guard 'resque', :environment => 'development', :task => 'resque:work resque:scheduler' do
# guard 'resque', :environment => 'test', :task => 'resque:work' do
#   watch(%r{^app/(.+)\.rb})
#   watch(%r{^lib/(.+)\.rb})
# end


guard 'spork', :cucumber_env => { 'RACK_ENV' => 'test' }, :rspec_env => { 'RACK_ENV' => 'test' } do
    watch(%r{^config/.+\.rb$})
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb')
  watch('test/test_helper.rb')
  watch(%r{^spec/support/.+\.rb$})
  # watch(%r{^app/assets/(.+)/.*\.(coffee)$})
end

guard 'rspec', :version => 2, :cli => "--tag focus --drb --colour --backtrace --format documentation", :all_on_start => false, :all_after_pass => false do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  # Rails example
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$})                           { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch('spec/spec_helper.rb')                        { "spec" }
  watch('config/routes.rb')                           { "spec/routing" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }
  # Capybara request specs
  watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| "spec/requests/#{m[1]}_spec.rb" }
end