// main:
//   addi $2,$0,20  //initialise $2=20   
//   addi $3,$0,30  //initialise $3=30
//   addi $5,$0,0   //initialise $5=0         
//   beq $5,$0,end  //if val($5)==val($0) branch to ‘end’      
//   add $5,$2,$3   //$5=$2+$3          
// end:
//   sw $5, 20($0)  //write address 20 = 0

 // Machine code
 //  20020014
 //  2003001e
 //  20050000
 //  10a00002
 //  00432820
 //  ac050014

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
			if (dataadr === 20 & writedata === 0) begin
				$display ("Simulation succeeded");
				$stop;
			end else if (dataadr !== 80) begin
				$display ("Failed hehe %h and %h",writedata,dataadr);
				$stop;
			end
		end
	end
endmodule

