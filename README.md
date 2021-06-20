# Prerequisites
These scripts use a few packages:

1. [PICOS](https://picos-api.gitlab.io/picos/index.html)
2. [SciPy](https://www.scipy.org)

To use these packages, I use [Anaconda](https://www.anaconda.com) as a package manager with Python 3.8.10.

# MATLAB Scripts
In MATLAB, every graph G is defined using its adjacency matrix A, which is an n x n matrix with 1 in the i,j entry if (i,j) ∈ E and 0 if not.
## LovTheta1.m
This method solves the same SDP as given in `LovaszTheta()`, which is described in the Overleaf document. 
* Input: Adjacency matrix G, an n x n matrix corresponding to a graph.
* Output: The Lovasz Theta of the graph corresponding to the adjacency matrix.

To solve the problem it uses CVX, which is an optimization package that can be installed [here](http://cvxr.com/cvx/download/). There is an option on CVX called `quiet`, which suppresses output on solvetime and optimality. I leave the option on by default, but it can be always removed.

Note: Currently, there are no other alternative definitions which are given in the Overleaf document which are programmed into MATLAB. If anyone is interested in converting more programs into MATLAB code, you are more than welcome to it.

## QuantumTheta.m
This method solves an SDP almost identical to the one described in the Araiza-Sinclair paper, in Remark 8.6. The tensor product in the second condition is flipped.
* Input: Adjacency matrix G, an n x n matrix corresponding to a graph.
* Output: The Quantum Theta of the graph corresponding to the adjacency matrix. It appears to be the case that this is just the same thing as the regular Lovasz Theta.

## QuantumThetaT.m
This method solves an SDP given in Remark 8.6, namely the first one. The tensor product in the second condition is flipped.
* Input: Adjacency matrix G, an n x n matrix corresponding to a graph.
* Output: The Quantum Theta of the graph corresponding to the adjacency matrix. It appears to be the case that this is just the same thing as the regular Lovasz Theta.

## choi_id.m
This function simply returns the Choi matrix of the identity map for a given n.
* Input: A positive integer n, assumed to correspond to the size of the n x n identity matrix.
* Output: The Choi matrix of the identity mapping, the definition of which can be found on this [wiki article](https://en.wikipedia.org/wiki/Choi%27s_theorem_on_completely_positive_maps).

## circulant.m
This function returns the circulant graph of size n, and additional parameter k.
* Input: A positive integer n, corresponding to the vertex size |V|=n, and another positive integer k. The value k corresponds to the number of neighbors each vertex is connected to on each side. For a vertex j, it is connected to j-k to j-1 as well as j+1 to j+k.
* Output: The adjacency matrix of the circulant graph C(n,k). Note that if k > n/2, then it just returns the complete graph K(n), where each vertex is connected to every other vertex.

## cycle.m
This function returns the cyclic graph C(n), of a size n.
* Input: A positive integer n, corresponding to the vertex size |V|=n.
* Output: The cyclic graph of size n, where vertex j is connected to j-1 and j+1. 

This function can be seen as the special case of the circulant graph where k=1, making it redundant. 

## rand_graph.m
This function returns a randomly generated graph of size n, with each probability given as 0 < p < 1.
* Input: A positive integer n, corresponding to the vertex size |V|=n, and a fixed probability p, which corresponds to the probability of assigning any given edge.
* Output: A randomly generated graph, where each edge has a probability p of being assigned.

## theta_cycle.m
This function returns the actual value of the Lovasz Theta for a cyclic graph C(n).
* Input: A positive integer n, corresponding to the vertex size |V|=n.
* Output: If n is even, the function returns n/2, which is the Lovasz Theta for even cyclic graphs. If n is odd, it returns the value (n cos(pi/n))/(1 + n cos(pi/n)), which is given above.

## tr_id.m
This function returns the partial trace of a matrix M.
* Input: A square matrix M of size n^2 x n^2. The program will check to see if this is satisfied, and if not it will throw an exception.
* Output: The partial trace of the matrix, which is given as the sum along the diagonal subblocks of the matrix M. If M_ij are all matrices of size n x n, then the function returns the sum of M_ii for i=1,...,n.


# Python scripts/methods
## graph_funs
Every definition of the Theta function that is used can be found [here on Overleaf](https://www.overleaf.com/read/shwygrhhpwfy).

If other graph related functions appear in our work, they should also be defined here.
## graph_generate
The script `graph_generate.py` contains all methods related to generating and handling graphs. The way I have defined graphs is as a dictionary containing vertices 0 through n-1 as keys, with n=|V|. Each vertex key is given an array that contains a list of vertices which it is adjacent to. Consequently, if key i contains j in the array, key j must contain i. 

The method `complete_graph` completes the graph in that exact way above for a given dictionary, where if (i,j) is a key:value pair, then (j,i) is also one. 

For an example, here is the definition of a 5-cycle:
```python 
cycle_5 = {
    0 : [4,1],
    1 : [0,2],
    2 : [1,3],
    3 : [2,4],
    4 : [3,0]
}
```
Order does not matter for the elements of the array, only what elements are in it. 

The method `cycle` returns the cycle graph for a given size n. The n-cycle graph C_n is defined such that vertex k is adjacent to k+1 and k-1 (if k=0, k-1≡ n-1). As a reference, the value of ϑ(C_n) has been proven to be equal to the formula

![eqn3](https://media.discordapp.net/attachments/830987949671841804/849284912548806676/eqnC_n.png)

The method `dense_graph` returns a randomly generated graph of a given size n, which assigns edges in the following way: For every valid unique pair of vertices (i,j) (i≠j and (j,i) is not considered), the method assigns a 50% chance of placing the edge in the dictionary. It iterates through every vertex j+1 to n-1 for key j=0, . . . , n-2, which ensures each edge only has one chance to get assigned. This probability can also be changed if we desire.

The method `edges` for a given valid graph returns an array containing every edge pair (i,j) ∈ E as a subarray. Note that if (i,j) ∈ E, (j,i) ∈ E and `edges` is meant to return both in the array.
