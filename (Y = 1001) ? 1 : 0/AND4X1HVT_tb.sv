`timescale 1ns/10ps


module AND4X1HVT_tb;

    wire Y;
    reg A, B, C, D;

    AND4X1HVT dut(
        .Y(Y),
        .A(A),
        .B(B),
        .C(C),
        .D(D)
    );

    integer i;
    initial begin
        for (i = 0; i < 16; i++) begin
            {A, B, C, D} = i;
            #5;
        end

        $finish;
    end

    /* initial begin
        A = 0; B = 0; C = 0; D = 0;
        #5;
        A = 0; B = 0; C = 0; D = 1;
        #5;
        A = 0; B = 0; C = 1; D = 0;
        #5;
        A = 0; B = 0; C = 1; D = 1;
        #5;
        A = 0; B = 1; C = 0; D = 0;
        #5;
        A = 0; B = 1; C = 0; D = 1;
        #5;
        A = 0; B = 1; C = 1; D = 0;
        #5;
        A = 0; B = 1; C = 1; D = 1;
        #5;
        A = 1; B = 0; C = 0; D = 0;
        #5;
        A = 1; B = 0; C = 0; D = 1;
        #5;
        A = 1; B = 0; C = 1; D = 0;
        #5;
        A = 1; B = 0; C = 1; D = 1;
        #5;
        A = 1; B = 1; C = 0; D = 0;
        #5;
        A = 1; B = 1; C = 0; D = 1;
        #5;
        A = 1; B = 1; C = 1; D = 0;
        #5;
        A = 01; B = 1; C = 1; D = 1;

        $finish;
    end */

    initial begin
        $monitor($time," | A = %b | B = %b | C = %b | D = %b | Y = %b", A, B, C, D, Y);
    end

endmodule