`timescale  1 ps / 1 ps
module LUT3_tb;
    logic A3, A2, A1, A0;
    logic Y;

    logic w1, w2, w3, w4, w5, w6;
    
    LUT3 #(.INIT(8'h7F)) LUT3_U1(.I0(~A3), .I1(~A2), .I2(~A1), .O(w1));
    LUT3 #(.INIT(8'h7F)) LUT3_U2(.I0(A3), .I1(A2), .I2(A0), .O(w2));
    LUT3 #(.INIT(8'h7F)) LUT3_U3(.I0(A3), .I1(A2), .I2(A1), .O(w3));
    LUT3 #(.INIT(8'h7F)) LUT3_U4(.I0(~A3), .I1(~A2), .I2(~A0), .O(w4));
    LUT3 #(.INIT(8'h80)) LUT3_U5(.I0(w1), .I1(w2), .I2(1'b1), .O(w5));
    LUT3 #(.INIT(8'h80)) LUT3_U6(.I0(w3), .I1(w4), .I2(1'b1), .O(w6));
    LUT3 #(.INIT(8'h7F)) LUT3_U7(.I0(w5), .I1(w6), .I2(1'b1), .O(Y));

  initial
    begin
      A0 = 1'b0; A1 = 1'b0; A2 = 1'b0; A3 = 1'b0;
      #5
      A0 = 1'b0; A1 = 1'b0; A2 = 1'b0; A3 = 1'b1;
      #5
      A0 = 1'b0; A1 = 1'b0; A2 = 1'b1; A3 = 1'b0;
      #5
      A0 = 1'b0; A1 = 1'b0; A2 = 1'b1; A3 = 1'b1;
      #5
      A0 = 1'b0; A1 = 1'b1; A2 = 1'b0; A3 = 1'b0;
      #5
      A0 = 1'b0; A1 = 1'b1; A2 = 1'b0; A3 = 1'b1;
      #5
      A0 = 1'b0; A1 = 1'b1; A2 = 1'b1; A3 = 1'b0;
      #5
      A0 = 1'b0; A1 = 1'b1; A2 = 1'b1; A3 = 1'b1;
      #5
      A0 = 1'b1; A1 = 1'b0; A2 = 1'b0; A3 = 1'b0;
      #5
      A0 = 1'b1; A1 = 1'b0; A2 = 1'b0; A3 = 1'b1;
      #5
      A0 = 1'b1; A1 = 1'b0; A2 = 1'b1; A3 = 1'b0;
      #5
      A0 = 1'b1; A1 = 1'b0; A2 = 1'b1; A3 = 1'b1;
      #5
      A0 = 1'b1; A1 = 1'b1; A2 = 1'b0; A3 = 1'b0;
      #5
      A0 = 1'b1; A1 = 1'b1; A2 = 1'b0; A3 = 1'b1;
      #5
      A0 = 1'b1; A1 = 1'b1; A2 = 1'b1; A3 = 1'b0;
      #5
      A0 = 1'b1; A1 = 1'b1; A2 = 1'b1; A3 = 1'b1;
    end
  
    initial begin
        $display("\t         Tempo\t        Entradas LUT\t             Saídas");
        $display("\t                A0\t A1\t A2\t A3\t |\tY");
        $display("                =============================================================");
        $monitor($time,"\t %b\t %b\t %b\t %b\t | \t", A0, A1, A2, A3, Y);
    end

endmodule
