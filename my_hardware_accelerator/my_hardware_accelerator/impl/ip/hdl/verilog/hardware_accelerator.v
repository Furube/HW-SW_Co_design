// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.1
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="hardware_accelerator,hls_ip_2020_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.552000,HLS_SYN_LAT=21,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=11,HLS_SYN_LUT=113,HLS_VERSION=2020_1}" *)

module hardware_accelerator (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        IN_r_TDATA,
        IN_r_TVALID,
        IN_r_TREADY,
        IN_r_TKEEP,
        IN_r_TLAST,
        OUT_r_TDATA,
        OUT_r_TVALID,
        OUT_r_TREADY,
        OUT_r_TKEEP,
        OUT_r_TLAST
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_state2 = 3'd2;
parameter    ap_ST_fsm_state3 = 3'd4;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] IN_r_TDATA;
input   IN_r_TVALID;
output   IN_r_TREADY;
input  [3:0] IN_r_TKEEP;
input  [0:0] IN_r_TLAST;
output  [31:0] OUT_r_TDATA;
output   OUT_r_TVALID;
input   OUT_r_TREADY;
output  [3:0] OUT_r_TKEEP;
output  [0:0] OUT_r_TLAST;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg IN_r_TREADY;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    IN_r_TDATA_blk_n;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln22_fu_80_p2;
reg    OUT_r_TDATA_blk_n;
wire    ap_CS_fsm_state3;
wire   [3:0] i_fu_86_p2;
reg   [3:0] i_reg_116;
wire    regslice_both_OUT_data_V_U_apdone_blk;
reg    ap_block_state2;
reg    ap_block_state2_io;
reg   [3:0] i_0_reg_69;
reg   [2:0] ap_NS_fsm;
wire    regslice_both_IN_data_V_U_apdone_blk;
wire   [31:0] IN_r_TDATA_int;
wire    IN_r_TVALID_int;
reg    IN_r_TREADY_int;
wire    regslice_both_IN_data_V_U_ack_in;
wire    regslice_both_IN_keep_V_U_apdone_blk;
wire   [3:0] IN_r_TKEEP_int;
wire    regslice_both_IN_keep_V_U_vld_out;
wire    regslice_both_IN_keep_V_U_ack_in;
wire    regslice_both_IN_last_V_U_apdone_blk;
wire   [0:0] IN_r_TLAST_int;
wire    regslice_both_IN_last_V_U_vld_out;
wire    regslice_both_IN_last_V_U_ack_in;
wire   [31:0] OUT_r_TDATA_int;
reg    OUT_r_TVALID_int;
wire    OUT_r_TREADY_int;
wire    regslice_both_OUT_data_V_U_vld_out;
wire    regslice_both_OUT_keep_V_U_apdone_blk;
wire    regslice_both_OUT_keep_V_U_ack_in_dummy;
wire    regslice_both_OUT_keep_V_U_vld_out;
wire    regslice_both_OUT_last_V_U_apdone_blk;
wire    regslice_both_OUT_last_V_U_ack_in_dummy;
wire    regslice_both_OUT_last_V_U_vld_out;

// power-on initialization
initial begin
#0 ap_CS_fsm = 3'd1;
end

regslice_both #(
    .DataWidth( 32 ))
regslice_both_IN_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(IN_r_TDATA),
    .vld_in(IN_r_TVALID),
    .ack_in(regslice_both_IN_data_V_U_ack_in),
    .data_out(IN_r_TDATA_int),
    .vld_out(IN_r_TVALID_int),
    .ack_out(IN_r_TREADY_int),
    .apdone_blk(regslice_both_IN_data_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 4 ))
regslice_both_IN_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(IN_r_TKEEP),
    .vld_in(IN_r_TVALID),
    .ack_in(regslice_both_IN_keep_V_U_ack_in),
    .data_out(IN_r_TKEEP_int),
    .vld_out(regslice_both_IN_keep_V_U_vld_out),
    .ack_out(IN_r_TREADY_int),
    .apdone_blk(regslice_both_IN_keep_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 1 ))
regslice_both_IN_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(IN_r_TLAST),
    .vld_in(IN_r_TVALID),
    .ack_in(regslice_both_IN_last_V_U_ack_in),
    .data_out(IN_r_TLAST_int),
    .vld_out(regslice_both_IN_last_V_U_vld_out),
    .ack_out(IN_r_TREADY_int),
    .apdone_blk(regslice_both_IN_last_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 32 ))
regslice_both_OUT_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(OUT_r_TDATA_int),
    .vld_in(OUT_r_TVALID_int),
    .ack_in(OUT_r_TREADY_int),
    .data_out(OUT_r_TDATA),
    .vld_out(regslice_both_OUT_data_V_U_vld_out),
    .ack_out(OUT_r_TREADY),
    .apdone_blk(regslice_both_OUT_data_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 4 ))
regslice_both_OUT_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(IN_r_TKEEP_int),
    .vld_in(OUT_r_TVALID_int),
    .ack_in(regslice_both_OUT_keep_V_U_ack_in_dummy),
    .data_out(OUT_r_TKEEP),
    .vld_out(regslice_both_OUT_keep_V_U_vld_out),
    .ack_out(OUT_r_TREADY),
    .apdone_blk(regslice_both_OUT_keep_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 1 ))
regslice_both_OUT_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(IN_r_TLAST_int),
    .vld_in(OUT_r_TVALID_int),
    .ack_in(regslice_both_OUT_last_V_U_ack_in_dummy),
    .data_out(OUT_r_TLAST),
    .vld_out(regslice_both_OUT_last_V_U_vld_out),
    .ack_out(OUT_r_TREADY),
    .apdone_blk(regslice_both_OUT_last_V_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state3) & (1'b1 == OUT_r_TREADY_int))) begin
        i_0_reg_69 <= i_reg_116;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_0_reg_69 <= 4'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((~((1'b1 == ap_block_state2_io) | (regslice_both_OUT_data_V_U_apdone_blk == 1'b1) | ((icmp_ln22_fu_80_p2 == 1'd0) & (1'b0 == IN_r_TVALID_int))) & (1'b1 == ap_CS_fsm_state2))) begin
        i_reg_116 <= i_fu_86_p2;
    end
end

always @ (*) begin
    if (((icmp_ln22_fu_80_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        IN_r_TDATA_blk_n = IN_r_TVALID_int;
    end else begin
        IN_r_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == IN_r_TVALID) & (regslice_both_IN_data_V_U_ack_in == 1'b1))) begin
        IN_r_TREADY = 1'b1;
    end else begin
        IN_r_TREADY = 1'b0;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state2_io) | (regslice_both_OUT_data_V_U_apdone_blk == 1'b1) | ((icmp_ln22_fu_80_p2 == 1'd0) & (1'b0 == IN_r_TVALID_int))) & (icmp_ln22_fu_80_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        IN_r_TREADY_int = 1'b1;
    end else begin
        IN_r_TREADY_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | ((icmp_ln22_fu_80_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2)))) begin
        OUT_r_TDATA_blk_n = OUT_r_TREADY_int;
    end else begin
        OUT_r_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state2_io) | (regslice_both_OUT_data_V_U_apdone_blk == 1'b1) | ((icmp_ln22_fu_80_p2 == 1'd0) & (1'b0 == IN_r_TVALID_int))) & (icmp_ln22_fu_80_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        OUT_r_TVALID_int = 1'b1;
    end else begin
        OUT_r_TVALID_int = 1'b0;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state2_io) | (regslice_both_OUT_data_V_U_apdone_blk == 1'b1) | ((icmp_ln22_fu_80_p2 == 1'd0) & (1'b0 == IN_r_TVALID_int))) & (icmp_ln22_fu_80_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state2_io) | (regslice_both_OUT_data_V_U_apdone_blk == 1'b1) | ((icmp_ln22_fu_80_p2 == 1'd0) & (1'b0 == IN_r_TVALID_int))) & (icmp_ln22_fu_80_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((1'b1 == ap_block_state2_io) | (regslice_both_OUT_data_V_U_apdone_blk == 1'b1) | ((icmp_ln22_fu_80_p2 == 1'd0) & (1'b0 == IN_r_TVALID_int))) & (icmp_ln22_fu_80_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if ((~((1'b1 == ap_block_state2_io) | (regslice_both_OUT_data_V_U_apdone_blk == 1'b1) | ((icmp_ln22_fu_80_p2 == 1'd0) & (1'b0 == IN_r_TVALID_int))) & (icmp_ln22_fu_80_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (1'b1 == OUT_r_TREADY_int))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign OUT_r_TDATA_int = (IN_r_TDATA_int + 32'd255);

assign OUT_r_TVALID = regslice_both_OUT_data_V_U_vld_out;

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

always @ (*) begin
    ap_block_state2 = ((regslice_both_OUT_data_V_U_apdone_blk == 1'b1) | ((icmp_ln22_fu_80_p2 == 1'd0) & (1'b0 == IN_r_TVALID_int)));
end

always @ (*) begin
    ap_block_state2_io = ((icmp_ln22_fu_80_p2 == 1'd0) & (1'b0 == OUT_r_TREADY_int));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign i_fu_86_p2 = (i_0_reg_69 + 4'd1);

assign icmp_ln22_fu_80_p2 = ((i_0_reg_69 == 4'd10) ? 1'b1 : 1'b0);

endmodule //hardware_accelerator
