import picos
import numpy as np
from Python_scripts import graph_generate as ggen


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

def LovaszTheta_alt2(graph):
    n = len(graph)
    _, edge_complement = ggen.edges(graph)
    # A nxn matrix.
    X = picos.SymmetricVariable("X", (n, n))
    t = picos.RealVariable("t")
    J = np.ones((n, n))
    # Setting up the problem for picos.
    P = picos.Problem()
    # Defining objective, namely maximize the sum of all elements in Y.
    P.objective = "min", t
    constr_sdp = P.add_constraint(X - J >> 0)
    for x in edge_complement:
        _ = P.add_constraint(X[x[0], x[1]] == 0)
    for i in range(n):
        _ = P.add_constraint(X[i,i] <= t)
    opt = P.solve(solver="cvxopt")                     # Optional: Solver choice
    return t.value

def LovaszTheta_alt3(graph):
    n = len(graph)
    _, edge_complement = ggen.edges(graph)
    # A nxn matrix.
    Y = picos.SymmetricVariable("Y", (n, n))
    t = picos.RealVariable("t")
    # Setting up the problem for picos.
    P = picos.Problem()
    # Defining objective, namely maximize the sum of all elements in Y.
    P.objective = "min", t
    I = np.identity(n)
    constr_sdp = P.add_constraint(Y << t*I)
    for x in edge_complement:
        _ = P.add_constraint(Y[x[0], x[1]] == 1)
    for i in range(n):
        _ = P.add_constraint(Y[i, i] == 1)
    opt = P.solve(solver="cvxopt")  # Optional: Solver choice
    return t.value

def LovaszTheta_alt4(graph):
    n = len(graph)
    _, edge_complement = ggen.edges(graph)
    # A nxn matrix.
    A = picos.SymmetricVariable("A", (n, n))
    #t = picos.RealVariable("t")
    # Setting up the problem for picos.
    P = picos.Problem()
    # Defining objective, namely maximize the sum of all elements in Y.
    t = picos.lambda_max(A)
    P.objective = "min", t
    #constr_sdp = P.add_constraint(A >> 0)
    for x in edge_complement:
        _ = P.add_constraint(A[x[0], x[1]] == 1)
    for i in range(n):
        _ = P.add_constraint(A[i,i] == 1)
    opt = P.solve(solver="cvxopt")                     # Optional: Solver choice
    return t.value

def IndexNumber(graph):
    n = len(graph)
    edge_set, edge_complement = ggen.edges(graph)
    # A nxn matrix.
    A = picos.ComplexVariable("A", (n, n))
    B = picos.ComplexVariable("B", (n, n))
    X = A @ B
    lam = picos.RealVariable("lambda")
    # Setting up the problem for picos.
    P = picos.Problem()
    # Defining objective, namely maximize the sum of all elements in Y.
    P.objective = "max", lam
    constr_sdp = P.add_constraint(X >> 0)
    constr_tr = P.add_constraint(picos.trace(A) * B == (1-lam) * np.identity(n))
    opt = P.solve(solver="cvxopt")  # Optional: Solver choice
    return lam.value