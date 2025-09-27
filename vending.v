module SM2(clk, rst, A, B, C, state, y);

  input clk, rst;
  input A,B,C;
 
  output reg [2:0] state;
  output reg y;

  parameter S0=3'b000;
  parameter S50=3'b001;
  parameter S100=3'b010;
  parameter S150=3'b011;
  parameter S200=3'b100;

  wire A_trig, B_trig, C_trig;

  oneshot u1(.clk(clk), .rst(rst), .btn(A), .trig(A_trig));
  oneshot u2(.clk(clk), .rst(rst), .btn(A), .trig(A_trig));
  oneshot u3(.clk(clk), .rst(rst), .btn(A), .trig(A_trig));

  always @(negedge rst or posedge clk)begin
    if(!rst)state <= S0;
    else begin
      case(state)
        S0:begin
          if(A_trig==1)state<=S50;
          else if(B_trig==1)state<=S100;
          else state<=S0;
        end
        S50:begin
          if(A_trig==1)state<=S100;
          else if(B_trig==1)state<=S150;
          else state<=S50;
        end
        S100:begin
          if(A_trig==1)state<=S150;
          else if(B_trig==1)state<=S200;
          else state<=S150;
        end
        S150:begin
          if(A_trig==1)state<=S200;
          else if(B_trig==1)state<=S200;
          else state<=S200;
        end
        S200:begin
          if(A_trig==1)state<=S200;
          else if(B_trig==1)state<=S200;
          else state<=S200;
        end
      endcase
    end
  end
