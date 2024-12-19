`include "full_adder.v"

module N_bit_adder #
(
    parameter N = 16 // N bits
) (
    input wire [N-1:0]a,
    input wire [N-1:0]b,
    input wire Cin,
    output wire [N-1:0]y,
    output wire Cout
);
    // Internal carry wires
    wire [N-1:0] carry;
    assign y[0] = a[0] ^ b[0] ^ Cin;
    assign carry[0] = (a[0] & b[0]) | ((a[0] ^ b[0]) & Cin);


    // Generate block for the remaining 7 full adders
    genvar i;
    generate
        for (i = 1; i < N; i = i + 1) begin : adder_block
    assign y[i] = a[i] ^ b[i] ^ carry[i-1];
    assign carry[i] = (a[i] & b[i]) | ((a[i] ^ b[i]) & carry[i-1]);
        end
    endgenerate

    // Assign final carry-out
    assign Cout = carry[N-1];

    
endmodule