`timescale  1 ps / 1 ps
module LUT23_tb;
    logic A, B, CIN;
    logic S, COUT;

    logic w1, BCIN, BA, ACIN;

    LUT2 #(.INIT(4'h06)) LUT2_U1(.I0(A), .I1(w1), .O(S));
    LUT2 #(.INIT(4'h06)) LUT2_U2(.I0(B), .I1(CIN), .O(w1));
    LUT2 #(.INIT(4'h08)) LUT2_U3(.I0(B), .I1(CIN), .O(BCIN));
    LUT2 #(.INIT(4'h08)) LUT2_U4(.I0(B), .I1(A), .O(BA));
    LUT2 #(.INIT(4'h08)) LUT2_U5(.I0(CIN), .I1(A), .O(ACIN));
    LUT3 #(.INIT(8'hFE)) LUT3_U6(.I0(BCIN), .I1(BA), .I2(ACIN), .O(COUT));

  initial
    begin
      A = 1'b0; B = 1'b0; CIN = 1'b0;
      #5
      A = 1'b0; B = 1'b0; CIN = 1'b1;
      #5
      A = 1'b0; B = 1'b1; CIN = 1'b0;
      #5
      A = 1'b0; B = 1'b1; CIN = 1'b1;
      #5
      A = 1'b1; B = 1'b0; CIN = 1'b0;
      #5
      A = 1'b1; B = 1'b0; CIN = 1'b1;
      #5
      A = 1'b1; B = 1'b1; CIN = 1'b0;
      #5
      A = 1'b1; B = 1'b1; CIN = 1'b1;
    end
  
    initial begin
        $display("\t         Tempo\t     Entradas LUT\t           Saídas");
        $display("\t                A\t B\t CIN\t |\tS\t COUT");
        $display("                =============================================================");
        $monitor($time,"\t %b\t %b\t %b\t |        %b\t%b\t", A, B, CIN, S, COUT);
    end

endmodule
