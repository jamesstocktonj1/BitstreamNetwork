import numpy as np




def bitstream_generator_exact(p, N):
    n_bits = int(np.round(p * N))
    bs = np.concatenate((
        np.ones((n_bits)),
        np.zeros((N - n_bits))
    ))
    return np.random.permutation(bs)

def print_bitstream(p, N):
    bs = bitstream_generator_exact(p, N)

    output_bitstream = "{}'b".format(N)

    for b in bs:
        output_bitstream += "{}".format(int(b))
    
    return output_bitstream



def print_weights(weights, N, layer_number, neuron_number):
    output = "// layer {}, neuron {}\n".format(layer_number, neuron_number)
    output += "logic [WEIGHT_LENGTH-1:0] w{}{} [0:{}] =  {{\n".format(layer_number, neuron_number, len(weights)-1)

    for i, w in enumerate(weights):
        bs = print_bitstream(w, N)
        output += "\t{}".format(bs)

        if i < (len(weights) - 1):
            output += ","

        output += "\t\t//weight: {}\n".format(w)
    
    output += "};"
    return output

def print_preamble(input_size, output_size):
    output = "module network #(INPUT_SIZE = {}, OUTPUT_SIZE = {})\n".format(input_size, output_size)
    output += "\t\t\t(output logic [OUTPUT_SIZE-1:0] network_output,\n"
    output += "\t\t\t input logic [INPUT_SIZE-1:0] network_input,\n"
    output += "\t\t\t input logic clk, n_rst);\n\n"

    return output


def print_postamble():
    return "endmodule"

def print_parameters(config):
    output = "parameter WEIGHT_LENGTH = {};\n".format(config['weight_length'])
    
    for i in range(len(config['layers']) - 1):
        output += "parameter "

    return output


def print_layer(config):
    return ""


def print_connect(weights):

    return ""