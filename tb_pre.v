module tbpre;
	reg cin,sel;
	reg[15:0] a,b;
	wire[15:0] o;
	prefixaddsub p1(a,b,cin,sel,o);

	initial begin
	$dumpfile ("tbpre.vcd");
	$dumpvars (0, tbpre);
	end
	
	initial begin
		
	a = 16'b1010101010101010;
    b = 16'b0101010101010101;
    cin=1'b0;sel=1'b0;
	#5;
    a = 16'b0000000000101110;
    b = 16'b0000000001001111;
    cin = 1'b0;sel= 1'b0;
    #5;
	a=16'b0000000000000010;
	b=16'b0000000000000100;
	cin=1'b0;sel=1'b0;
	#5;	
	a = 16'b1010101010101010;
    b = 16'b0101010101010101;
    cin=1'b1;sel=1'b1;
	#5;
    a = 16'b0000000000101110;
    b = 16'b0000000001001111;
    cin = 1'b1;sel= 1'b1;
    #5;
	a=16'b0000000000000010;
	b=16'b0000000000000100;
	cin=1'b1;sel=1'b1;

	end
    initial
    begin
        $monitor("a = %d, b = %d, cin = %d, o = %d",a,b,cin,o);
    end

endmodule