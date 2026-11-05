module contador8(
    input wire clk, reset, up_down,
    output reg [7:0] q
    );
    
    always @(posedge clk) begin
        if(reset) begin
            q <= 8'd0;
        end else if(up_down) begin
            q <= q + 8'd1;
        end else begin
            q <= q - 8'd1;
        end

    end
endmodule

module reg8_load(
    input wire clk, reset, lr,
    input wire [7:0] d,
    output reg [7:0] q
    );

    always @(posedge clk) begin
        if(reset) begin
            q <= 8'd0;
        end else if(lr) begin
            q <= d;
        end
    end
endmodule

module somador(
    input wire [7:0] a, b,
    output wire [7:0] s
    );

    assign s = a + b;
endmodule


module subtrador(
    input wire [7:0] a, b,
    output wire [7:0] s
    );

    assign s = a - b;
endmodule

module mux2(
    input wire [7:0] d1, d0,
    input wire sel,
    output wire [7:0] y
    );

    assign y = sel ? d1 : d0;
endmodule

module reg8(
    input wire clk, reset,
    input wire [7:0] d,
    output reg [7:0] q
    );

    always @(posedge clk) begin
        if (reset) begin
            q <= 8'd0;
        end else begin
            q <= d;
        end
    end
endmodule

module nibble_7seg (
    input  wire [3:0] nib,    // 4 bits input (0 a 15)
    output reg  [6:0] seg        // Output segments [g,f,e,d,c,b,a]
    );

    always @(*) begin
        case (nib)
            4'h0: seg = 7'b0111111; // 0
            4'h1: seg = 7'b0000110; // 1
            4'h2: seg = 7'b1011011; // 2
            4'h3: seg = 7'b1001111; // 3
            4'h4: seg = 7'b1100110; // 4
            4'h5: seg = 7'b1101101; // 5
            4'h6: seg = 7'b1111101; // 6
            4'h7: seg = 7'b0000111; // 7
            4'h8: seg = 7'b1111111; // 8
            4'h9: seg = 7'b1101111; // 9
            4'hA: seg = 7'b1110111; // A
            4'hB: seg = 7'b1111100; // b
            4'hC: seg = 7'b0111001; // C
            4'hD: seg = 7'b1011110; // d
            4'hE: seg = 7'b1111001; // E
            4'hF: seg = 7'b1110001; // F
            default: seg = 7'b0000000; // Off
        endcase
    end
endmodule

module reg7(
    input wire clk, reset,
    input wire [6:0] d,
    output reg [6:0] q
    );

    always @(posedge clk) begin
        if(reset) begin
            q <= 7'b0000000;
        end else begin
            q <= d;
        end
    end
endmodule

module top (
    input  wire clk, reset, up_down, lr, sel,
    input  wire [7:0] dado_ent,
    output wire [6:0] display0,  
    output wire [6:0] display1 
);
    wire [7:0] cont, reg_op, soma, subt, mux_out, reg_out;
    wire [6:0] seg0, seg1;

    contador8 u_cont (.clk(clk), .reset(reset), .up_down(up_down), .q(cont));
    reg8_load u_regld (.clk(clk), .reset(reset), .lr(lr), .d(dado_ent), .q(reg_op));

    somador   u_som (.a(cont), .b(reg_op), .s(soma));
    subtrador u_sub (.a(cont), .b(reg_op), .s(subt));

    mux2 u_mux (.d0(soma), .d1(subt), .sel(sel), .y(mux_out));
    reg8 u_reg (.clk(clk), .reset(reset), .d(mux_out), .q(reg_out));

    nibble_7seg u_conv0 (.nib(reg_out[3:0]), .seg(seg0));
    nibble_7seg u_conv1 (.nib(reg_out[7:4]), .seg(seg1));

    reg7 u_rd0 (.clk(~clk), .reset(reset), .d(seg0), .q(display0));
    reg7 u_rd1 (.clk(~clk), .reset(reset), .d(seg1), .q(display1));

endmodule