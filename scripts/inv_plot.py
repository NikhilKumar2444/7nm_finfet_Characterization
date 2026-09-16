import glob
import re
import os
import numpy as np
import matplotlib.pyplot as plt
from pathlib import Path

# --------------------------------------------------
# Find all nfin*.dat files
# --------------------------------------------------

files = glob.glob(r"data\raw\inv\nfin*.dat")

# Extract NFIN number from filename
def get_nfin(filename):
    match = re.search(r"nfin(\d+)", os.path.basename(filename))
    return int(match.group(1)) if match else 0


# Sort numerically: nfin1, nfin2, nfin4, nfin8...
files.sort(key=get_nfin)


# --------------------------------------------------
# Read ngspice raw data file
# --------------------------------------------------

def read_ngspice_dat(filename):

    with open(filename, "r") as f:
        lines = f.readlines()

    # Find "Values:"
    start = None

    for i, line in enumerate(lines):
        if line.strip() == "Values:":
            start = i + 1
            break

    if start is None:
        raise ValueError(f"Could not find Values: in {filename}")

    time = []
    vin = []
    vout = []

    i = start

    while i < len(lines):

        # Skip blank lines
        if not lines[i].strip():
            i += 1
            continue

        # First line:
        # 0    time
        parts = lines[i].split()

        if len(parts) < 2:
            i += 1
            continue

        t = float(parts[1])

        # Second line = Vin
        vin_value = float(lines[i + 1].strip())

        # Third line = Vout
        vout_value = float(lines[i + 2].strip())

        time.append(t)
        vin.append(vin_value)
        vout.append(vout_value)

        # Move to next point
        i += 3

    return np.array(time), np.array(vin), np.array(vout)


# --------------------------------------------------
# Plot all NFIN values
# --------------------------------------------------

plt.figure(figsize=(10, 6))

for filename in files:

    time, vin, vout = read_ngspice_dat(filename)

    nfin = get_nfin(filename)

    # Convert seconds -> nanoseconds
    time_ns = time * 1e9

    plt.plot(
        time_ns,
        vout,
        label=f"NFIN = {nfin}"
    )


# --------------------------------------------------
# Plot formatting
# --------------------------------------------------

plt.xlabel("Time (ns)")
plt.ylabel("Vout (V)")
plt.title("ASAP7 CMOS Inverter - NFIN Comparison")

plt.grid(True)
plt.legend()

plt.tight_layout()

# Save figure
plt.savefig("plots/device/inv/nfin_comparison.png", dpi=300)

# Display
plt.show()