#!/usr/bin/env python

import sys
import numpy as np
import matplotlib.pyplot as plt
import seaborn

for arg in sys.argv[1:]:
    npy = np.load(arg)
    print(str(npy.shape))
    plt.plot(npy.T)
    plt.grid(1)
    plt.show()
