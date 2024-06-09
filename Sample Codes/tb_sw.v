//addi $2,$0,25  //initialise $2 =25
//sw $2, 30($0)  //write address 30 = 25

// Machine code
//  20020019
//  ac02001e

module testbenchv1;
	reg clk;
	reg reset;
	integer i;
	wire [31:0] writedata, dataadr;
	wire memwrite;
	// instantiate device to be tested
	top dut(clk, reset, writedata, dataadr, memwrite);
	
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
		if (memwrite) begin
			if (dataadr === 30 & writedata === 25) begin
				$display ("Simulation succeeded");
				$stop;
			end else if (dataadr !== 80) begin
				$display ("Failed hehe %h and %h",writedata,dataadr);
				$stop;
			end
		end
	end
endmodule
