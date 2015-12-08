require "spec_helper"
describe Subject do
  let(:subject) {FactoryGirl.create :subject}

  describe "validation" do
    before do
      subject.name = "a"*110
    end
    it {expect(subject).to_not be_valid}
  end

end
