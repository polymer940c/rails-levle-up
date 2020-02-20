require 'test_helper'

RSpec.describe Post, type: :model do
  context "NOT valid post" do
    subject { Post.new }
    it "fail validation with no subject" do
      expect(subject).to_not be_valid
      expect(subject.errors[:subject]).to eq ["can't be blank"]
    end
    it "fail validation with no body" do
      expect(subject).to_not be_valid
      expect(subject.errors[:body]).to eq ["can't be blank"]
    end
    it "fail validation with no body" do
      expect(subject).to_not be_valid
      expect(subject.errors[:body]).to eq ["can't be blank"]
    end
     it "does not save into Post" do
      expect{
        subject
      }.to change{Post.count}.by(0)
    end
  end
  context "Valid post" do
    subject { Post.create({subject: "test subject", body: "body body"}) }
    it "pass validation" do
      expect(subject).to be_valid
    end
    it "create new entery into database" do
      expect(subject).to eq (Post.last)
    end
    it "increase Post count by 1" do
      expect{
        subject
      }.to change{Post.count}.by(1)
    end
  end
end