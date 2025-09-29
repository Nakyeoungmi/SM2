`timescale 1ns / 1ps
module vending(
  input clk, rst,
  input A, B, C,          // 버튼: A=50원, B=100원, C=음료 선택
  output reg [2:0] state, // 현재 상태 (금액 단계)
  output reg y            // 음료 출력 신호
);

  // 상태 정의
  parameter S0   = 3'b000;  // 0원
  parameter S50  = 3'b001;  // 50원
  parameter S100 = 3'b010;  // 100원
  parameter S150 = 3'b011;  // 150원
  parameter S200 = 3'b100;  // 200원

  wire A_trig, B_trig, C_trig;

  // 버튼 입력 → 원샷 트리거
  oneshot u1(.clk(clk), .rst(rst), .btn(A), .trig(A_trig));
  oneshot u2(.clk(clk), .rst(rst), .btn(B), .trig(B_trig));
  oneshot u3(.clk(clk), .rst(rst), .btn(C), .trig(C_trig));

  // FSM
  always @(posedge clk) begin
    if (!rst) begin
      state <= S0;
      y <= 1'b0;
    end 
    else begin
      case(state)
        S0: begin
          y <= 1'b0;
          if (A_trig) state <= S50;
          else if (B_trig) state <= S100;
          else state <= S0;
        end

        S50: begin
          y <= 1'b0;
          if (A_trig) state <= S100;
          else if (B_trig) state <= S150;
          else state <= S50;
        end

        S100: begin
          y <= 1'b0;
          if (A_trig) state <= S150;
          else if (B_trig) state <= S200;
          else state <= S100;
        end

        S150: begin
          y <= 1'b0;
          if (A_trig) state <= S200;
          else if (B_trig) state <= S200;
          else state <= S150;
        end

        S200: begin
          if (C_trig) begin
            y <= 1'b1;   // 음료 출력
            state <= S0; // 초기화
          end else begin
            y <= 1'b0;
            state <= S200; // 대기
          end
        end

        default: begin
          state <= S0;
          y <= 1'b0;
        end
      endcase
    end
  end
endmodule
`timescale 1ns / 1ps
module vending(
  input clk, rst,
  input A, B, C,          // 버튼: A=50원, B=100원, C=음료 선택
  output reg [2:0] state, // 현재 상태 (금액 단계)
  output reg y            // 음료 출력 신호
);

  // 상태 정의
  parameter S0   = 3'b000;  // 0원
  parameter S50  = 3'b001;  // 50원
  parameter S100 = 3'b010;  // 100원
  parameter S150 = 3'b011;  // 150원
  parameter S200 = 3'b100;  // 200원

  wire A_trig, B_trig, C_trig;

  // 버튼 입력 → 원샷 트리거
  oneshot u1(.clk(clk), .rst(rst), .btn(A), .trig(A_trig));
  oneshot u2(.clk(clk), .rst(rst), .btn(B), .trig(B_trig));
  oneshot u3(.clk(clk), .rst(rst), .btn(C), .trig(C_trig));

  // FSM
  always @(posedge clk) begin
    if (!rst) begin
      state <= S0;
      y <= 1'b0;
    end 
    else begin
      case(state)
        S0: begin
          y <= 1'b0;
          if (A_trig) state <= S50;
          else if (B_trig) state <= S100;
          else state <= S0;
        end

        S50: begin
          y <= 1'b0;
          if (A_trig) state <= S100;
          else if (B_trig) state <= S150;
          else state <= S50;
        end

        S100: begin
          y <= 1'b0;
          if (A_trig) state <= S150;
          else if (B_trig) state <= S200;
          else state <= S100;
        end

        S150: begin
          y <= 1'b0;
          if (A_trig) state <= S200;
          else if (B_trig) state <= S200;
          else state <= S150;
        end

        S200: begin
          if (C_trig) begin
            y <= 1'b1;   // 음료 출력
            state <= S0; // 초기화
          end else begin
            y <= 1'b0;
            state <= S200; // 대기
          end
        end

        default: begin
          state <= S0;
          y <= 1'b0;
        end
      endcase
    end
  end
endmodule

