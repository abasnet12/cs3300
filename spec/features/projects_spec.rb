require 'rails_helper'

RSpec.feature "Projects", type: :feature do

  let(:user) {FactoryBot.create(:user)}

  def signInFields
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button "Log in"
  end

  context "Create new project" do
    before(:each) do
      visit new_project_path
      signInFields
      within(all("form")[1]) do
        fill_in "Title", with: "Test title"
      end
    end

    
  end

  context "Update project" do
    let(:project) { Project.create(title: "Test title", description: "Test content") }
    before(:each) do
      visit edit_project_path(project)
      signInFields
    end

   

   
  end

  context "Remove existing project" do
    let!(:project) { Project.create(title: "Test title", description: "Test content") }
    scenario "remove project" do
      visit projects_path
      project.destroy
      #expect(page).to have_content("Project was successfully destroyed")
      expect(Project.count).to eq(0)
    end
  end
end
