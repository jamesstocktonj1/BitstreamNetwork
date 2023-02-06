import numpy as np
import matplotlib.pyplot as plt
import sys


def load_file(filename):
    data = []

    with open(filename, "r") as f:
        for x in f:
            data.append(float(x.strip()))

    return data


def plot_data(filename):
    plt.figure()

    data = load_file(filename)
    data = data[2:]

    x = np.arange(len(data)) / len(data)
    # y = 1 / (1 + np.exp((-4 * x) + 2))
    y = np.exp(-4) / (np.exp(-4) + np.exp(-8 * x))
    # y = np.exp(-4 * x)

    plt.plot(x, data)
    plt.plot(x, y)

    file_name = filename.split("/")[1]      # remove data folder path
    file_name = file_name.split(".")[0]     # remove file extension
    plt.savefig("images/{}.png".format(file_name))
    # plt.show()

if __name__ == "__main__":

    if len(sys.argv) < 2:
        print("please specify file")
    else:
        plot_data(sys.argv[1])