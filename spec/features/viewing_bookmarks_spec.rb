feature 'Viewing bookmarks' do
  scenario 'visiting index page' do
    visit('/')
    expect(page).to have_content "Bookmarks Manager"
  end

  scenario 'viewing bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    visit('/bookmarks')

    expect(page).to have_content "www.makersacademy.com"
    expect(page).to have_content "www.destroyallsoftware.com"
    expect(page).to have_content "www.google.com"
  end

end
