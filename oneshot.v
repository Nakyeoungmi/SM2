`timescale 1ns / 1ps
module oneshot(
  input clk, rst, btn,
  output reg trig
);

  reg btn_d;

  always @(posedge clk) begin
    if (!rst) begin
      btn_d <= 1'b0;
      trig  <= 1'b0;
    end 
    else begin
      btn_d <= btn;
      // 버튼이 0→1로 바뀌는 순간에만 trig = 1
      if (btn & ~btn_d)
        trig <= 1'b1;
      else
        trig <= 1'b0;
    end
  end
endmodule
