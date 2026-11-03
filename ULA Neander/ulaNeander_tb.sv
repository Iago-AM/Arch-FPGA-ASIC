`timescale 1ns / 1ps

module ulaNeander_tb;

    reg [7:0] AC, RDM;
    reg [2:0] sel_ula;
    wire N, Z;
    wire [7:0] resultado;

    localparam [2:0]
        PASS = 3'b000,
        ADD = 3'b001,
        OR = 3'b010,
        AND = 3'b011,
        NOT = 3'b100;

    ulaNeander dut(
        .AC(AC),
        .RDM(RDM),
        .sel_ula(sel_ula),
        .N(N),
        .Z(Z),
        .resultado(resultado)
    );
    
    initial begin
        $display("Resultados: \n");
        
        // PASS
        sel_ula = PASS; AC = 8'h0F; RDM = 8'hA5; #10;

        // ADD
        sel_ula = ADD; AC = 8'h01; RDM = 8'h08; #10;

        // OR
        sel_ula = OR; AC = 8'hA5; RDM = 8'hA4; #10;

        // AND
        sel_ula = AND; AC = 8'h0F; RDM = 8'h0E; #10;

        // NOT
        sel_ula = NOT; AC = 8'h07; RDM = 8'h00; #10;

        // CASO 0
        sel_ula = 3'b001; AC = 8'h00; RDM = 8'h00; #10;

        // DEFAULT
        sel_ula = 8'b111; AC = 8'h01; RDM = 8'h08; #10;
        
        
        
        $finish;
    end

    initial begin
        $monitor("Tempo = %0dns | Sel_Ula = %b | AC = %b | RDM = %b | Resultado = %b | N = %b | Z = %b", 
                 $time, sel_ula, AC, RDM, resultado, N, Z);
    end




endmodule