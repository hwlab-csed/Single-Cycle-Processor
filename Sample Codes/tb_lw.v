//addi $2,$0,100  //initialise $2=550
//sw $2,30($0)    //initialise $3=550
//lw $3,30($0)    //$4=$2+$3, $4=550-550=0
//sw $3,20($0)    //write address 50=0

 // Machine code
 //  20020226
 //  20030226
 //  00432022
 //  ac04003

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
			if (dataadr === 20 & writedata === 100) begin
				$display ("Simulation succeeded");
				$stop;
			end else if (dataadr !== 30) begin
				$display ("Failed hehe %h and %h",writedata,dataadr);
				$stop;
			end
		end
	end
endmodule
