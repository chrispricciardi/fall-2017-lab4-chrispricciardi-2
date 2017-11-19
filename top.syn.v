
module top ( clk, reset );
  input clk, reset;
  wire   done, ps_in, fs_in, a_in, b_in, mr_in, write, multiply_enable,
         add_enable, \ADDER/N31 , \ADDER/N30 , \ADDER/N29 , \ADDER/N28 ,
         \ADDER/N27 , \ADDER/N26 , \ADDER/N25 , \ADDER/N24 , \ADDER/N23 ,
         \ADDER/N22 , \ADDER/N21 , \ADDER/N20 , \ADDER/N19 , \ADDER/N18 ,
         \ADDER/N17 , \ADDER/N16 , \ADDER/N15 , \ADDER/N14 , \ADDER/N13 ,
         \ADDER/N12 , \ADDER/N11 , \ADDER/N10 , \ADDER/N9 , \ADDER/N8 ,
         \ADDER/N7 , \ADDER/N6 , \ADDER/N5 , \ADDER/N4 , \ADDER/N3 ,
         \ADDER/N2 , \ADDER/N1 , \ADDER/N0 , \A_REG/N35 , \A_REG/N34 ,
         \A_REG/N33 , \A_REG/N32 , \A_REG/N31 , \A_REG/N30 , \A_REG/N29 ,
         \A_REG/N28 , \A_REG/N27 , \A_REG/N26 , \A_REG/N25 , \A_REG/N24 ,
         \A_REG/N23 , \A_REG/N22 , \A_REG/N21 , \A_REG/N20 , \A_REG/N19 ,
         \A_REG/N18 , \A_REG/N17 , \A_REG/N16 , \A_REG/N15 , \A_REG/N14 ,
         \A_REG/N13 , \A_REG/N12 , \A_REG/N11 , \A_REG/N10 , \A_REG/N9 ,
         \A_REG/N8 , \A_REG/N7 , \A_REG/N6 , \A_REG/N5 , \A_REG/N4 ,
         \B_REG/N35 , \B_REG/N34 , \B_REG/N33 , \B_REG/N32 , \B_REG/N31 ,
         \B_REG/N30 , \B_REG/N29 , \B_REG/N28 , \B_REG/N27 , \B_REG/N26 ,
         \B_REG/N25 , \B_REG/N24 , \B_REG/N23 , \B_REG/N22 , \B_REG/N21 ,
         \B_REG/N20 , \B_REG/N19 , \B_REG/N18 , \B_REG/N17 , \B_REG/N16 ,
         \B_REG/N15 , \B_REG/N14 , \B_REG/N13 , \B_REG/N12 , \B_REG/N11 ,
         \B_REG/N10 , \B_REG/N9 , \B_REG/N8 , \B_REG/N7 , \B_REG/N6 ,
         \B_REG/N5 , \B_REG/N4 , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, \add_x_1/n32 , \intadd_0/n30 ,
         \intadd_0/n29 , \intadd_0/n28 , \intadd_0/n27 , \intadd_0/n26 ,
         \intadd_0/n25 , \intadd_0/n24 , \intadd_0/n23 , \intadd_0/n22 ,
         \intadd_0/n21 , \intadd_0/n20 , \intadd_0/n19 , \intadd_0/n18 ,
         \intadd_0/n17 , \intadd_0/n16 , \intadd_0/n15 , \intadd_0/n14 ,
         \intadd_0/n13 , \intadd_0/n12 , \intadd_0/n11 , \intadd_0/n10 ,
         \intadd_0/n9 , \intadd_0/n8 , \intadd_0/n7 , \intadd_0/n6 ,
         \intadd_0/n5 , \intadd_0/n4 , \intadd_0/n3 , \intadd_0/n2 ,
         \intadd_0/n1 , n103, n104, n105, n106, n107;
  wire   [3:0] address;
  wire   [31:0] product;
  wire   [31:0] A;
  wire   [31:0] B;
  wire   [31:0] PRODUCT;
  wire   [31:0] ps;
  wire   [31:0] sum;
  wire   [31:0] wdata;
  wire   [31:0] a;
  wire   [31:0] b;

  control CONTROL ( .clk(clk), .reset(reset), .done(done), .ps_in(ps_in), 
        .fs_in(fs_in), .a_in(a_in), .b_in(b_in), .mr_in(mr_in), .address(
        address), .write(write), .multiply_enable(multiply_enable), 
        .add_enable(add_enable), .fs_out() );
  mult MULT ( .clk(clk), .product(product), .reset(reset), .done(done), 
        .multiply_enable(multiply_enable), .A(A), .B(B) );
  ps_reg PS_REG ( .clk(clk), .reset(reset), .ps_in(ps_in), .sum(sum), .ps(ps)
         );
  fs_reg FS_REG ( .clk(clk), .reset(reset), .fs_in(fs_in), .ps(ps), .fs() );
  srama SRAMA ( .clk(clk), .wdata(wdata), .write(write), .address(address), 
        .rdata(a) );
  sramb SRAMB ( .clk(clk), .wdata(wdata), .write(write), .address(address), 
        .rdata(b) );
  mr_reg MR_REG ( .clk(clk), .reset(reset), .mr_in(mr_in), .product(product), 
        .PRODUCT(PRODUCT) );
  dp_1 \B_REG/B_reg[31]  ( .ip(n96), .ck(clk), .q(B[31]) );
  dp_1 \ADDER/sum_reg[31]  ( .ip(n95), .ck(clk), .q(sum[31]) );
  dp_1 \ADDER/sum_reg[0]  ( .ip(n94), .ck(clk), .q(sum[0]) );
  dp_1 \ADDER/sum_reg[1]  ( .ip(n93), .ck(clk), .q(sum[1]) );
  dp_1 \ADDER/sum_reg[2]  ( .ip(n92), .ck(clk), .q(sum[2]) );
  dp_1 \ADDER/sum_reg[3]  ( .ip(n91), .ck(clk), .q(sum[3]) );
  dp_1 \ADDER/sum_reg[4]  ( .ip(n90), .ck(clk), .q(sum[4]) );
  dp_1 \ADDER/sum_reg[5]  ( .ip(n89), .ck(clk), .q(sum[5]) );
  dp_1 \ADDER/sum_reg[6]  ( .ip(n88), .ck(clk), .q(sum[6]) );
  dp_1 \ADDER/sum_reg[7]  ( .ip(n87), .ck(clk), .q(sum[7]) );
  dp_1 \ADDER/sum_reg[8]  ( .ip(n86), .ck(clk), .q(sum[8]) );
  dp_1 \ADDER/sum_reg[9]  ( .ip(n85), .ck(clk), .q(sum[9]) );
  dp_1 \ADDER/sum_reg[10]  ( .ip(n84), .ck(clk), .q(sum[10]) );
  dp_1 \ADDER/sum_reg[11]  ( .ip(n83), .ck(clk), .q(sum[11]) );
  dp_1 \ADDER/sum_reg[12]  ( .ip(n82), .ck(clk), .q(sum[12]) );
  dp_1 \ADDER/sum_reg[13]  ( .ip(n81), .ck(clk), .q(sum[13]) );
  dp_1 \ADDER/sum_reg[14]  ( .ip(n80), .ck(clk), .q(sum[14]) );
  dp_1 \ADDER/sum_reg[15]  ( .ip(n79), .ck(clk), .q(sum[15]) );
  dp_1 \ADDER/sum_reg[16]  ( .ip(n78), .ck(clk), .q(sum[16]) );
  dp_1 \ADDER/sum_reg[17]  ( .ip(n77), .ck(clk), .q(sum[17]) );
  dp_1 \ADDER/sum_reg[18]  ( .ip(n76), .ck(clk), .q(sum[18]) );
  dp_1 \ADDER/sum_reg[19]  ( .ip(n75), .ck(clk), .q(sum[19]) );
  dp_1 \ADDER/sum_reg[20]  ( .ip(n74), .ck(clk), .q(sum[20]) );
  dp_1 \ADDER/sum_reg[21]  ( .ip(n73), .ck(clk), .q(sum[21]) );
  dp_1 \ADDER/sum_reg[22]  ( .ip(n72), .ck(clk), .q(sum[22]) );
  dp_1 \ADDER/sum_reg[23]  ( .ip(n71), .ck(clk), .q(sum[23]) );
  dp_1 \ADDER/sum_reg[24]  ( .ip(n70), .ck(clk), .q(sum[24]) );
  dp_1 \ADDER/sum_reg[25]  ( .ip(n69), .ck(clk), .q(sum[25]) );
  dp_1 \ADDER/sum_reg[26]  ( .ip(n68), .ck(clk), .q(sum[26]) );
  dp_1 \ADDER/sum_reg[27]  ( .ip(n67), .ck(clk), .q(sum[27]) );
  dp_1 \ADDER/sum_reg[28]  ( .ip(n66), .ck(clk), .q(sum[28]) );
  dp_1 \ADDER/sum_reg[29]  ( .ip(n65), .ck(clk), .q(sum[29]) );
  dp_1 \ADDER/sum_reg[30]  ( .ip(n64), .ck(clk), .q(sum[30]) );
  dp_1 \A_REG/A_reg[0]  ( .ip(n63), .ck(clk), .q(A[0]) );
  dp_1 \A_REG/A_reg[1]  ( .ip(n62), .ck(clk), .q(A[1]) );
  dp_1 \A_REG/A_reg[2]  ( .ip(n61), .ck(clk), .q(A[2]) );
  dp_1 \A_REG/A_reg[3]  ( .ip(n60), .ck(clk), .q(A[3]) );
  dp_1 \A_REG/A_reg[4]  ( .ip(n59), .ck(clk), .q(A[4]) );
  dp_1 \A_REG/A_reg[5]  ( .ip(n58), .ck(clk), .q(A[5]) );
  dp_1 \A_REG/A_reg[6]  ( .ip(n57), .ck(clk), .q(A[6]) );
  dp_1 \A_REG/A_reg[7]  ( .ip(n56), .ck(clk), .q(A[7]) );
  dp_1 \A_REG/A_reg[8]  ( .ip(n55), .ck(clk), .q(A[8]) );
  dp_1 \A_REG/A_reg[9]  ( .ip(n54), .ck(clk), .q(A[9]) );
  dp_1 \A_REG/A_reg[10]  ( .ip(n53), .ck(clk), .q(A[10]) );
  dp_1 \A_REG/A_reg[11]  ( .ip(n52), .ck(clk), .q(A[11]) );
  dp_1 \A_REG/A_reg[12]  ( .ip(n51), .ck(clk), .q(A[12]) );
  dp_1 \A_REG/A_reg[13]  ( .ip(n50), .ck(clk), .q(A[13]) );
  dp_1 \A_REG/A_reg[14]  ( .ip(n49), .ck(clk), .q(A[14]) );
  dp_1 \A_REG/A_reg[15]  ( .ip(n48), .ck(clk), .q(A[15]) );
  dp_1 \A_REG/A_reg[16]  ( .ip(n47), .ck(clk), .q(A[16]) );
  dp_1 \A_REG/A_reg[17]  ( .ip(n46), .ck(clk), .q(A[17]) );
  dp_1 \A_REG/A_reg[18]  ( .ip(n45), .ck(clk), .q(A[18]) );
  dp_1 \A_REG/A_reg[19]  ( .ip(n44), .ck(clk), .q(A[19]) );
  dp_1 \A_REG/A_reg[20]  ( .ip(n43), .ck(clk), .q(A[20]) );
  dp_1 \A_REG/A_reg[21]  ( .ip(n42), .ck(clk), .q(A[21]) );
  dp_1 \A_REG/A_reg[22]  ( .ip(n41), .ck(clk), .q(A[22]) );
  dp_1 \A_REG/A_reg[23]  ( .ip(n40), .ck(clk), .q(A[23]) );
  dp_1 \A_REG/A_reg[24]  ( .ip(n39), .ck(clk), .q(A[24]) );
  dp_1 \A_REG/A_reg[25]  ( .ip(n38), .ck(clk), .q(A[25]) );
  dp_1 \A_REG/A_reg[26]  ( .ip(n37), .ck(clk), .q(A[26]) );
  dp_1 \A_REG/A_reg[27]  ( .ip(n36), .ck(clk), .q(A[27]) );
  dp_1 \A_REG/A_reg[28]  ( .ip(n35), .ck(clk), .q(A[28]) );
  dp_1 \A_REG/A_reg[29]  ( .ip(n34), .ck(clk), .q(A[29]) );
  dp_1 \A_REG/A_reg[30]  ( .ip(n33), .ck(clk), .q(A[30]) );
  dp_1 \A_REG/A_reg[31]  ( .ip(n32), .ck(clk), .q(A[31]) );
  dp_1 \B_REG/B_reg[0]  ( .ip(n31), .ck(clk), .q(B[0]) );
  dp_1 \B_REG/B_reg[1]  ( .ip(n30), .ck(clk), .q(B[1]) );
  dp_1 \B_REG/B_reg[2]  ( .ip(n29), .ck(clk), .q(B[2]) );
  dp_1 \B_REG/B_reg[3]  ( .ip(n28), .ck(clk), .q(B[3]) );
  dp_1 \B_REG/B_reg[4]  ( .ip(n27), .ck(clk), .q(B[4]) );
  dp_1 \B_REG/B_reg[5]  ( .ip(n26), .ck(clk), .q(B[5]) );
  dp_1 \B_REG/B_reg[6]  ( .ip(n25), .ck(clk), .q(B[6]) );
  dp_1 \B_REG/B_reg[7]  ( .ip(n24), .ck(clk), .q(B[7]) );
  dp_1 \B_REG/B_reg[8]  ( .ip(n23), .ck(clk), .q(B[8]) );
  dp_1 \B_REG/B_reg[9]  ( .ip(n22), .ck(clk), .q(B[9]) );
  dp_1 \B_REG/B_reg[10]  ( .ip(n21), .ck(clk), .q(B[10]) );
  dp_1 \B_REG/B_reg[11]  ( .ip(n20), .ck(clk), .q(B[11]) );
  dp_1 \B_REG/B_reg[12]  ( .ip(n19), .ck(clk), .q(B[12]) );
  dp_1 \B_REG/B_reg[13]  ( .ip(n18), .ck(clk), .q(B[13]) );
  dp_1 \B_REG/B_reg[14]  ( .ip(n17), .ck(clk), .q(B[14]) );
  dp_1 \B_REG/B_reg[15]  ( .ip(n16), .ck(clk), .q(B[15]) );
  dp_1 \B_REG/B_reg[16]  ( .ip(n15), .ck(clk), .q(B[16]) );
  dp_1 \B_REG/B_reg[17]  ( .ip(n14), .ck(clk), .q(B[17]) );
  dp_1 \B_REG/B_reg[18]  ( .ip(n13), .ck(clk), .q(B[18]) );
  dp_1 \B_REG/B_reg[19]  ( .ip(n12), .ck(clk), .q(B[19]) );
  dp_1 \B_REG/B_reg[20]  ( .ip(n11), .ck(clk), .q(B[20]) );
  dp_1 \B_REG/B_reg[21]  ( .ip(n10), .ck(clk), .q(B[21]) );
  dp_1 \B_REG/B_reg[22]  ( .ip(n9), .ck(clk), .q(B[22]) );
  dp_1 \B_REG/B_reg[23]  ( .ip(n8), .ck(clk), .q(B[23]) );
  dp_1 \B_REG/B_reg[24]  ( .ip(n7), .ck(clk), .q(B[24]) );
  dp_1 \B_REG/B_reg[25]  ( .ip(n6), .ck(clk), .q(B[25]) );
  dp_1 \B_REG/B_reg[26]  ( .ip(n5), .ck(clk), .q(B[26]) );
  dp_1 \B_REG/B_reg[27]  ( .ip(n4), .ck(clk), .q(B[27]) );
  dp_1 \B_REG/B_reg[28]  ( .ip(n3), .ck(clk), .q(B[28]) );
  dp_1 \B_REG/B_reg[29]  ( .ip(n2), .ck(clk), .q(B[29]) );
  dp_1 \B_REG/B_reg[30]  ( .ip(n1), .ck(clk), .q(B[30]) );
  mux2_1 U1 ( .ip1(B[31]), .ip2(\B_REG/N35 ), .s(n105), .op(n96) );
  mux2_1 U2 ( .ip1(sum[31]), .ip2(\ADDER/N31 ), .s(add_enable), .op(n95) );
  mux2_1 U3 ( .ip1(sum[0]), .ip2(\ADDER/N0 ), .s(add_enable), .op(n94) );
  mux2_1 U4 ( .ip1(sum[1]), .ip2(\ADDER/N1 ), .s(add_enable), .op(n93) );
  mux2_1 U5 ( .ip1(sum[2]), .ip2(\ADDER/N2 ), .s(add_enable), .op(n92) );
  mux2_1 U6 ( .ip1(sum[3]), .ip2(\ADDER/N3 ), .s(add_enable), .op(n91) );
  mux2_1 U7 ( .ip1(sum[4]), .ip2(\ADDER/N4 ), .s(add_enable), .op(n90) );
  mux2_1 U8 ( .ip1(sum[5]), .ip2(\ADDER/N5 ), .s(add_enable), .op(n89) );
  mux2_1 U9 ( .ip1(sum[6]), .ip2(\ADDER/N6 ), .s(add_enable), .op(n88) );
  mux2_1 U10 ( .ip1(sum[7]), .ip2(\ADDER/N7 ), .s(add_enable), .op(n87) );
  mux2_1 U11 ( .ip1(sum[8]), .ip2(\ADDER/N8 ), .s(add_enable), .op(n86) );
  mux2_1 U12 ( .ip1(sum[9]), .ip2(\ADDER/N9 ), .s(add_enable), .op(n85) );
  mux2_1 U13 ( .ip1(sum[10]), .ip2(\ADDER/N10 ), .s(add_enable), .op(n84) );
  mux2_1 U14 ( .ip1(sum[11]), .ip2(\ADDER/N11 ), .s(add_enable), .op(n83) );
  mux2_1 U15 ( .ip1(sum[12]), .ip2(\ADDER/N12 ), .s(add_enable), .op(n82) );
  mux2_1 U16 ( .ip1(sum[13]), .ip2(\ADDER/N13 ), .s(add_enable), .op(n81) );
  mux2_1 U17 ( .ip1(sum[14]), .ip2(\ADDER/N14 ), .s(add_enable), .op(n80) );
  mux2_1 U18 ( .ip1(sum[15]), .ip2(\ADDER/N15 ), .s(add_enable), .op(n79) );
  mux2_1 U19 ( .ip1(sum[16]), .ip2(\ADDER/N16 ), .s(add_enable), .op(n78) );
  mux2_1 U20 ( .ip1(sum[17]), .ip2(\ADDER/N17 ), .s(add_enable), .op(n77) );
  mux2_1 U21 ( .ip1(sum[18]), .ip2(\ADDER/N18 ), .s(add_enable), .op(n76) );
  mux2_1 U22 ( .ip1(sum[19]), .ip2(\ADDER/N19 ), .s(add_enable), .op(n75) );
  mux2_1 U23 ( .ip1(sum[20]), .ip2(\ADDER/N20 ), .s(add_enable), .op(n74) );
  mux2_1 U24 ( .ip1(sum[21]), .ip2(\ADDER/N21 ), .s(add_enable), .op(n73) );
  mux2_1 U25 ( .ip1(sum[22]), .ip2(\ADDER/N22 ), .s(add_enable), .op(n72) );
  mux2_1 U26 ( .ip1(sum[23]), .ip2(\ADDER/N23 ), .s(add_enable), .op(n71) );
  mux2_1 U27 ( .ip1(sum[24]), .ip2(\ADDER/N24 ), .s(add_enable), .op(n70) );
  mux2_1 U28 ( .ip1(sum[25]), .ip2(\ADDER/N25 ), .s(add_enable), .op(n69) );
  mux2_1 U29 ( .ip1(sum[26]), .ip2(\ADDER/N26 ), .s(add_enable), .op(n68) );
  mux2_1 U30 ( .ip1(sum[27]), .ip2(\ADDER/N27 ), .s(add_enable), .op(n67) );
  mux2_1 U31 ( .ip1(sum[28]), .ip2(\ADDER/N28 ), .s(add_enable), .op(n66) );
  mux2_1 U32 ( .ip1(sum[29]), .ip2(\ADDER/N29 ), .s(add_enable), .op(n65) );
  mux2_1 U33 ( .ip1(sum[30]), .ip2(\ADDER/N30 ), .s(add_enable), .op(n64) );
  mux2_1 U34 ( .ip1(A[0]), .ip2(\A_REG/N4 ), .s(n106), .op(n63) );
  mux2_1 U35 ( .ip1(A[1]), .ip2(\A_REG/N5 ), .s(n106), .op(n62) );
  mux2_1 U36 ( .ip1(A[2]), .ip2(\A_REG/N6 ), .s(n106), .op(n61) );
  mux2_1 U37 ( .ip1(A[3]), .ip2(\A_REG/N7 ), .s(n106), .op(n60) );
  mux2_1 U38 ( .ip1(A[4]), .ip2(\A_REG/N8 ), .s(n106), .op(n59) );
  mux2_1 U39 ( .ip1(A[5]), .ip2(\A_REG/N9 ), .s(n106), .op(n58) );
  mux2_1 U40 ( .ip1(A[6]), .ip2(\A_REG/N10 ), .s(n106), .op(n57) );
  mux2_1 U41 ( .ip1(A[7]), .ip2(\A_REG/N11 ), .s(n106), .op(n56) );
  mux2_1 U42 ( .ip1(A[8]), .ip2(\A_REG/N12 ), .s(n106), .op(n55) );
  mux2_1 U43 ( .ip1(A[9]), .ip2(\A_REG/N13 ), .s(n106), .op(n54) );
  mux2_1 U44 ( .ip1(A[10]), .ip2(\A_REG/N14 ), .s(n106), .op(n53) );
  mux2_1 U45 ( .ip1(A[11]), .ip2(\A_REG/N15 ), .s(n106), .op(n52) );
  mux2_1 U46 ( .ip1(A[12]), .ip2(\A_REG/N16 ), .s(n106), .op(n51) );
  mux2_1 U47 ( .ip1(A[13]), .ip2(\A_REG/N17 ), .s(n106), .op(n50) );
  mux2_1 U48 ( .ip1(A[14]), .ip2(\A_REG/N18 ), .s(n104), .op(n49) );
  mux2_1 U49 ( .ip1(A[15]), .ip2(\A_REG/N19 ), .s(n106), .op(n48) );
  mux2_1 U50 ( .ip1(A[16]), .ip2(\A_REG/N20 ), .s(n104), .op(n47) );
  mux2_1 U51 ( .ip1(A[17]), .ip2(\A_REG/N21 ), .s(n106), .op(n46) );
  mux2_1 U52 ( .ip1(A[18]), .ip2(\A_REG/N22 ), .s(n104), .op(n45) );
  mux2_1 U53 ( .ip1(A[19]), .ip2(\A_REG/N23 ), .s(n106), .op(n44) );
  mux2_1 U54 ( .ip1(A[20]), .ip2(\A_REG/N24 ), .s(n104), .op(n43) );
  mux2_1 U55 ( .ip1(A[21]), .ip2(\A_REG/N25 ), .s(n104), .op(n42) );
  mux2_1 U56 ( .ip1(A[22]), .ip2(\A_REG/N26 ), .s(n104), .op(n41) );
  mux2_1 U57 ( .ip1(A[23]), .ip2(\A_REG/N27 ), .s(n104), .op(n40) );
  mux2_1 U58 ( .ip1(A[24]), .ip2(\A_REG/N28 ), .s(n104), .op(n39) );
  mux2_1 U59 ( .ip1(A[25]), .ip2(\A_REG/N29 ), .s(n104), .op(n38) );
  mux2_1 U60 ( .ip1(A[26]), .ip2(\A_REG/N30 ), .s(n104), .op(n37) );
  mux2_1 U61 ( .ip1(A[27]), .ip2(\A_REG/N31 ), .s(n104), .op(n36) );
  mux2_1 U62 ( .ip1(A[28]), .ip2(\A_REG/N32 ), .s(n104), .op(n35) );
  mux2_1 U63 ( .ip1(A[29]), .ip2(\A_REG/N33 ), .s(n104), .op(n34) );
  mux2_1 U64 ( .ip1(A[30]), .ip2(\A_REG/N34 ), .s(n104), .op(n33) );
  mux2_1 U65 ( .ip1(A[31]), .ip2(\A_REG/N35 ), .s(n104), .op(n32) );
  mux2_1 U66 ( .ip1(B[0]), .ip2(\B_REG/N4 ), .s(n105), .op(n31) );
  mux2_1 U67 ( .ip1(B[1]), .ip2(\B_REG/N5 ), .s(n105), .op(n30) );
  mux2_1 U68 ( .ip1(B[2]), .ip2(\B_REG/N6 ), .s(n105), .op(n29) );
  mux2_1 U69 ( .ip1(B[3]), .ip2(\B_REG/N7 ), .s(n105), .op(n28) );
  mux2_1 U70 ( .ip1(B[4]), .ip2(\B_REG/N8 ), .s(n105), .op(n27) );
  mux2_1 U71 ( .ip1(B[5]), .ip2(\B_REG/N9 ), .s(n105), .op(n26) );
  mux2_1 U72 ( .ip1(B[6]), .ip2(\B_REG/N10 ), .s(n105), .op(n25) );
  mux2_1 U73 ( .ip1(B[7]), .ip2(\B_REG/N11 ), .s(n105), .op(n24) );
  mux2_1 U74 ( .ip1(B[8]), .ip2(\B_REG/N12 ), .s(n105), .op(n23) );
  mux2_1 U75 ( .ip1(B[9]), .ip2(\B_REG/N13 ), .s(n105), .op(n22) );
  mux2_1 U76 ( .ip1(B[10]), .ip2(\B_REG/N14 ), .s(n105), .op(n21) );
  mux2_1 U77 ( .ip1(B[11]), .ip2(\B_REG/N15 ), .s(n105), .op(n20) );
  mux2_1 U78 ( .ip1(B[12]), .ip2(\B_REG/N16 ), .s(n105), .op(n19) );
  mux2_1 U79 ( .ip1(B[13]), .ip2(\B_REG/N17 ), .s(n103), .op(n18) );
  mux2_1 U80 ( .ip1(B[14]), .ip2(\B_REG/N18 ), .s(n105), .op(n17) );
  mux2_1 U81 ( .ip1(B[15]), .ip2(\B_REG/N19 ), .s(n103), .op(n16) );
  mux2_1 U82 ( .ip1(B[16]), .ip2(\B_REG/N20 ), .s(n105), .op(n15) );
  mux2_1 U83 ( .ip1(B[17]), .ip2(\B_REG/N21 ), .s(n103), .op(n14) );
  mux2_1 U84 ( .ip1(B[18]), .ip2(\B_REG/N22 ), .s(n105), .op(n13) );
  mux2_1 U85 ( .ip1(B[19]), .ip2(\B_REG/N23 ), .s(n103), .op(n12) );
  mux2_1 U86 ( .ip1(B[20]), .ip2(\B_REG/N24 ), .s(n103), .op(n11) );
  mux2_1 U87 ( .ip1(B[21]), .ip2(\B_REG/N25 ), .s(n103), .op(n10) );
  mux2_1 U88 ( .ip1(B[22]), .ip2(\B_REG/N26 ), .s(n103), .op(n9) );
  mux2_1 U89 ( .ip1(B[23]), .ip2(\B_REG/N27 ), .s(n103), .op(n8) );
  mux2_1 U90 ( .ip1(B[24]), .ip2(\B_REG/N28 ), .s(n103), .op(n7) );
  mux2_1 U91 ( .ip1(B[25]), .ip2(\B_REG/N29 ), .s(n103), .op(n6) );
  mux2_1 U92 ( .ip1(B[26]), .ip2(\B_REG/N30 ), .s(n103), .op(n5) );
  mux2_1 U93 ( .ip1(B[27]), .ip2(\B_REG/N31 ), .s(n103), .op(n4) );
  mux2_1 U94 ( .ip1(B[28]), .ip2(\B_REG/N32 ), .s(n103), .op(n3) );
  mux2_1 U95 ( .ip1(B[29]), .ip2(\B_REG/N33 ), .s(n103), .op(n2) );
  mux2_1 U96 ( .ip1(B[30]), .ip2(\B_REG/N34 ), .s(n103), .op(n1) );
  inv_1 U97 ( .ip(reset), .op(n97) );
  inv_1 U98 ( .ip(b_in), .op(n100) );
  inv_1 U100 ( .ip(a_in), .op(n98) );
  nor2_1 U103 ( .ip1(reset), .ip2(n98), .op(n99) );
  and2_1 U104 ( .ip1(n99), .ip2(a[31]), .op(\A_REG/N35 ) );
  and2_1 U105 ( .ip1(n99), .ip2(a[30]), .op(\A_REG/N34 ) );
  and2_1 U106 ( .ip1(n99), .ip2(a[29]), .op(\A_REG/N33 ) );
  and2_1 U107 ( .ip1(n99), .ip2(a[28]), .op(\A_REG/N32 ) );
  and2_1 U108 ( .ip1(n99), .ip2(a[27]), .op(\A_REG/N31 ) );
  and2_1 U109 ( .ip1(n99), .ip2(a[26]), .op(\A_REG/N30 ) );
  and2_1 U110 ( .ip1(n99), .ip2(a[25]), .op(\A_REG/N29 ) );
  and2_1 U111 ( .ip1(n99), .ip2(a[24]), .op(\A_REG/N28 ) );
  and2_1 U112 ( .ip1(n99), .ip2(a[23]), .op(\A_REG/N27 ) );
  and2_1 U113 ( .ip1(n99), .ip2(a[22]), .op(\A_REG/N26 ) );
  and2_1 U114 ( .ip1(n99), .ip2(a[21]), .op(\A_REG/N25 ) );
  and2_1 U115 ( .ip1(n99), .ip2(a[20]), .op(\A_REG/N24 ) );
  and2_1 U116 ( .ip1(n99), .ip2(a[19]), .op(\A_REG/N23 ) );
  and2_1 U117 ( .ip1(n99), .ip2(a[18]), .op(\A_REG/N22 ) );
  and2_1 U118 ( .ip1(n99), .ip2(a[17]), .op(\A_REG/N21 ) );
  and2_1 U119 ( .ip1(n99), .ip2(a[16]), .op(\A_REG/N20 ) );
  and2_1 U120 ( .ip1(n99), .ip2(a[15]), .op(\A_REG/N19 ) );
  and2_1 U121 ( .ip1(n99), .ip2(a[14]), .op(\A_REG/N18 ) );
  and2_1 U122 ( .ip1(n99), .ip2(a[13]), .op(\A_REG/N17 ) );
  and2_1 U123 ( .ip1(n99), .ip2(a[12]), .op(\A_REG/N16 ) );
  and2_1 U124 ( .ip1(n99), .ip2(a[11]), .op(\A_REG/N15 ) );
  and2_1 U125 ( .ip1(n99), .ip2(a[10]), .op(\A_REG/N14 ) );
  and2_1 U126 ( .ip1(n99), .ip2(a[9]), .op(\A_REG/N13 ) );
  and2_1 U127 ( .ip1(n99), .ip2(a[8]), .op(\A_REG/N12 ) );
  and2_1 U128 ( .ip1(n99), .ip2(a[7]), .op(\A_REG/N11 ) );
  and2_1 U129 ( .ip1(n99), .ip2(a[6]), .op(\A_REG/N10 ) );
  and2_1 U130 ( .ip1(n99), .ip2(a[5]), .op(\A_REG/N9 ) );
  and2_1 U131 ( .ip1(n99), .ip2(a[4]), .op(\A_REG/N8 ) );
  and2_1 U132 ( .ip1(n99), .ip2(a[3]), .op(\A_REG/N7 ) );
  and2_1 U133 ( .ip1(n99), .ip2(a[2]), .op(\A_REG/N6 ) );
  and2_1 U134 ( .ip1(n99), .ip2(a[1]), .op(\A_REG/N5 ) );
  and2_1 U135 ( .ip1(n99), .ip2(a[0]), .op(\A_REG/N4 ) );
  nor2_1 U136 ( .ip1(reset), .ip2(n100), .op(n101) );
  and2_1 U137 ( .ip1(n101), .ip2(b[31]), .op(\B_REG/N35 ) );
  and2_1 U138 ( .ip1(n101), .ip2(b[30]), .op(\B_REG/N34 ) );
  and2_1 U139 ( .ip1(n101), .ip2(b[29]), .op(\B_REG/N33 ) );
  and2_1 U140 ( .ip1(n101), .ip2(b[28]), .op(\B_REG/N32 ) );
  and2_1 U141 ( .ip1(n101), .ip2(b[27]), .op(\B_REG/N31 ) );
  and2_1 U142 ( .ip1(n101), .ip2(b[26]), .op(\B_REG/N30 ) );
  and2_1 U143 ( .ip1(n101), .ip2(b[25]), .op(\B_REG/N29 ) );
  and2_1 U144 ( .ip1(n101), .ip2(b[24]), .op(\B_REG/N28 ) );
  and2_1 U145 ( .ip1(n101), .ip2(b[23]), .op(\B_REG/N27 ) );
  and2_1 U146 ( .ip1(n101), .ip2(b[22]), .op(\B_REG/N26 ) );
  and2_1 U147 ( .ip1(n101), .ip2(b[21]), .op(\B_REG/N25 ) );
  and2_1 U148 ( .ip1(n101), .ip2(b[20]), .op(\B_REG/N24 ) );
  and2_1 U149 ( .ip1(n101), .ip2(b[19]), .op(\B_REG/N23 ) );
  and2_1 U150 ( .ip1(n101), .ip2(b[18]), .op(\B_REG/N22 ) );
  and2_1 U151 ( .ip1(n101), .ip2(b[17]), .op(\B_REG/N21 ) );
  and2_1 U152 ( .ip1(n101), .ip2(b[16]), .op(\B_REG/N20 ) );
  and2_1 U153 ( .ip1(n101), .ip2(b[15]), .op(\B_REG/N19 ) );
  and2_1 U154 ( .ip1(n101), .ip2(b[14]), .op(\B_REG/N18 ) );
  and2_1 U155 ( .ip1(n101), .ip2(b[13]), .op(\B_REG/N17 ) );
  and2_1 U156 ( .ip1(n101), .ip2(b[12]), .op(\B_REG/N16 ) );
  and2_1 U157 ( .ip1(n101), .ip2(b[11]), .op(\B_REG/N15 ) );
  and2_1 U158 ( .ip1(n101), .ip2(b[10]), .op(\B_REG/N14 ) );
  and2_1 U159 ( .ip1(n101), .ip2(b[9]), .op(\B_REG/N13 ) );
  and2_1 U160 ( .ip1(n101), .ip2(b[8]), .op(\B_REG/N12 ) );
  and2_1 U161 ( .ip1(n101), .ip2(b[7]), .op(\B_REG/N11 ) );
  and2_1 U162 ( .ip1(n101), .ip2(b[6]), .op(\B_REG/N10 ) );
  and2_1 U163 ( .ip1(n101), .ip2(b[5]), .op(\B_REG/N9 ) );
  and2_1 U164 ( .ip1(n101), .ip2(b[4]), .op(\B_REG/N8 ) );
  and2_1 U165 ( .ip1(n101), .ip2(b[3]), .op(\B_REG/N7 ) );
  and2_1 U166 ( .ip1(n101), .ip2(b[2]), .op(\B_REG/N6 ) );
  and2_1 U167 ( .ip1(n101), .ip2(b[1]), .op(\B_REG/N5 ) );
  and2_1 U168 ( .ip1(n101), .ip2(b[0]), .op(\B_REG/N4 ) );
  fulladder \intadd_0/U31  ( .a(PRODUCT[1]), .b(ps[1]), .ci(\add_x_1/n32 ), 
        .co(\intadd_0/n30 ), .s(\ADDER/N1 ) );
  fulladder \intadd_0/U30  ( .a(PRODUCT[2]), .b(ps[2]), .ci(\intadd_0/n30 ), 
        .co(\intadd_0/n29 ), .s(\ADDER/N2 ) );
  fulladder \intadd_0/U29  ( .a(PRODUCT[3]), .b(ps[3]), .ci(\intadd_0/n29 ), 
        .co(\intadd_0/n28 ), .s(\ADDER/N3 ) );
  fulladder \intadd_0/U28  ( .a(PRODUCT[4]), .b(ps[4]), .ci(\intadd_0/n28 ), 
        .co(\intadd_0/n27 ), .s(\ADDER/N4 ) );
  fulladder \intadd_0/U27  ( .a(PRODUCT[5]), .b(ps[5]), .ci(\intadd_0/n27 ), 
        .co(\intadd_0/n26 ), .s(\ADDER/N5 ) );
  fulladder \intadd_0/U26  ( .a(PRODUCT[6]), .b(ps[6]), .ci(\intadd_0/n26 ), 
        .co(\intadd_0/n25 ), .s(\ADDER/N6 ) );
  fulladder \intadd_0/U25  ( .a(PRODUCT[7]), .b(ps[7]), .ci(\intadd_0/n25 ), 
        .co(\intadd_0/n24 ), .s(\ADDER/N7 ) );
  fulladder \intadd_0/U24  ( .a(PRODUCT[8]), .b(ps[8]), .ci(\intadd_0/n24 ), 
        .co(\intadd_0/n23 ), .s(\ADDER/N8 ) );
  fulladder \intadd_0/U23  ( .a(PRODUCT[9]), .b(ps[9]), .ci(\intadd_0/n23 ), 
        .co(\intadd_0/n22 ), .s(\ADDER/N9 ) );
  fulladder \intadd_0/U22  ( .a(PRODUCT[10]), .b(ps[10]), .ci(\intadd_0/n22 ), 
        .co(\intadd_0/n21 ), .s(\ADDER/N10 ) );
  fulladder \intadd_0/U21  ( .a(PRODUCT[11]), .b(ps[11]), .ci(\intadd_0/n21 ), 
        .co(\intadd_0/n20 ), .s(\ADDER/N11 ) );
  fulladder \intadd_0/U20  ( .a(PRODUCT[12]), .b(ps[12]), .ci(\intadd_0/n20 ), 
        .co(\intadd_0/n19 ), .s(\ADDER/N12 ) );
  fulladder \intadd_0/U19  ( .a(PRODUCT[13]), .b(ps[13]), .ci(\intadd_0/n19 ), 
        .co(\intadd_0/n18 ), .s(\ADDER/N13 ) );
  fulladder \intadd_0/U18  ( .a(PRODUCT[14]), .b(ps[14]), .ci(\intadd_0/n18 ), 
        .co(\intadd_0/n17 ), .s(\ADDER/N14 ) );
  fulladder \intadd_0/U17  ( .a(PRODUCT[15]), .b(ps[15]), .ci(\intadd_0/n17 ), 
        .co(\intadd_0/n16 ), .s(\ADDER/N15 ) );
  fulladder \intadd_0/U16  ( .a(PRODUCT[16]), .b(ps[16]), .ci(\intadd_0/n16 ), 
        .co(\intadd_0/n15 ), .s(\ADDER/N16 ) );
  fulladder \intadd_0/U15  ( .a(PRODUCT[17]), .b(ps[17]), .ci(\intadd_0/n15 ), 
        .co(\intadd_0/n14 ), .s(\ADDER/N17 ) );
  fulladder \intadd_0/U14  ( .a(PRODUCT[18]), .b(ps[18]), .ci(\intadd_0/n14 ), 
        .co(\intadd_0/n13 ), .s(\ADDER/N18 ) );
  fulladder \intadd_0/U13  ( .a(PRODUCT[19]), .b(ps[19]), .ci(\intadd_0/n13 ), 
        .co(\intadd_0/n12 ), .s(\ADDER/N19 ) );
  fulladder \intadd_0/U12  ( .a(PRODUCT[20]), .b(ps[20]), .ci(\intadd_0/n12 ), 
        .co(\intadd_0/n11 ), .s(\ADDER/N20 ) );
  fulladder \intadd_0/U11  ( .a(PRODUCT[21]), .b(ps[21]), .ci(\intadd_0/n11 ), 
        .co(\intadd_0/n10 ), .s(\ADDER/N21 ) );
  fulladder \intadd_0/U10  ( .a(PRODUCT[22]), .b(ps[22]), .ci(\intadd_0/n10 ), 
        .co(\intadd_0/n9 ), .s(\ADDER/N22 ) );
  fulladder \intadd_0/U9  ( .a(PRODUCT[23]), .b(ps[23]), .ci(\intadd_0/n9 ), 
        .co(\intadd_0/n8 ), .s(\ADDER/N23 ) );
  fulladder \intadd_0/U8  ( .a(PRODUCT[24]), .b(ps[24]), .ci(\intadd_0/n8 ), 
        .co(\intadd_0/n7 ), .s(\ADDER/N24 ) );
  fulladder \intadd_0/U7  ( .a(PRODUCT[25]), .b(ps[25]), .ci(\intadd_0/n7 ), 
        .co(\intadd_0/n6 ), .s(\ADDER/N25 ) );
  fulladder \intadd_0/U6  ( .a(PRODUCT[26]), .b(ps[26]), .ci(\intadd_0/n6 ), 
        .co(\intadd_0/n5 ), .s(\ADDER/N26 ) );
  fulladder \intadd_0/U5  ( .a(PRODUCT[27]), .b(ps[27]), .ci(\intadd_0/n5 ), 
        .co(\intadd_0/n4 ), .s(\ADDER/N27 ) );
  fulladder \intadd_0/U4  ( .a(PRODUCT[28]), .b(ps[28]), .ci(\intadd_0/n4 ), 
        .co(\intadd_0/n3 ), .s(\ADDER/N28 ) );
  fulladder \intadd_0/U3  ( .a(PRODUCT[29]), .b(ps[29]), .ci(\intadd_0/n3 ), 
        .co(\intadd_0/n2 ), .s(\ADDER/N29 ) );
  fulladder \intadd_0/U2  ( .a(PRODUCT[30]), .b(ps[30]), .ci(\intadd_0/n2 ), 
        .co(\intadd_0/n1 ), .s(\ADDER/N30 ) );
  nand2_1 U169 ( .ip1(n97), .ip2(n100), .op(n103) );
  buf_1 U170 ( .ip(n103), .op(n105) );
  nand2_1 U171 ( .ip1(n97), .ip2(n98), .op(n104) );
  buf_1 U172 ( .ip(n104), .op(n106) );
  xor2_1 U173 ( .ip1(PRODUCT[0]), .ip2(ps[0]), .op(\ADDER/N0 ) );
  xor2_1 U174 ( .ip1(PRODUCT[31]), .ip2(\intadd_0/n1 ), .op(n107) );
  xor2_1 U175 ( .ip1(ps[31]), .ip2(n107), .op(\ADDER/N31 ) );
  and2_1 U176 ( .ip1(PRODUCT[0]), .ip2(ps[0]), .op(\add_x_1/n32 ) );
endmodule

