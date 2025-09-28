defmodule ShortestPath do
  @infinity :infinity

  def shortest_path(graph, startVertex) do
    # Initialiseer afstanden: 0 voor start, :infinity voor de rest
    distances = Map.new(Map.keys(graph), fn node ->
      {node, (if node == start, do: 0, else: @infinity)}
    end)
   # Aanmaken queue
    queue = [{0, start}]
    dijkstra(graph, distances, queue)
  end

  graph = %{
  a: [b: 5, c: 2],
  b: [d: 4],
  c: [e: 7],
  d: [f: 1],
  e: [f: 3],
  f: []
}

end
