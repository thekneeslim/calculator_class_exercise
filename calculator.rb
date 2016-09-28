# You are required to build a Calculator class (calculator.rb) and
# a test suite for it (calculator_spec.rb). Specifically, an
# instance of the Calculator class will store a single read_only
# instance variable that represents the result of any methods
# called on it. Your tasks will be to add various mathematical
# functions to the class through a TDD process. As the writer of
# tests your intention is to create tests that force a robust
# implementation. As the writer of the code to pass the test,
# you want to implement the bare minimum to pass the test.

# Tasks
# *Initialize: my_calculator = Calculator.new(1) would assign 1 to
# the be the starting result of the new my_calculator instance.
# *Results: my_calculator.result would return the curent result -
# tt should be readonly. my_calculator.reset(x) would reset the
# calculator to x.
# *Addition: my_calculator.add(x) would add x to the internal result
# value, if x can be a valid number
# *Subtraction: my_calculator.subtract(x) would subtract x from the
# internal result value, if x can be a valid number
# *Multiply: my_calculator.multiply(x) would multiply x by the
# internal result value and save the new value, if x can be a valid
# number
# *Divide: my_calculator.divide(x) would divide the internal result
# value by x and save the new value, if x can be a valid number
# *Chain: my_calculator.add(x).subtract(y) all methods should be c
# hainable in any order
# *Operation: my_calculator.operation('add', x) would apply the
# addition operation with the value of x. It should support all
# operations
# *Undo: my_calculator.undo(x) should undo the previous operation,
# restoring the result value, if x can be a valid number
# *Redo: my_calculator.redo(x) should redo the previously undone
# operation, restoring the result value. A new action should remove
# the ability to perform redos.


class Calculator
  attr_reader :error

  def initialize(number)
    if(number.class == Fixnum)
      @result = number
      @stored_math = []
      @stored_math2 = []
      @undoing = false
    else
      @error = "You need to input a valid number"
    end
  end

  def result
    @result
  end

  def reset
    @stored_math = []
    @stored_math2 = []
    @result = 0
  end

  def add(apple)
    @stored_math.push(["add",apple]) unless @undoing
    if(apple.class == Fixnum)
      @result += apple
    else
      @error = "You need to input a valid number"
    end
    self
  end

  def subtract(apple)
    @stored_math.push(["subtract",apple]) unless @undoing
    if(apple.class == Fixnum)
      @result -= apple
    else
      @error = "You need to input a valid number"
    end
    self
  end

  def multiply(apple)
    @stored_math.push(["multiply",apple]) unless @undoing
    if(apple.class == Fixnum)
      @result *= apple
    else
      @error = "You need to input a valid number"
    end
    self
  end

  def divide(apple)
    @stored_math.push(["divide",apple]) unless @undoing
    if(apple.class == Fixnum)
      @result /= apple
    else
      @error = "You need to input a valid number"
    end
    self
  end

  def operation(apple, number)
    if apple == "add"
      add(number)
    elsif apple == "subtract"
      subtract(number)
    elsif apple == "multiply"
      multiply(number)
    elsif apple == "divide"
      divide(number)
    else
      puts "Trying to be funny?"
    end
    self
  end

  def undo
    @undoing = true
    y = @stored_math.delete_at(@stored_math.length-1)
    @stored_math2.push(y)
    unless y.nil?
      if y[0] == "add"
        subtract(y[1])
      elsif y[0] == "subtract"
        add(y[1])
      elsif y[0] == "multiply"
        divide(y[1])
      elsif y[0] == "divide"
        multiply(y[1])
      end
    end
    @undoing = false
    self
  end

  def redo
    z = @stored_math2.delete_at(@stored_math2.length-1)
    if z[0] == "add"
      add(z[1])
    elsif z[0] == "subtract"
      subtract(z[1])
    elsif z[0] == "multiply"
      multiply(z[1])
    elsif z[0] == "divide"
      divide(z[1])
    end
    self
  end

end
