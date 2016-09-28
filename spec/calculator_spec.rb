require_relative 'spec_helper'
require_relative '../calculator'

describe Calculator do

  describe ".new" do
    it "creates a Calculator object" do
      calculator = Calculator.new("TD Calculator")
      expect(calculator).to_not eq nil
    end
  end

  describe "#result" do
    it "has a result of 1" do
      calculator = Calculator.new(2)
      expect(calculator.result).to eq 2
    end
  end

  describe "#test_non_string" do
    it "should have error" do
      calculator = Calculator.new("hello")
      expect(calculator.error).to eq "You need to input a valid number"
    end
  end

  describe "#reset" do
    it "has reset the value to 0" do
      calculator = Calculator.new(1)
      calculator.reset
      expect(calculator.result).to eq 0
    end
  end

  describe "#add" do
    it "has to add up the numbers 9" do
      calculator = Calculator.new(1)
      calculator.add(8)
      expect(calculator.result).to eq 9
    end
  end

  describe "#subtract" do
    it "has to subtract the numbers -7" do
      calculator = Calculator.new(1)
      calculator.subtract(8)
      expect(calculator.result).to eq -7
    end
  end

  describe "#multiply" do
    it "has to multiply the numbers 9" do
      calculator = Calculator.new(1)
      calculator.multiply(9)
      expect(calculator.result).to eq 9
    end
  end

  describe "#divide" do
    it "has to divide the numbers 5" do
      calculator = Calculator.new(10)
      calculator.divide(2)
      expect(calculator.result).to eq 5
    end
  end

  describe "#divide with a string" do
    it "has to divide the numbers 5" do
      calculator = Calculator.new(10)
      calculator.divide("pear")
      expect(calculator.error).to eq "You need to input a valid number"
    end
  end

  describe "#chain" do
    it "has to chain up the methods 9" do
      calculator = Calculator.new(10)
      calculator.divide(2).subtract(5).add(9)
      expect(calculator.result).to eq 9
    end
  end

  describe "#operation" do
    it "surgical operation to equal 20" do
      calculator = Calculator.new(10)
      calculator.operation('add',10)
      expect(calculator.result).to eq 20
    end
  end

  describe "#undo" do
    it "undo the surgical operation to equal 10" do
      calculator = Calculator.new(10)
      calculator.operation('add',10)
      calculator.operation('add',13)
      calculator.undo
      expect(calculator.result).to eq 20
    end
  end

  describe "#redo" do
    it "redo surgical operation to equal 20" do
      calculator = Calculator.new(10)
      calculator.operation('add',10)
      calculator.undo
      calculator.redo
      expect(calculator.result).to eq 20
    end
  end

  describe "#undo_undo_redo_add_undo_redo" do
    it "redo surgical operation to equal 20" do
      calculator = Calculator.new(10)
      calculator.operation('add',10)
      calculator.operation('multiply',2)
      calculator.undo
      calculator.undo
      calculator.redo
      calculator.operation('add',10)
      calculator.undo
      calculator.undo
      calculator.redo
      expect(calculator.result).to eq 20
    end
  end

  describe "#undo_redo_undo_undo" do
    it "redo surgical operation to equal 20" do
      calculator = Calculator.new(10)
      calculator.operation('add',10)
      calculator.operation('multiply',2)
      calculator.undo
      calculator.redo
      calculator.undo
      calculator.undo
      expect(calculator.result).to eq 10
    end
  end

  describe "#reset_undo" do
    it "redo surgical operation to equal 20" do
      calculator = Calculator.new(10)
      calculator.operation('add',10)
      calculator.undo
      calculator.reset
      calculator.operation('add',30)
      calculator.undo
      calculator.undo
      expect(calculator.result).to eq 0
    end
  end

end
