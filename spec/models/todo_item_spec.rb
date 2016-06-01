require 'rails_helper'
# RSpec.describe TodoItem, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
# end

describe TodoItem do
  it { should belong_to(:todo_list) }

describe "#completed?" do
  let(:todo_item) { TodoItem.create(content: 'Hello') }

  it 'is false when completed_is blank' do
    todo_item.completed_at = nil
    expect(todo_item.completed?).to be_falsey
    end

  it 'returns true when completed_at is not empyty' do
    todo_item.completed_at = Time.now
    expect(todo_item.completed?).to be_truthy
   end
  end
end
