import sys
import json
from util import *




def get_config(filename):
    f = open(filename)
    config = json.load(f)
    f.close()

    return config


def view_config(config):
    print(config)


def generate_network(filename):

    config = get_config(filename)
    view_config(config)

    f = open(filename.replace(".json", ".sv"), "w")

    output = print_preamble(config['input_size'], config['layers'][-1]['neurons'])
    f.write(output)

    output = print_parameters(config)
    f.write(output)

    output = print_connect(config)
    f.write(output)

    for l, layer in enumerate(config['layers']):
        for n, neuron in enumerate(layer['weights']):
            output = print_weights(neuron, int(config['weight_length']), l, n)
            f.write(output)


    output = print_layer(config)
    f.write(output)
    
    f.close()





if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("please specify file")
    else:
        generate_network(sys.argv[1])

