require 'spec_helper'

describe Option do
	before { @option = Option.new(weight: "lbs") }

	subject { @option }

	it { should respond_to(:weight) }

	it { should be_valid }

	describe "when weight is nothing" do
		before { @option.weight = " " }
		it { should_not be_valid }
	end
end
