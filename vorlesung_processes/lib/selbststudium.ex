#Aufgabe 1 Implementieren sie Einen KV-Store
defmodule KV do
 #Starts the KV store Linked together with our main Process
  def start_link do
    Task.start_link (fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
    {:get, key, caller} -> 
      send caller, Map.get(map, key)
      loop(map)
    {:put, key, value} ->
      loop(Map.put(map,key,value))
    end
  end
  
end

# Aufgabe 2 Sortieren Sie Eine wortliste 

