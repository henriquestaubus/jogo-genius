`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2026 14:41:06
// Design Name: 
// Module Name: genius
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module genius(
    input  logic clk,
    input  logic reset,
    input  logic bt_save,
    input  logic bt_check,
    input  logic [15:0] sw,
    output logic [3:0] unidade,
    output logic [3:0] dezena
);

   logic [15:0] secret_code;
    logic [4:0]  score;
    integer i;

    always_ff @(posedge clk) begin
        if (reset) begin
            secret_code <= 16'b0;
            score       <= 5'b0;
        end
        else begin
         
            if (bt_save) begin
                secret_code <= sw;
            end
            
            if (bt_check) begin
                int count;
                count =0;

                for (i = 0; i < 16; i = i + 1) begin
                    if (sw[i] == secret_code[i])
                        count = count + 1;
                end

                score <= count;
            end
        end
    end

    always_comb begin
        unidade = score % 10;
        dezena  = score / 10;
    end

endmodule