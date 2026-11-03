module orgate_tb;
  logic a,b;
  logic c;
  
  orgate org( .a(a), .b(b), .c(c) );
  
  initial
    begin
      a = 1'b0;
      b = 1'b0;

      #5
      a = 1'b0;
      b = 1'b1;      
      
      #5
      a = 1'b1;
      b = 1'b0;
      
      #5
      a = 1'b1;
      b = 1'b1;

      #5
      $finish;
    end
  
    initial
    begin
      $display("                Tempo   Entradas    Saídas");
      $display("                         a    b       c");
      $display("                ====   ==========  =======");
      $monitor($time,"     %b    %b       %b", a, b, c);
    end
  
endmodule
