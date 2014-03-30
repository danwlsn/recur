require 'spec_helper'

describe Goal do
	before { @goal = Goal.new(goal: "Foobar")}

	subject { @goal }

	it { should respond_to(:goal) }
	it { should respond_to(:complete) }

	it {should be_valid}

	describe "should be automaticly set completed to flase" do
		its(:complete){ should_not be_true}
	end

	describe "when goal no present" do
		before { @goal.goal = " " }
		it { should_not be_valid }
	end
end
