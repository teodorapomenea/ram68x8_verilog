module ram64x8
(
    input        ck,
    input        wen,
    input  [5:0] addr,
    input  [7:0] din,
    output [7:0] dout
);

wire [3:0] wen_i;
wire [7:0] dout_0;
wire [7:0] dout_1;
wire [7:0] dout_2;
wire [7:0] dout_3;

wire [1:0] addr_sel;
wire [3:0] addr_ram;

assign addr_sel = addr[5:4];
assign addr_ram = addr[3:0];

dec_1_4 dec
(
    .en   (wen       ),
    .in   (addr_sel  ),
    .y    (wen_i     )
);

ram16x8 ram_0
(
    .ck   (ck        ),
    .wen  (wen_i[0]  ),
    .addr (addr_ram  ),
    .din  (din       ),
    .dout (dout_0    )
);

ram16x8 ram_1
(
    .ck   (ck        ),
    .wen  (wen_i[1]  ),
    .addr (addr_ram  ),
    .din  (din       ),
    .dout (dout_1    )
);

ram16x8 ram_2
(
    .ck   (ck        ),
    .wen  (wen_i[2]  ),
    .addr (addr_ram  ),
    .din  (din       ),
    .dout (dout_2    )
);

ram16x8 ram_3
(
    .ck   (ck        ),
    .wen  (wen_i[3]  ),
    .addr (addr_ram  ),
    .din  (din       ),
    .dout (dout_3    )
);

mux_4_8 mux
(
    .sel  (addr_sel  ),
    .in0  (dout_0    ),
    .in1  (dout_1    ),
    .in2  (dout_2    ),
    .in3  (dout_3    ),
    .y    (dout      )
);

endmodule
