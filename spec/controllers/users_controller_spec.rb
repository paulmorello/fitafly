describe UsersController do

  describe "index" do

    subject do
      User.new(:username => 'John1', :name => 'John Doe', :email => 'john@gmail.com')
    end

    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
  end
end
