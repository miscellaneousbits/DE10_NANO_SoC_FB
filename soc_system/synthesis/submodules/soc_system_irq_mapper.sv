// (C) 2001-2018 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/rel/18.1std/ip/merlin/altera_irq_mapper/altera_irq_mapper.sv.terp#1 $
// $Revision: #1 $
// $Date: 2018/07/18 $
// $Author: psgswbuild $

// -------------------------------------------------------
// Altera IRQ Mapper
//
// Parameters
//   NUM_RCVRS        : 4
//   SENDER_IRW_WIDTH : 4
//   IRQ_MAP          : 0:3,1:0,2:1,3:2
//
// -------------------------------------------------------

`timescale 1 ns / 1 ns

module soc_system_irq_mapper
(
    // -------------------
    // Clock & Reset
    // -------------------
    input clk,
    input reset,

    // -------------------
    // IRQ Receivers
    // -------------------
    input                receiver0_irq,
    input                receiver1_irq,
    input                receiver2_irq,
    input                receiver3_irq,

    // -------------------
    // Command Source (Output)
    // -------------------
    output reg [3 : 0] sender_irq
);


    always @* begin
	sender_irq = 0;

        sender_irq[3] = receiver0_irq;
        sender_irq[0] = receiver1_irq;
        sender_irq[1] = receiver2_irq;
        sender_irq[2] = receiver3_irq;
    end

endmodule
