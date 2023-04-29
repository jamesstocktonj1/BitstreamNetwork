import numpy as np
from sklearn.datasets import load_iris
import sys




def load_file(filename):
    data = np.zeros((150, 3))

    with open(filename, "r") as f:
        for j, x in enumerate(f):
            line = x.strip().split(",")
            for i, y in enumerate(line):
                data[j][i] = float(y)

    return data

def loss_stats(data_hat, y):

    testCorrect = 0
    for rxy in range(y.shape[0]):
        if data_hat[rxy].argmax() == y[rxy]:
            testCorrect += 1

    print("Network Stats:")
    print("Training Accuracy: {:.4f}%".format((testCorrect / y.shape[0]) * 100))


def compare(filename):
    data_hat = load_file(filename)

    iris_data = load_iris()
    y = iris_data.target

    loss_stats(data_hat, y)


if __name__ == "__main__":

    if len(sys.argv) < 2:
        print("please specivy file")
    else:
        compare(sys.argv[1])