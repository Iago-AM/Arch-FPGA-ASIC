`timescale  1 ps / 1 ps
module LUT2_tb;
    logic A, B, C, D;
    logic X;

    logic w1, w2, w3;
    
    LUT2 #(.INIT(4'h7)) LUT2_U1( .I0(A), .I1(B), .O(w1) );
    LUT2 #(.INIT(4'h7)) LUT2_U2( .I0(w1), .I1(C), .O(w2) );
    LUT2 #(.INIT(4'h7)) LUT2_U3( .I0(C), .I1(D), .O(w3) );
    LUT2 #(.INIT(4'h1)) LUT2_U4( .I0(w2), .I1(w3), .O(X) );


  initial
    begin
      A = 1'b0; B = 1'b0; C = 1'b0; D = 1'b0;
      #5
      A = 1'b0; B = 1'b0; C = 1'b0; D = 1'b1;
      #5
      A = 1'b0; B = 1'b0; C = 1'b1; D = 1'b0;
      #5
      A = 1'b0; B = 1'b0; C = 1'b1; D = 1'b1;
      #5
      A = 1'b0; B = 1'b1; C = 1'b0; D = 1'b0;
      #5
      A = 1'b0; B = 1'b1; C = 1'b0; D = 1'b1;
      #5
      A = 1'b0; B = 1'b1; C = 1'b1; D = 1'b0;
      #5
      A = 1'b0; B = 1'b1; C = 1'b1; D = 1'b1;
      #5
      A = 1'b1; B = 1'b0; C = 1'b0; D = 1'b0;
      #5
      A = 1'b1; B = 1'b0; C = 1'b0; D = 1'b1;
      #5
      A = 1'b1; B = 1'b0; C = 1'b1; D = 1'b0;
      #5
      A = 1'b1; B = 1'b0; C = 1'b1; D = 1'b1;
      #5
      A = 1'b1; B = 1'b1; C = 1'b0; D = 1'b0;
      #5
      A = 1'b1; B = 1'b1; C = 1'b0; D = 1'b1;
      #5
      A = 1'b1; B = 1'b1; C = 1'b1; D = 1'b0;
      #5
      A = 1'b1; B = 1'b1; C = 1'b1; D = 1'b1;
    end
  
    initial begin
        $display("                Tempo    |     Entradas LUT      |   Saídas");
        $display("            \t\t A      B       C      D   |  X");
        $display("                =======================================");
        $monitor($time,"  |   %b      %b       %b      %b   |  %b", A, B, C, D, X);
    end

endmodule
