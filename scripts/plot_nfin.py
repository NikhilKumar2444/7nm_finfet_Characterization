import numpy as np
import matplotlib.pyplot as plt

nfins = [1,2,4,8,10,14]

plt.figure()

for nfin in nfins:
    filename = f"data/raw/nfin/nfin_{nfin}.dat"
    data = np.loadtxt(filename)
    
    vgs = data[:,0]
    current = data[:,1]
    plt.plot(vgs,current*1e6, label = f"NFIN= {nfin}")
    
plt.xlabel("vgs (V)")
plt.ylabel("Drain Current (uA)")
plt.title("Bsim cmg nfet Id-Vgs for different Nfins")
plt.grid(True)
plt.savefig("plots/device/nfin/ngin_idvg.png",dpi=3000)
plt.show()