module ram64x8_tb;

reg        ck;
reg        wen;
reg  [5:0] addr;
reg  [7:0] din;
wire [7:0] dout;

integer    i;

ram64x8 dut
(
    .ck  (ck  ),
    .wen (wen ),
    .din (din ),
    .addr(addr),
    .dout(dout)
);

initial begin
    ck = 1'b0;
    forever #5 ck = ~ck;
end

initial begin
    // initialization
        wen  = 1'b0;

    // start writing into memory
    #13 wen  = 1'b1;

        addr = 6'd0;  din = 8'd2;
    #10 addr = 6'd1;  din = 8'd3;
    #10 addr = 6'd2;  din = 8'd5;
    #10 addr = 6'd3;  din = 8'd7;

    #10 addr = 6'd16; din = 8'd11;
    #10 addr = 6'd17; din = 8'd13;
    #10 addr = 6'd18; din = 8'd17;
    #10 addr = 6'd19; din = 8'd19;

    #10 wen  = 1'b0;
    // end of memory writing

    #100;
    // read the whole memory
        addr = 6'd0;
    for(i = 0; i < 64; i = i + 1) begin
        #10;
        addr = addr + 6'd1;
    end
    $stop;
end

endmodule
