require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('bookmark_app_test')
else
  DatabaseConnection.setup('bookmark_app')
end