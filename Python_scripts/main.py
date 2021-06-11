import numpy as np
import time
from Python_scripts import graph_generate as ggen, graph_funs as gfuns
import matplotlib.pyplot as plt

sigma = [np.array([[1, 0], [0, 1]]), np.array([[0, 1], [1, 0]]), np.array([[0, -1j], [1j, 0]]),
         np.array([[1, 0], [0, -1]])]




'''n = 11
print("n =",n)
correct_value = (n * np.cos(np.pi/n))/(1 + np.cos(np.pi/n))
print("correct Lov. theta of n-cycle:", correct_value)
start_time1 = time.time()
theta_n_1 = gfuns.LovaszTheta(ggen.cycle(n))
record_time1 = (time.time() - start_time1)
print("--- %s seconds ---" % record_time1)
start_time2 = time.time()
theta_n_2 = gfuns.LovaszTheta_alt1(ggen.cycle(n))
record_time2 = (time.time() - start_time2)
print("--- %s seconds ---" % record_time2)
print("calculated Lov. theta of n-cycle:", theta_n_1)
print("Relative error 1:", (theta_n_1 - correct_value)/correct_value)
print("Relative error 2:", (theta_n_2 - correct_value)/correct_value)
#print("--- %s seconds ---" % (time.time() - start_time))
print()
print()'''
'''
n = 15
ratios1 = np.array([])
ratios2 = np.array([])
list = []
for N in range(10):
    n = 2*N + 3
    correct_value = (n * np.cos(np.pi / n)) / (1 + np.cos(np.pi / n))
    list.append(n)
    print(n)
    graph = ggen.cycle(n)
    start_time1 = time.time()
    Lv_Theta_1 = gfuns.LovaszTheta(graph)
    record_time1 = (time.time() - start_time1)
    #print(Lv_Theta_1/correct_value)
    #print("--- %s seconds ---" % record_time1)
    start_time2 = time.time()
    Lv_Theta_2 = gfuns.LovaszTheta_alt1(graph)
    record_time2 = (time.time() - start_time2)
    #print("--- %s seconds ---" % record_time2)
    print("Ratio of calculated Lov. theta values:", Lv_Theta_1/Lv_Theta_2)
    #print("Value of Lov. theta:", Lv_Theta_1)
    ratios1 = np.append(ratios1, record_time1)
    ratios2 = np.append(ratios2, record_time2)

plt.plot(list, ratios1)
plt.plot(list, ratios1, list, ratios2)
plt.title('Solve Time vs Cycle Size')
plt.xlabel('Cycle Size')
plt.ylabel('Solve Time')
plt.xticks(list)
plt.show()'''
K = 15
list_values = np.zeros((K,5))
list_time = np.zeros((K,5))
list = []
for N in range(K):
    n = 2*N + 3
    print(n)
    list.append(n)
    graph = ggen.dense_graph(n)
    #correct_value = (n * np.cos(np.pi/n))/(1 + np.cos(np.pi/n))
    #print("actual value: ", correct_value)
    start_time1 = time.time()
    list_values[N,0] = (gfuns.LovaszTheta(graph) )
    list_time[N,0] = (time.time() - start_time1)
    #print("Lovasz Theta: ", gfuns.LovaszTheta(graph), (time.time() - start_time1))
    # start_time1 = time.time()
    # list_values[N, 1] = (gfuns.LovaszTheta_alt1(graph) )
    # list_time[N, 1] = (time.time() - start_time1)
    #print("alternative1: ", gfuns.LovaszTheta_alt1(graph), (time.time() - start_time1))
    start_time1 = time.time()
    list_values[N, 2] = (gfuns.LovaszTheta_alt2(graph) )
    list_time[N, 2] = (time.time() - start_time1)
    #print("alternative2: ", gfuns.LovaszTheta_alt2(graph), (time.time() - start_time1))
    start_time1 = time.time()
    list_values[N, 3] = (gfuns.LovaszTheta_alt3(graph) )
    list_time[N, 3] = (time.time() - start_time1)
    #print("alternative3: ", gfuns.LovaszTheta_alt3(graph), (time.time() - start_time1))
    start_time1 = time.time()
    list_values[N, 4] = (gfuns.LovaszTheta_alt4(graph) )
    list_time[N, 4] = (time.time() - start_time1)
    #print("alternative4: ", gfuns.LovaszTheta_alt4(graph), (time.time() - start_time1))


for i in range(5):
    plt.plot(list, list_time[:, i], label = "Type %s " % i)

plt.title('Solve Time vs Cycle Size')
plt.xlabel('Cycle Size')
plt.ylabel('Solve Time')
plt.xticks(list)
plt.legend()
print(np.mean(list_values, axis=0))

plt.show()

