defmodule HelloWorld do
  def hello() do
    IO.puts("Hello")
    world()
  end
  
  def world() do
    IO.puts("World")
  end
end