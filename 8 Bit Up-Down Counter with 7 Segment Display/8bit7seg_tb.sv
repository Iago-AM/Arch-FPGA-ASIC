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

        // Loads u_regld with 0x05
        dado_ent = 8'h05;
        lr = 1;
        #10;
        lr = 0; // Load keep value

        // up_down = 1 -> increase
        // Counter goes from 0, increasing every clock cycle
        #40; 

        // Try SUM (sel = 0)
        // Expected result: Counter value + 5 stored in final register
        sel = 0;
        #20;

        // Try SUB (sel = 1)
        // Expected result: Counter value - 5 stored in final register
        sel = 1;
        #20;

        // Change counter direction -> decrease
        up_down = 0;
        #30;

        // Fim da simulação
        $display("Simulation finished!");
        $finish;
    end

    // Optional monitoring
    initial begin
        $monitor("Time=%0dns | Reset=%b | Counter_R=%b | Mux_Sel(0:Sum,1:Sub)=%b | Disp1_Hex=%b | Disp0_Hex=%b", 
                 $time, reset, up_down, sel, display1, display0);
    end

endmodule
    
