`timescale 1ns / 1ps

module tb_top;

    // Input
    reg clk;
    reg reset;
    reg up_down;
    reg lr;
    reg sel;
    reg [7:0] dado_ent;

    // Output
    wire [6:0] display0;
    wire [6:0] display1;

    // Design Under Test
    top dut (
        .clk(clk),
        .reset(reset),
        .up_down(up_down),
        .lr(lr),
        .sel(sel),
        .dado_ent(dado_ent),
        .display0(display0),
        .display1(display1)
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin

        //$dumpfile("tb_top.vcd");
        //$dumpvars(0,tb_top);

        clk = 0;
        reset = 1;
        up_down = 1;
        lr = 0;
        sel = 0;
        dado_ent = 8'h00;

        // Hold and release reset
        #15;
        reset = 0;
        #10;

        // 2. Carrega o registrador de carga (u_regld) com o valor 0x05
        dado_ent = 8'h05;
        lr = 1;
        #10;
        lr = 0; // Load keep value

        // 3. Deixa o contador contar um pouco (up_down = 1 -> incrementa)
        // O contador sairá de 0 e irá subindo a cada ciclo de clock
        #40; 

        // 4. Testa a SOMA (sel = 0 seleciona a soma no MUX)
        // Resultado esperado: valor do contador + 5 armazenado no registrador final
        sel = 0;
        #20;

        // 5. Testa a SUBTRAÇÃO (sel = 1 seleciona a subtração no MUX)
        // Resultado esperado: valor do contador - 5 armazenado no registrador final
        sel = 1;
        #20;

        // 6. Mudar direção do contador para decrescente
        up_down = 0;
        #30;

        // Fim da simulação
        $display("Simulação finalizada com sucesso!");
        $finish;
    end

    // Monitoramento opcional no console do simulador
    initial begin
        $monitor("Tempo=%0dns | Reset=%b | Contador_Dir=%b | Mux_Sel(0:Soma,1:Sub)=%b | Disp1_Hex=%b | Disp0_Hex=%b", 
                 $time, reset, up_down, sel, display1, display0);
    end

endmodule
    