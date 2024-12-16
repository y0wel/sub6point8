require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new }

  it_behaves_like 'model with concerns',
                  parents: ApplicationRecord,
                  mixins:  [
                    Devise::Models::DatabaseAuthenticatable,
                    Devise::Models::Confirmable,
                    Devise::Models::Timeoutable,
                    Devise::Models::Recoverable,
                    Devise::Models::Registerable,
                    Devise::Models::Rememberable,
                    Devise::Models::Lockable
                  ]
end
