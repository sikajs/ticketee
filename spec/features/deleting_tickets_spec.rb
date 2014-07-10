require 'spec_helper'

feature "Deleting Tickets" do
  let!(:project) { FactoryGirl.create(:project) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:ticket) {
    ticket = FactoryGirl.create(:ticket, project: project, user: user) }

  before do
    define_permission!(user, "view", project)
    sign_in_as!(user)

    visit '/'
    click_link project.name
    click_link ticket.title
  end

  scenario "Deleting a ticket" do
    click_link "Delete Ticket"
    expect(page).to have_content "Ticket has been deleted."
    expect(page.current_url).to eq(project_url(project))

    #visit '/'
    #click_link project.name

    #expect(page).to_not have_content ticket.title
  end
end
