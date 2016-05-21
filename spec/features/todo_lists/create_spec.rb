require 'rails_helper'
describe 'Creating todo lists' do
  def create_todo_list(options = {})
    options[:title] ||= 'My Todo list'
    options[:description] ||= 'This is my todo list.'

    visit '/todo_lists'
    click_link 'New Todo list'
    expect(page).to have_content('New Todo List')

    fill_in 'Title', with: options[:title]
    fill_in 'Description', with: options[:description]
    click_button 'Create Todo list'
  end

  it 'Redirects to the todo list index page on success' do
    create_todo_list
    expect(page).to have_content('My Todo list')
  end

  it 'Displays an error when the todo list has no title' do
    expect(TodoList.count).to eq(0)

    create_todo_list title: '', description: "This is what I'm doing today"

    expect(page).to have_content('error')
    expect(TodoList.count).to eq(0)

    visit '/todo_lists'
    expect(page).to_not have_content("This is what I'm doing today.")
  end

  it 'Displays an error when the todo list has a title less than 3 characters' do
    expect(TodoList.count).to eq(0)

    create_todo_list title: 'Hi', description: "This is what I'm doing today"

    expect(page).to have_content('error')
    expect(TodoList.count).to eq(0)

    visit 'todo_lists'
    expect(page).to_not have_content("This is what I'm doing today.")
  end

  it 'Displays an error when the todo list has no description' do
    expect(TodoList.count).to eq(0)

    create_todo_list title: 'Grocery list', description: ''

    expect(page).to have_content('error')
    expect(TodoList.count).to eq(0)

    visit 'todo_lists'
    expect(page).to_not have_content('Grocery list')
  end

  it 'Displays an error when the todo list description has less the 5 characters' do
    expect(TodoList.count).to eq(0)

    create_todo_list title: 'Grocery list', description: 'Food'

    expect(page).to have_content('error')
    expect(TodoList.count).to eq(0)

    visit 'todo_lists'
    expect(page).to_not have_content('Grocery list')
  end

end
