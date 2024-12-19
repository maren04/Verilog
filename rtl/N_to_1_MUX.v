module moduleName #(
    parameter N = 16,
    parameter EN_WIDTH = $clog2(N)
) (
    input wire [N-1:0]a,
    input wire [EN_WIDTH:0]sel,
    output wire y
);
    assign y = a[sel];
endmodule