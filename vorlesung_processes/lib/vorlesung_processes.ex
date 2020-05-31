defmodule VorlesungProcesses do
  @moduledoc """
  Documentation for VorlesungProcesses.
  """

  @doc """
  Hello world.

  ## Examples

      iex> VorlesungProcesses.hello()
      :world

  """

  def loop(msg, n) when n <= 1 do
    IO.puts msg
  end

  def loop(msg, n) do
    IO.puts msg
    IO.puts Process.alive?(self())
    loop(msg, n-1)
  end 

end

   # spawn ohne PID
  spawn fn -> IO.puts("Hallo World") end

  # spawn mit PID
  pid = spawn fn -> IO.puts("Hallo World") end
  
  # spawn mit loop
  pid2 = spawn fn -> VorlesungProcesses.loop("Hello World", 10) end

# send and receive 
send self(), {:ok, "You've got Mail"}
async (receive do
  {:ok, msg} -> msg
  {:error, msg} -> msg
after
  0 -> "No new Mail"
end
send self(), {:ok, "You've got Spam"}

# Spawning a dieing process
spawn fn -> raise "Crash and burn"

# Spawning a dieing process that kills our shell
spawn_link fn -> raise "Crash and burn the whole thing" 

# 
%{1 => "a", 2 => "b", 3 => "c", 4 => "d", 5 =>"e", }
Enum.map(map, fn {x,y} ->  Task.async(fn -> IO.puts "#{x} #{y}" end) end)|> Enum.each(fn x -> Task.await(x) end)




