feature 'Deleting a url' do
  scenario 'A user can delete a bookmark' do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
      visit('/bookmarks')
      expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')

      first('.bookmark').click_button 'Delete'
      expect(page).not_to have_link('Makers', href: 'http://www.makersacademy.com')
  end
end