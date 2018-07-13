require 'rails_helper'

describe Goal do
  #validations
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:private) }
  it { should validate_presence_of(:complete) }

  #associations
  it { should belong_to(:user) }
end