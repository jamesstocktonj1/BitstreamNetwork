import numpy as np
import matplotlib.pyplot as plt
from matplotlib import cm
import sys
from scipy.ndimage import gaussian_filter


def load_file(filename):
    data = []

    with open(filename, "r") as f:
        for x in f:
            data.append(float(x.strip()))

    return data


def plot_data(filename, smooth):
    fig = plt.figure()
    fig1 = fig.add_subplot(projection='3d')

    data = load_file(filename)
    data = np.array(data)
    # data = data[2:]

    x = np.arange(0, 1, 1/50)
    y = np.arange(0, 1, 1/50)
    x_t, y_t = np.meshgrid(x, y)

    neuronPlane = data.reshape((50, 50))

    neuronSmooth = gaussian_filter(neuronPlane, sigma=2)

    if smooth:
        surf = fig1.plot_surface(x_t, y_t, neuronSmooth, cmap=cm.coolwarm, rstride=1, cstride=1, alpha=None, antialiased=True)
    else:
        surf = fig1.plot_surface(x_t, y_t, neuronPlane, cmap=cm.coolwarm, rstride=1, cstride=1, alpha=None, antialiased=True)

    fig.colorbar(surf)
    plt.show()


if __name__ == "__main__":

    if len(sys.argv) < 2:
        print("please specify file")
    else:
        plot_data(sys.argv[1], True)