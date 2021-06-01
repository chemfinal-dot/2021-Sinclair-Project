import cvxpy as cp
import numpy as np
from random import gauss
import random
import scipy as sp


# In the methods I have for generating graphs, it only identifies [i,j] as an edge,
# not [j,i], which are the same. This function completes the graph, in that sense.
def complete_graph(graph):
    for x in range(len(graph)):
        for i in range(len(graph)):
            if i in graph[x] and x not in graph[i]:
                graph[i].append(x)
    return graph
def cycle(N):
    graph = dict(zip([i for i in range(N)], [[] for i in range(N)]))
    for x in range(N):
        graph[x].append(x+1,x-1)
    return graph
print(cycle(5))
# This function generates a graph where each possible edge is given a 50% chance of being assigned.
def generate_dense_graph(N):
    graph = dict(zip([i for i in range(N)], [[] for i in range(N)]))
    for x in range(N):
        for i in range(x+1,N):
            if random.random() < 0.5:
                graph[x].append(i)
    #print(graph)
    return complete_graph(graph)

# This function generates a graph where you give a certain max number of edges to assign,
# and then the function randomly assigns them.
def generate_sparse_graph(N, edge_number):
    graph = dict(zip([i for i in range(N)], [[] for i in range(N)]))
    count = 0
    while 1:
        x = random.randint(0, N)
        y = random.randint(0, N)
        if y not in graph[x]:
            graph[x].append(y)
            count += 1
        if count >= edge_number:
            break
    return complete_graph(graph)
n=12
#help = generate_dense_graph(8)


graph1 = { 0 : [2],
          1 : [2, 4],
          2 : [0, 1, 3, 4],
          3 : [2],
          4 : [2, 1, 5],
          5 : [4]
        }


#n=len(help)
edges =[]

def generate_edges(graph):
    edges = []
    for node in graph:
        for neighbour in graph[node]:
            edges.append([node, neighbour])
    return edges

#generate_edges(help)

def generate_char_matrix():
    A = np.zeros((n,n))
    for i in range(len(edges)):
        A[edges[i][0],edges[i][1]] = 1
    return A
A = generate_char_matrix()

def make_rand_vector(N=n):
    vec = np.array([gauss(0, 1) for i in range(N)])
    mag = sum(x**2 for x in vec) ** .5
    return np.array([x/mag for x in vec])

#print(make_rand_vector())

'''
X = cp.Variable((n,n), symmetric=True)
alpha = cp.Variable(1)
constraints = [X >> 0]
constraints += [X[i,i] == 1 for i in range(n)]

character = cp.multiply(A,X)
obj_GW = cp.Maximize((A.sum()-cp.sum(character))/4)
obj_k_col = cp.Minimize(alpha)

# for k-coloring
constraints += [character <= alpha*A]

# This time we are finding a k-coloring on G
prob = cp.Problem(obj_k_col,
                  constraints)
prob.solve()

print(prob.status)

# Print result.
print("The optimal value is", prob.value)
#print("The X matrix is", X.value)

U, _, _ = sp.linalg.ldl(X.value)
#print(U)
#print(U[0,:])
#print(U[:,0])

p = make_rand_vector()
t = 0.2
def I_set(t):
    set =[]
    for i in range(n):
        if(np.dot(p,U[:,i])>= t):
            set.append(i)
    return set
I_0 = I_set(t)

I=[]
for i in range(n):
    if (i in I_0) and (not i+1 in I_0) and (not i-1 in I_0):
        I.append(i)

print(I_0)
print(I)

S = []
for i in range(n):
    if(np.dot(p,U[:,i]) >= 0):
        S.append(i)
print(S)
'''