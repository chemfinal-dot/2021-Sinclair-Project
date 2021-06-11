# Prerequisites
These scripts use a few packages:

1. [PICOS](https://picos-api.gitlab.io/picos/index.html)
2. [SciPy](https://www.scipy.org)

To use these packages, I use [Anaconda](https://www.anaconda.com) as a package manager with Python 3.8.10.
# Description of scripts/methods
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
