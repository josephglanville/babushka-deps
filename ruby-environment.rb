dep('ruby environment', :global_ruby_versions){
  requires [
    'rvm with multiple rubies',
    'required.rubies_installed'.with(global_ruby_versions),
    'bundler.global_gem'.with(global_ruby_versions),
    'rake.global_gem'.with(global_ruby_versions),
    'rails.global_gem'.with(global_ruby_versions),
    'therubyracer.global_gem'.with(global_ruby_versions),
    'nokogiri.global_gem'.with(global_ruby_versions),
    'gherkin.global_gem'.with(global_ruby_versions),
    'json.global_gem'.with(global_ruby_versions),
    'pg.global_gem'.with(global_ruby_versions),
    'mysql2.global_gem'.with(global_ruby_versions)
  ]
}

dep('required.rubies_installed', :ruby_versions) {
  rubies *ruby_versions.to_s.split(',').map(&:chomp)
}

dep('bundler.global_gem', :ruby_versions) {
  rubies *(ruby_versions.to_s.split(',').map(&:chomp) - ['rbx', 'rbx-2.0.0pre'])
  versions '1.1.rc.7'
}

dep('rake.global_gem', :ruby_versions) {
  rubies *ruby_versions.to_s.split(',').map(&:chomp)
  versions '0.8.7', '0.9.2'
}

dep('rails.global_gem', :ruby_versions) {
  rubies *(ruby_versions.to_s.split(',').map(&:chomp) - ['rbx', 'rbx-2.0.0pre'])
  versions '2.1.2', '2.2.3', '2.3.14', '3.0.0', '3.0.1', '3.0.2', '3.0.3', '3.0.4', '3.0.5', '3.0.6', '3.0.7', '3.0.8', '3.0.9', '3.0.10', '3.1.0', '3.1.1', '3.1.2'
}

dep('therubyracer.global_gem', :ruby_versions) {
  rubies *('1.9.2, 1.9.3'.to_s.split(',').map(&:chomp))
  versions '0.8.2', '0.9.3', '0.9.4', '0.9.5', '0.9.6', '0.9.7', '0.9.8'
}

dep('nokogiri.global_gem', :ruby_versions) {
  rubies *('1.8.7, 1.9.2, 1.9.3'.to_s.split(',').map(&:chomp))
  versions '1.5.0'
}

dep('json.global_gem', :ruby_versions) {
  rubies *('1.8.7, 1.9.2, 1.9.3'.to_s.split(',').map(&:chomp))
  versions '1.5.4'
}

dep('gherkin.global_gem', :ruby_versions) {
  rubies *('1.8.7, 1.9.2, 1.9.3'.to_s.split(',').map(&:chomp))
  versions '2.5.1'
}

dep('mysql2.global_gem', :ruby_versions) {
  rubies *('1.8.7, 1.9.2, 1.9.3'.to_s.split(',').map(&:chomp))
  versions '0.3.11', '0.3.10', '0.3.9', '0.3.8'
}

dep('pg.global_gem', :ruby_versions) {
  rubies *('1.8.7, 1.9.2, 1.9.3'.to_s.split(',').map(&:chomp))
  versions '0.12.0', '0.11.0', '0.10.1'
}

