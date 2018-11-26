module square_box(input wire a,b, output wire p,g);
	or2 o1(a,b,p);
	and2 a2(a,b,g);
endmodule

module black_box(input wire p0,p1,g0,g1, output wire p2,g2);
	wire temp;
	and2 a3(p0,p1,p2);
	and2 a4(p0,g1,temp);
	or2 o2(temp,g0,g2);
endmodule

module round_box(input wire g0,a,b, output wire s);
	wire temp;
	xor2 x1(a,b,temp);
	xor2 x2(temp,g0,s);
endmodule

module mux2_16(input wire [15:0]i0,i1,input wire j,output wire [15:0]o);
    assign o= (j==0)?i0:i1;
endmodule

module prefix(input wire[15:0] a,b, input wire cin, output wire[15:0] o);
	wire p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,g0,g1,g2,g3,g4,g5,g6,g7,g8,g9,g10,g11,g12,g13,g14,g15;
	wire p0x,p1x,p2x,p3x,p4x,p5x,p6x,p7x,p8x,p9x,p10x,p11x,p12x,p13x,p14x,g0x,g1x,g2x,g3x,g4x,g5x,g6x,g7x,g8x,g9x,g10x,g11x,g12x,g13x,g14x;
	wire p21,p43,p65,p87,p109,p1211,p1413,g21,g43,g65,g87,g109,g1211,g1413;
	wire p53,p63,p97,p107,p1311,p1411,g53,g63,g97,g107,g1311,g1411;
	wire p117,p127,p137,p147,g117,g127,g137,g147;
	
	square_box s0(a[0],b[0],p0,g0);
	square_box s1(a[1],b[1],p1,g1);
	square_box s2(a[2],b[2],p2,g2);
	square_box s3(a[3],b[3],p3,g3);
	square_box s4(a[4],b[4],p4,g4);
	square_box s5(a[5],b[5],p5,g5);
	square_box s6(a[6],b[6],p6,g6);
	square_box s7(a[7],b[7],p7,g7);
	square_box s8(a[8],b[8],p8,g8);
	square_box s9(a[9],b[9],p9,g9);
	square_box s10(a[10],b[10],p10,g10);
	square_box s11(a[11],b[11],p11,g11);
	square_box s12(a[12],b[12],p12,g12);
	square_box s13(a[13],b[13],p13,g13);
	square_box s14(a[14],b[14],p14,g14);
	square_box s15(a[15],b[15],p15,g15);

	black_box b0(p0,1'b0,g0,cin,p0x,g0x);
	black_box b1(p2,p1,g2,g1,p21,g21);
	black_box b2(p4,p3,g4,g3,p43,g43);
	black_box b3(p6,p5,g6,g5,p65,g65);
	black_box b4(p8,p7,g8,g7,p87,g87);
	black_box b5(p10,p9,g10,g9,p109,g109);
	black_box b6(p12,p11,g12,g11,p1211,g1211);
	black_box b7(p14,p13,g14,g13,p1413,g1413);

	black_box b8(p1,p0x,g1,g0x,p1x,g1x);
	black_box b9(p21,p0x,g21,g0x,p2x,g2x);
	black_box b10(p5,p43,g5,g43,p53,g53);
	black_box b11(p65,p43,g65,g43,p63,g63);
	black_box b12(p9,p87,g9,g87,p97,g97);
	black_box b13(p109,p87,g109,g87,p107,g107);
	black_box b14(p13,p1211,g13,g1211,p1311,g1311);
	black_box b15(p1413,p1211,g1413,g1211,p1411,g1411);

	black_box b16(p3,p2x,g3,g2x,p3x,g3x);
	black_box b17(p43,p2x,g43,g2x,p4x,g4x);
	black_box b18(p53,p2x,g53,g2x,p5x,g5x);
	black_box b19(p63,p2x,g63,g2x,p6x,g6x);
	black_box b20(p11,p107,g11,g107,p117,g117);
	black_box b21(p1211,p107,g1211,g107,p127,g127);
	black_box b22(p1311,p107,g1311,g107,p137,g137);
	black_box b23(p1411,p107,g1411,g107,p147,g147);

	black_box b24(p7,p6x,g7,g6x,p7x,g7x);
	black_box b25(p87,p6x,g87,g6x,p8x,g8x);
	black_box b26(p97,p6x,g97,g6x,p9x,g9x);
	black_box b27(p107,p6x,g107,g6x,p10x,g10x);
	black_box b28(p117,p6x,g117,g6x,p11x,g11x);
	black_box b29(p127,p6x,g127,g6x,p12x,g12x);
	black_box b30(p137,p6x,g137,g6x,p13x,g13x);
	black_box b31(p147,p6x,g147,g6x,p14x,g14x);

	round_box r0(cin,a[0],b[0],o[0]);
	round_box r1(g0x,a[1],b[1],o[1]);
	round_box r2(g1x,a[2],b[2],o[2]);
	round_box r3(g2x,a[3],b[3],o[3]);
	round_box r4(g3x,a[4],b[4],o[4]);
	round_box r5(g4x,a[5],b[5],o[5]);
	round_box r6(g5x,a[6],b[6],o[6]);
	round_box r7(g6x,a[7],b[7],o[7]);
	round_box r8(g7x,a[8],b[8],o[8]);
	round_box r9(g8x,a[9],b[9],o[9]);
	round_box r10(g9x,a[10],b[10],o[10]);
	round_box r11(g10x,a[11],b[11],o[11]);
	round_box r12(g11x,a[12],b[12],o[12]);
	round_box r13(g12x,a[13],b[13],o[13]);
	round_box r14(g13x,a[14],b[14],o[14]);
	round_box r15(g14x,a[15],b[15],o[15]);
endmodule

module prefixsub(input wire[15:0] a,b,input wire cin, output wire[15:0] o);
    wire [15:0]b1;wire [15:0]b2;
    invert i0(b[0],b1[0]);
    invert i1(b[1],b1[1]);
    invert i2(b[2],b1[2]);
    invert i3(b[3],b1[3]);
    invert i4(b[4],b1[4]);
    invert i5(b[5],b1[5]);
    invert i6(b[6],b1[6]);
    invert i7(b[7],b1[7]);
    invert i8(b[8],b1[8]);
    invert i9(b[9],b1[9]);
    invert i10(b[10],b1[10]);
    invert i11(b[11],b1[11]);
    invert i12(b[12],b1[12]);
    invert i13(b[13],b1[13]);
    invert i14(b[14],b1[14]);
    invert i15(b[15],b1[15]);
    prefix p1(a,b1,cin,o);
endmodule

module prefixaddsub(input wire[15:0] a,b, input wire cin,sel, output wire[15:0] o);
    wire [15:0]o1,o2;
    prefix p2(a,b,cin,o1);
    prefixsub p3(a,b,cin,o2);
    mux2_16 m1(o1,o2,sel,o);
endmodule