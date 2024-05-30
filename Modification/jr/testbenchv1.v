//if jal works, you get 12 in address 8
//otherwise you get 16 in address 8

//MIPS CODE
//main:
//0	addi $2, $0, 12
//4	jr $2
//8	addi  $2, $2, 4 
//end:
//12	sw $2, 8($0)
//
//here, the current address of jr is 0004, or in binary, 0100
//we want to be at address 12 i.e 000c after the jump, in binary, 1100

//MACHINE CODE
//2002000C
//00400008
//20420004
//AC020008

module testbenchv1;
	reg clk;
	reg reset;
	integer i;
	wire [31:0] writedata, dataadr;
	wire memwrite;
	// instantiate device to be tested
	SingleCycleV1 dut(clk, reset, writedata, dataadr, memwrite);
	
	// initialize test
	initial
	begin
		reset <= 1; # 22; reset <= 0;
	end
		// generate clock to sequence tests
	always
	begin
		clk <= 1; # 5; clk <= 0; # 5;
	end
		// check results
	always @ (negedge clk)
	begin
		//$display("%h ",pc);
		if (memwrite) begin
			$display("%h %h", writedata,dataadr);
			if (dataadr === 8 & writedata === 12) begin
				$display ("Simulation succeeded");
				$stop;
			end else begin
				$display ("Failed hehe %h and %h",writedata,dataadr);
				$stop;
			end
		end
	end
endmodule