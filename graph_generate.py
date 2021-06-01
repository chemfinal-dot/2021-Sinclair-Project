import random

# Returns the edge pairs of a graph.
# Input: graph - dictionary
# Note that if [i,j] is an edge, then [j,i] is also considered an edge.
def edges(graph):
    edge = []
    edge_complement = []
    for node in graph:
        for neighbour in graph[node]:
            edge.append([node, neighbour])
    for i in range(len(graph)):
        for j in range(len(graph)):
            if [i,j] not in edge and i != j:
                edge_complement.append([i,j])
    return edge, edge_complement

# Checks every edge, and if [i,j] is an edge, then [j,i] is marked as an edge as well.
# Input: graph - dictionary
def complete_graph(graph):
    for x in range(len(graph)):
        for i in range(len(graph)):
            if i in graph[x] and x not in graph[i]:
                graph[i].append(x)
    return graph

# Returns the N-cycle graph, where N is the number of vertices.
# Input: N - integer > 0
def cycle(N):
    graph = dict(zip([i for i in range(N)], [[] for i in range(N)]))
    for x in range(N):
        graph[x].append((x+1) % N)
        graph[x].append((x-1) % N)
    return graph

# This function generates a graph where each possible edge is given a 50% chance of being assigned.
# Input: N - integer > 0
def dense_graph(N):
    graph = dict(zip([i for i in range(N)], [[] for i in range(N)]))
    for x in range(N):
        for i in range(x+1,N):
            if random.random() < 0.5:
                graph[x].append(i)
    return complete_graph(graph)