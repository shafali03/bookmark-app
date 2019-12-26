require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'bookmark_app_test')

# Clear the bookmarks table
  connection.exec("TRUNCATE bookmarks, comments;")
end