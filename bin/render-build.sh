set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate
bundle exec rails db:seed
# DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rake db:migrate:reset