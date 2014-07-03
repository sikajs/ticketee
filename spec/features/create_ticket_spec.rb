require 'spec_helper'

feature "Create Tickets" do
  before do
    FactoryGirl.create(:project, name: "findHome")
    
    visit '/'
    click_link("findHome")
    click_link("New Ticket")
  end
  
  scenario "Creating a ticket" do
    fill_in "Title", with: "Not support i18n"
    fill_in "Description", with: "Only has English menu"
    click_button "Create Ticket"
    
    expect(page).to have_content("Ticket has been created.")
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
