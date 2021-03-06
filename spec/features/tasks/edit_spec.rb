# frozen_string_literal: true

require 'rails_helper'

feature 'Editing a task' do

  let(:user) { create :user }
  let!(:task) { Task.create(name: 'Test my app', completed: false, user: user) }

  before(:each) do
    login_as user
  end

  scenario 'redirects to the tasks index page on success' do
    visit tasks_path
    click_on 'Edit'
    expect(page).to have_content('Editing task')

    fill_in 'Name', with: 'Test my app (updated)'
    click_button 'Save'

    expect(page).to have_content('Tasks')
    expect(page).to have_content('Test my app (updated)')
  end

  scenario 'displays an error when no name is provided' do
    visit edit_task_path(task)
    fill_in 'Name', with: ''
    click_button 'Save'

    expect(page).to have_content("Name can't be blank")
  end
end
