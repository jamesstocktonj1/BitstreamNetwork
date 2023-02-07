import numpy as np


def bitstream_generator_exact(p, N):
    n_bits = int(np.round(p * N))
    bs = np.concatenate((
        np.ones((n_bits)),
        np.zeros((N - n_bits))
    ))
    return np.random.permutation(bs)


def generate_bitstream(N, value):
    bs = bitstream_generator_exact(value, N)

    print("logic [{}:0] exp_value = {}'b".format(N-1, N-1), end="")

    for b in bs:
        print(int(b), end="")

    print(";")


if __name__ == "__main__":
    generate_bitstream(128, 0.6)