require 'rails_helper'
# RSpec.describe TodoItem, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
# end

describe TodoItem do
  it { should belong_to(:todo_list) }
end