# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :rspec do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^recipes/(.+)\.rb$}) { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

guard 'kitchen' do
  watch(%r{^\.kitchen\.yml$})
  watch(%r{test/.+})
  watch(%r{^recipes/(.+)\.rb$})
  watch(%r{^attributes/(.+)\.rb$})
  watch(%r{^files/(.+)})
  watch(%r{^templates/(.+)})
  watch(%r{^providers/(.+)\.rb})
  watch(%r{^resources/(.+)\.rb})
end
