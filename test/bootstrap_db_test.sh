export RAILS_ENV=test

bundle exec rake db:migrate
bundle exec rake sunspot:solr:stop RAILS_ENV=test
bundle exec rake sunspot:solr:start RAILS_ENV=test

