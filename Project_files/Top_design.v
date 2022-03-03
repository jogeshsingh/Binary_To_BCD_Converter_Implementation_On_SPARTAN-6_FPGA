`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2022 06:07:13 PM
// Design Name: 
// Module Name: Top_design
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define WIDTH_INPUT 8
module Top_design(i_clk , data_input, an , seg_OUT);
input i_clk ;
input [`WIDTH_INPUT-1:0] data_input ;
output [2:0] an ;      ///seven_seg_enable used in decoder section ////
output  [7:0] seg_OUT ;

wire [3:0] ones_out ;
wire [3:0] tens_out ;
wire [3:0] hundreds_out ;

wire [1:0] count_out ;      ///output of counter (2-bit ocnfiguartion) ///

///wire [7:0] seg_OUT ;    ////seven_seg_out /////////////
wire [3:0] mux_OUT ;      //output of mux ///

wire clock_out ; /////clock_out = 100hz ///


Bin_BCD BCD(data_input , hundreds_out , tens_out, ones_out );
slow_clkgen CLK_GEN(i_clk , clock_out);
//////binary_bcd BIN_BCD( data_input ,  ones_out , hundreds_out, tens_out  );
counter_2bit Counter( clock_out , count_out  );
decoder DEC (count_out  , an);
seven_seg_converter SEV_SEG( mux_OUT , seg_OUT );
mux MUX ( ones_out , tens_out , hundreds_out ,4'b0000 ,  count_out, mux_OUT);


endmodule
