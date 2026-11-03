module notgate_tb;
  logic a;
  logic b;
  
  notgate notg( .a(a), .b(b));
  
  initial
    begin
      a = 1'b0;
      #5
      a = 1'b1;
      #5
      $finish;
    end
  
    initial
    begin
      $display("                Tempo   Entradas    Saídas");
      $display("                         a            b");
      $display("                ====   ==========  =======");
      $monitor($time,"     %b       %b", a, b);
    end
  
endmodule
