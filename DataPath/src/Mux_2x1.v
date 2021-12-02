module Mux_2x1(
    input  [1:0]  selector,
    input  [31:0] in_0, in_1,
    output [31:0] data_out
);

    assign data_out = (selector) ? in_1 : in_0;

endmodule 