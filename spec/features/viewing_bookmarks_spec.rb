feature 'Viewing bookmarks' do
  feature 'visiting home page' do
  scenario 'a user can see bookmarks' do
  visit '/'

  expect(page).to have_content 'Bookmark App'
  end
end

eature 'viewing bookmarks' do
  scenario 'bookmark are visible' do
      Bookmark.create(url: "http://www.makersacademy.com")
      Bookmark.create(url: "http://www.twitter.com")
      Bookmark.create(url: "http://www.google.com")


      visit('/bookmarks')


      expect(page).to have_content "http://www.makersacademy.com"
      expect(page).to have_content "http://www.twitter.com"
      expect(page).to have_content "http://www.google.com"
    end
  end
end