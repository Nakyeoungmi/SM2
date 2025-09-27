module oneshot(
  input clk, rst, btn,
  output reg trig
);

  reg btn_d;

  always @(posedge clk or negedge rst)begin
    if (!rst) begin
      btn_d <= 1'b0;
      trig <= 1'b0;
    end else begin
      btn_d <= btn;
      trig <= btn & ~btn_d;
    end
  end
