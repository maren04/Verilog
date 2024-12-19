`include "d_flip_flop.v"

module N_bit_register #
(
    parameter N = 16 // N bits
) (
    input wire clk,
    input wire en, // enable
    input wire [N-1:0]a,
    output reg [N-1:0]y
);
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1)
            always @(posedge clk) begin
                if (en) begin
                    y <= a;
                end
        end
    endgenerate
    
endmodule