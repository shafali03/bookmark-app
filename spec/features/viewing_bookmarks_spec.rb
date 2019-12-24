feature "viewing bookmarks" do
  scenario "bookmark are visible" do
      Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
      Bookmark.create(url: "http://www.twitter.com", title: "Twitter")
      Bookmark.create(url: "http://www.google.com", title: "Google")


      visit('/bookmarks')


      expect(page).to have_link("Makers",  href: "http://www.makersacademy.com")
      expect(page).to have_link("Twitter", href: "http://www.twitter.com")
      expect(page).to have_link("Google", href: "http://www.google.com")
    end
  end
