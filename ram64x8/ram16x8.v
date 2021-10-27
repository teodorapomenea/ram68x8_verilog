module ram16x8
(
    input        ck,
    input        wen,
    input  [3:0] addr,
    input  [7:0] din,
    output [7:0] dout
);

reg [7:0] mem [0:'hF]; // equivalent to reg [7:0] mem [0:15];

// synchronous write
always @(posedge ck) begin
    if(wen) begin
        mem[addr] <= din;
    end
end

// asynchronous read
assign dout = mem[addr];

endmodule
