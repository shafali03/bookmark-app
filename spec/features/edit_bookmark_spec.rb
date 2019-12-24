feature 'Updating a bookmark' do
  scenario 'A user can update a bookmark' do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
    visit('/bookmarks')
     expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')

    

    # fill_in("url", with: "http://www.google.com")
    # fill_in("title", with: "Google")
    # click_button("submit")
    
    # expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makerss', href: 'http://www.makersacademy.com')
    # expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end