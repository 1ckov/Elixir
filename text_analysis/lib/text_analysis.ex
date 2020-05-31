defmodule TextAnalysis do

  require Logger
  def analyze do
    read_in()
    |> format
    |> count

  end

  defp read_in do
    {:ok, body} = File.read("data/kafka.txt")
    body
  end

  defp count(words) do
      IO.puts("*****************************")
      Enum.uniq(words)
      |> Enum.map(fn(x) -> {x, length(Enum.filter(words, fn(y) -> y == x end))} end)
      #|>Logger.info()
      |> Enum.sort(fn {_, x}, {_, y} -> x > y  end)
      #|> IO.inspect
      |> Enum.map(fn {word, count} -> IO.puts("| #{word} : #{count} |") end)
      #|> Enum.map(fn (x) -> (Enum.map(x,fn ({key, value}) -> IO.puts("#{key} #{value}") end )) end)
      IO.puts("*****************************")

      
      list = Enum.reduce(words, fn (x, acc) -> x <> acc end)
      charachters = String.split(list, "")
      Enum.uniq(charachters)
      |> Enum.map(fn (x) -> {to_string(x), length(Enum.filter(charachters, fn(y) -> y == x end))} end)
      |> Enum.filter(fn {char, count} -> char != "" end)
      |> Enum.sort(fn ({_, x}, {_, y}) -> x > y  end)
      |> Enum.map(fn ({char, count}) -> IO.puts("#{char}: #{count}") end)

      #|>Enum.map(fn x ->)

  end

  defp format(body) do
    body
    |> String.replace(~r/\n|\r|\?|\!|\.|\,|\:|\;|\-|\"|\–/, "")
    |> String.downcase()
    |> String.split()
    #|> Logger.info()
  end


end
