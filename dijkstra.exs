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
graph = %{
  a: [b: 5, c: 2],
  b: [d: 4],
  c: [e: 7],
  d: [f: 1],
  e: [f: 3],
  f: []
}

IO.inspect(ShortestPath.shortest_path(graph, :a))
