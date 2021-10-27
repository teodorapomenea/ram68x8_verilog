module dec_1_4
(
    input            en,
    input      [1:0] in,
    output reg [3:0] y
);

always @(*) begin
    if (en) begin
        case (in)
             2'd0: y = 4'b0001;
             2'd1: y = 4'b0010;
             2'd2: y = 4'b0100;
             2'd3: y = 4'b1000;
        endcase
    end
    else begin
                   y = 4'b0000;
    end
end

endmodule
