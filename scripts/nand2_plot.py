import numpy as np
import matplotlib.pyplot as plt

nfins = [1,2,4,8,10,14]

plt.figure()

for nfin in nfins:
    filename = f"data/raw/nand2/nand2-{nfin}.dat"
    data = np.loadtxt(filename)
    
    vin = data[:,2]
    vout = data[:,1]
    plt.plot(vin,vout, label = f"NFIN= {nfin}")
    
plt.xlabel("vin (V)")
plt.ylabel("vout")
plt.title("transfer char.")
plt.grid(True)
plt.savefig("plots/device/nand2/nand2.png",dpi=3000)
plt.show()