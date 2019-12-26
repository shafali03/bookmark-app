feature 'Add and view comments' do
    scenario 'comment is added to a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')

      visit '/bookmarks'
      first('.bookmark').click_button 'Add Comment'

      expect(current_path).to eq "/bookmarks/#{bookmark.id}/comments/new"

      fill_in 'comment', with: 'This is a second comment'
      click_button 'Submit'

      expect(current_path).to eq '/bookmarks'
    end
  end
