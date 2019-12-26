feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark App' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')

    expect(page).to have_link('Test Bookmark', href: "http://www.testbookmark.com")
  end

  scenario 'The bookmark must be valid' do
    visit('/bookmarks/new')
    fill_in('url', with: 'not a valid bookmark')
    click_button('Submit')
  
    expect(page).not_to have_content "not a valid bookmark"
    expect(page).to have_content "Must submit valid URL"
  end
end
