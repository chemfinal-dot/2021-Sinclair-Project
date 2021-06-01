import picos
import numpy as np
import graph_generate as ggen

# Returns the Lovasz theta function value for a given graph.
def LovaszTheta(graph):
    n = len(graph)
    edges, _ = ggen.edges(graph)
    # A nxn matrix.
    Y = picos.SymmetricVariable("Y", (n, n))
    J = np.ones((n,n))
    # Setting up the problem for picos.
    P = picos.Problem()
    # Defining objective, namely maximize the sum of all elements in Y.
    P.objective = "max", J | Y
    constr_sdp = P.add_constraint(Y >> 0)
    constr_tr = P.add_constraint(picos.trace(Y) == 1)
    for x in edges:
        _ = P.add_constraint(Y[x[0], x[1]] == 0)
    opt = P.solve(solver="cvxopt")                     # Optional: Solver choice
    return np.sum(Y.value)

# Returns the Lovasz theta function value for a given graph.
def LovaszTheta_alt1(graph):
    n = len(graph)
    _, edge_complement = ggen.edges(graph)
    # A nxn matrix.
    Y = picos.SymmetricVariable("Y", (n, n))
    t = picos.RealVariable("t")
    # Setting up the problem for picos.
    P = picos.Problem()
    # Defining objective, namely maximize the sum of all elements in Y.
    P.objective = "min", t
    constr_sdp = P.add_constraint(Y >> 0)
    for x in edge_complement:
        _ = P.add_constraint(Y[x[0], x[1]] == -1)
    for i in range(n):
        _ = P.add_constraint(Y[i,i] == t - 1)
    opt = P.solve(solver="cvxopt")                     # Optional: Solver choice
    return t.value