import numpy as np

data = np.genfromtxt('Exp1_Plot_1.csv', delimiter=',', skip_header=2)

time    = data[:, 0]
tdrybul = data[:, 1]
tair    = data[:, 2]

print(f"Time: {time[:5]}")
print("Min Tair value: %f K or %f C" % ( min(tair), min(tair)-273.15))
itemindex = np.where(tair == min(tair))
print("Index", itemindex, "Time:", time[itemindex], "s, Tair:", tair[itemindex], "K")
