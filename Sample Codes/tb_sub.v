//addi $2,$0, 550  //initialise $2=550
//addi $3,$0, 550  //initialise $3=550 
//sub $4,$2, $3    //$4=$2+$3, $4=550-550=0    
//sw $4, 50($0)    //write address 50=0

// Machine code
//  20020226
//  20030226
//  00432022
//  ac040032

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
			if (dataadr === 50 & writedata === 0) begin
				$display ("Simulation succeeded");
				$stop;
			end else if (dataadr !== 80) begin
				$display ("Failed with %h and %h",writedata,dataadr);
				$stop;
			end
		end
	end
endmodule
