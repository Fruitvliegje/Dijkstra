defmodule ShortestPath do
  @infinity :infinity
  # Start Dijkstra
  def shortest_path(graph, startVertex) do
    # Initialiseer afstanden: 0 voor start vertex, :infinity voor de rest
    distances =
      Map.new(Map.keys(graph), fn node ->
        {node, if(node == startVertex, do: 0, else: @infinity)}
      end)

    queue = [{0, startVertex}]
    dijkstra(graph, distances, queue)
  end

  # Base case: queue is leeg als pattern niet matcht? Recursieve functie
  defp dijkstra(_graph, distances, []), do: distances

  # Recursieve functie
  defp dijkstra(graph, distances, queue) do
    # check de afstand van elke node, pakt de min retourneert de gehele tuple
    {dist, node} = Enum.min_by(queue, fn {d, _} -> d end)

    # maakt een nieuwe lijst zonder de gevonden node
    queue = List.delete(queue, {dist, node})

    # Geef een lijst terug met buren van de gevonden node. Geen buren? retourneert lege lijst.
    neighbors = Map.get(graph, node, [])

    # Loop over alle buren van de huidige node
    # Reduce van lijst naar een 1 waarde (accum)
    {distances, queue} =
      Enum.reduce(neighbors, {distances, queue}, fn {neighbor, cost}, {distances, queue} ->
        # Bereken de afstand van de startnode naar deze buur via de huidige node
        new_dist = dist + cost

        #  de huidige geregistreerde afstand naar deze buur
        current_dist = distances[neighbor]
        # Als de buur nog niet eerder is bezocht of nieuwe afstand is kleiner
        if current_dist == @infinity or new_dist < current_dist do
          # Update de afstand en voeg de buur toe aan de queue
          {Map.put(distances, neighbor, new_dist), [{new_dist, neighbor} | queue]}
        else
          # anders update niks
          {distances, queue}
        end
      end)

    dijkstra(graph, distances, queue)
  end
end

# een map met atoms (labels) als key
# Kan als een directional graph opgezet worden


# graph = %{
#   a: [b: 5, c: 2],
#   b: [d: 4],
#   c: [e: 7],
#   d: [f: 1],
#   e: [f: 3],
#   f: []
# }

graph = %{
  n1: [n10: 8, n3: 13, n9: 12],
  n2: [n10: 16, n14: 16, n19: 11, n9: 12],
  n3: [n10: 17, n11: 17, n16: 18],
  n4: [n15: 16],
  n5: [n12: 12, n19: 14],
  n6: [n15: 12],
  n7: [n12: 1, n19: 19],
  n8: [n13: 4, n2: 1],
  n9: [n18: 16, n3: 20],
  n10: [n14: 18, n2: 11, n4: 13, n6: 15],
  n11: [n15: 5, n20: 16, n3: 10, n7: 19],
  n12: [n16: 11],
  n13: [n17: 20, n9: 16],
  n14: [n16: 19],
  n15: [n2: 2],
  n16: [n3: 16, n5: 19],
  n17: [n1: 17, n7: 12],
  n18: [n9: 1],
  n19: [n3: 20],
  n20: [n1: 1, n2: 11, n4: 19]
}




startVertex = :n2;
IO.puts("De startknoop is: #{startVertex}")

ShortestPath.shortest_path(graph, startVertex)
#AI GEN: puur voor een mooiere opmaak in de console om het resultaat beter weer te geven.

|> IO.inspect(
     label: "Kortste Pad naar elke bereikbare knoop",
     width: 1,
     limit: :infinity
   )
