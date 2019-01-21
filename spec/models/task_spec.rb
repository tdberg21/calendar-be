require 'rails_helper'

RSpec.describe Task, type: :model do
  
  it { should belong_to(:event) }
  
  it { should validate_presence_of(:name) }
end
