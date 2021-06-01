import picos
import numpy as np
import time
import scipy as sp
import graph_funs as gfuns
import graph_generate as ggen
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

n = 15
ratios1 = np.array([])
ratios2 = np.array([])
list = []
for N in range(10):
    n = 2*N + 3
    list.append(n)
    print(n)
    graph = ggen.cycle(n)
    start_time1 = time.time()
    Lv_Theta_1 = gfuns.LovaszTheta(graph)
    record_time1 = (time.time() - start_time1)
    #print("--- %s seconds ---" % record_time1)
    start_time2 = time.time()
    Lv_Theta_2 = gfuns.LovaszTheta_alt1(graph)
    record_time2 = (time.time() - start_time2)
    #print("--- %s seconds ---" % record_time2)
    #print("Ratio of calculated Lov. theta values:", Lv_Theta_1/Lv_Theta_2)
    #print("Value of Lov. theta:", Lv_Theta_1)
    ratios1 = np.append(ratios1, record_time1)
    ratios2 = np.append(ratios2, record_time2)

plt.plot(list, ratios1)
plt.plot(list, ratios1, list, ratios2)
plt.title('Solve Time vs Cycle Size')
plt.xlabel('Cycle Size')
plt.ylabel('Solve Time')
plt.xticks(list)
plt.show()