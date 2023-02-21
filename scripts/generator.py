import numpy as np
from SimpleSeparation import data

def bitstream_generator_exact(p, N):
    n_bits = int(np.round(p * N))
    bs = np.concatenate((
        np.ones((n_bits)),
        np.zeros((N - n_bits))
    ))
    return np.random.permutation(bs)


def generate_matrix(N, values):

    X = len(values)

    print("logic [{}:0] values [0:{}] = {{".format(N-1, X))

    for i in range(X):
        bs = bitstream_generator_exact(values[i], N)

        print("\t{}'b".format(N), end="")
        for b in bs:
            print(int(b), end="")

        if i != (X - 1):
            print(",\n", end="")
        else:
            print("\n", end="")

    print("};")


def generate_bitstream(N, value):
    bs = bitstream_generator_exact(value, N)

    print("logic [{}:0] value = {}'b".format(N-1, N-1), end="")

    for b in bs:
        print(int(b), end="")

    print(";")


if __name__ == "__main__":
    # x = np.arange(0, 1, 1/250)

    # generate_matrix(1024, x)
    generate_bitstream(1092, np.exp(-4))