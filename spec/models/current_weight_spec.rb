require 'spec_helper'

describe CurrentWeight do
	before { @weight = CurrentWeight.new(weight: 200) }

	subject { @weight }

	it { should respond_to(:weight) }

	it { should be_valid}

	describe "when weight is not present" do
		before { @weight.weight = "" }
		it { should_not be_valid }
	end

	describe "when weight is not a number" do
		before { @weight.weight = "foobar" }
		it { should_not be_valid }
	end
end
