module top_nexys_a7(
    input  logic        clock,
    input  logic        reset,
    input  logic        bt_save,
    input  logic        bt_check,
    input  logic [15:0] SW,

    output logic [7:0] DDP,
    output logic [7:0] AN
);

    logic [3:0] unidade, dezena;
    logic [5:0] d1,d2,d3,d4,d5,d6,d7,d8;

    genius game(
        .clk(clock),
        .reset(reset),
        .bt_save(bt_save),
        .bt_check(bt_check),
        .sw(SW),
        .unidade(unidade),
        .dezena(dezena)
    );

    always_comb begin
        d1 = {1'b1, unidade, 1'b0};
        d2 = {1'b1, dezena , 1'b0};

        d3 = 6'b000000;
        d4 = 6'b000000;
        d5 = 6'b000000;
        d6 = 6'b000000;
        d7 = 6'b000000;
        d8 = 6'b000000;
    end

    dspl_drv_NexysA7 display(
        .clock(clock),
        .reset(reset),
        .d1(d1), .d2(d2), .d3(d3), .d4(d4),
        .d5(d5), .d6(d6), .d7(d7), .d8(d8),
        .an(AN),
        .dec_ddp(DDP)
    );

endmodule