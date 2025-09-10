import numpy as np

data = np.genfromtxt('Exp2_Plot2.csv', delimiter=',', skip_header=2)

time    = data[:, 0]
tdrybul = data[:, 1]
tair    = data[:, 2]

minT_K = min(tair)

time_fan    = data[:, 3]
tdrybul_fan = data[:, 4]
tair_fan    = data[:, 5]

minT_K_fan = min(tair_fan)

print("Min Tair value: %f K or %f C" % ( minT_K, minT_K-273.15))
itemindex = np.where(tair == minT_K)
print("Index", itemindex, "Time:", time[itemindex], "s, Tair:", 
    tair[itemindex], "K")

print("\nMin Tair value with FAN: %f K or %f C" % ( minT_K_fan, minT_K_fan-273.15))
fanIndex = np.where(tair_fan == minT_K_fan)
print("Index", fanIndex, "Time:", time_fan[fanIndex], "s, Tair:", 
    tair_fan[fanIndex], "K")
