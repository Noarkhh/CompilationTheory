defmodule Recursive do
  def fib(n) do
    case n do
      0 -> 1
      1 -> 1
      2 -> 1
      n -> fib(n - 1) + fib(n - 2)
    end
  end
  
  def factorial(n, p) do
    case n do
      0 -> 1
      n -> n * factorial(n - 1, p)
    end
  end
end