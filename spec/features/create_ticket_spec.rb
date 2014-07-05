require 'spec_helper'

feature "Create Tickets" do
  before do
    project = FactoryGirl.create(:project)
    user = FactoryGirl.create(:user)

    visit '/'
    click_link project.name
    click_link("New Ticket")
    message = "You need to sign in or sign up before continuing."
    expect(page).to have_content(message)

    fill_in "Name", with: user.name
    fill_in "Password", with: user.password
    click_button "Sign in"

    click_link project.name
    click_link "New Ticket"
  end

  scenario "Creating a ticket" do
    fill_in "Title", with: "Not support i18n"
    fill_in "Description", with: "Only has English menu"
    click_button "Create Ticket"

    expect(page).to have_content("Ticket has been created.")
    within "#ticket #author" do
      expect(page).to have_content("Created by sample@example.com")
    end
  end

  scenario "Creating a ticket without valid attributes fails" do
    click_button "Create Ticket"

    expect(page).to have_content("Ticket has not been created.")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
  end

  scenario "Description must be longer than 10 characters" do
    fill_in "Title", with: "Not support i18n"
    fill_in "Description", with: "too sad"
    click_button "Create Ticket"

    expect(page).to have_content("Ticket has not been created.")
    expect(page).to have_content("Description is too short")
  end
end
