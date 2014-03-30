require 'spec_helper'

describe FitnessLog do
	before { @cardio = FitnessLog.new(activity: "Running", type: "cardio", time: 120, reps: 0, sets: 0, weight: 0) }

	before { @strength = FitnessLog.new(activity: "Bench Press", type: "strength", time: 0, reps: 3, sets: 6, weight: 120) }

	subject { @cardio }

	it { should respond_to(:activity) }
	it { should respond_to(:type) }
	it { should respond_to(:time) }
	it { should respond_to(:reps) }
	it { should respond_to(:sets) }
	it { should respond_to(:weight) }

	it { should be_valid}

	subject { @strength }

	it { should respond_to(:activity) }
	it { should respond_to(:type) }
	it { should respond_to(:time) }
	it { should respond_to(:reps) }
	it { should respond_to(:sets) }
	it { should respond_to(:weight) }

	it { should be_valid}

	describe "When activity is blank" do
		before { @strength.activity = " " }
		it {should_not be_valid }
	end

	describe "When type is blank" do
		before { @strength.type = " " }
		it {should_not be_valid }
	end

	describe "When time is blank" do
		before { @strength.time = " " }
		it {should_not be_valid }
	end

	describe "When time is not a number" do
		before { @strength.time = "foobar" }
		it {should_not be_valid }
	end

	describe "When reps is blank" do
		before { @strength.reps = " " }
		it {should_not be_valid }
	end

	describe "When reps is not a number" do
		before { @strength.reps = "foobar" }
		it {should_not be_valid }
	end

	describe "When sets is blank" do
		before { @strength.sets = " " }
		it {should_not be_valid }
	end

	describe "When sets is not a number" do
		before { @strength.sets = "foobar" }
		it {should_not be_valid }
	end

	describe "When weight is blank" do
		before { @strength.weight = " " }
		it {should_not be_valid }
	end

	describe "When weight is not a number" do
		before { @strength.weight = "foobar" }
		it {should_not be_valid }
	end

end
