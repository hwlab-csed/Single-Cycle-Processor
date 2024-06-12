//Module for instruction memory from external .txt file
module inst_mem (input [15:0]adr, 
                 output reg [15:0]instr);

   reg [15:0] instr_file [0:63];                               //instr_file stores 64 instructions each of 16 bits
	
	initial begin
	    $display("Opening memfile.txt");
		 $readmemb ("E:/memfile.txt", instr_file, 0, 63);
	end
	
	always @(*) begin                                           //Current insrtuction is given by the address input
        instr = instr_file[adr];       
    end

endmodule

//Module for data memory for load and store instructions
module data_mem (input [15:0]adr, 
                 input [15:0]data_in, 
					  input wr_en, read_en, Clock, 
					  output reg [15:0]data_out);

   reg [15:0] RAM [63:0];
	
	always@(*) begin
	   if (wr_en) begin                                         //If wr_en is enabled, data needs to be written into the memory
		   if (adr < 64) begin                                   //Ensuring that the adress lies within the bounds of RAM
		      RAM[adr] <= data_in;
			end
		end
		
		else if (read_en) begin                                  //If read_en is enabled, data needs to be read from memory
		   if (adr < 64) begin
			      data_out <= RAM[adr];
				end
			else
			   data_out <= 16'b0;
		end
		
	end
endmodule

//Main module for the MIPS processor
module B220070CS_VAISHNAVI_1 (input Clock); 

   reg [15:0] reg_file [6:0];                                  //Register file for registers Reg 0 to Reg 6  
   reg [15:0] PC;                                              //Reg7 = Program Counter for fetching instructions	
	reg [2:0] Ra, Rb, Rc;                                       //3 bits to get address of registers
	reg [15:0] Immd, Offset, mem_adr;
	
	wire [15:0] Inst;                                           //Current instruction being executed
	wire [15:0] load_data;                                      //In case of store memory, itcontains the value that needs to be written into register
	reg wr_en, read_en;
	
	initial begin                                               //Initializing the values of registers in the register file
        reg_file[0] = 16'd1;
        reg_file[1] = 16'd2;
        reg_file[2] = 16'd3;
        reg_file[3] = 16'd4;
        reg_file[4] = 16'd5;
        reg_file[5] = 16'd6;
        reg_file[6] = 16'd7;
        PC = 16'd0;
    end
	 
	 inst_mem fetch_inst (.adr(PC),
                         .instr(Inst)); 
	 
	 data_mem load_store (.adr(mem_adr), 
	                      .data_in(reg_file[Ra]),
								 .wr_en(wr_en),
								 .read_en(read_en),
								 .Clock(Clock),
								 .data_out(load_data));
						  
	
	always@(posedge Clock) begin
		   Ra = Inst[11:9];                                      //In all operations, RegA is given by bits 11 to 9
			wr_en = 1'b0;
			read_en = 1'b0;
			
		   case (Inst[15:12])
			   4'b0000: begin                                     //ADD operation
						      Rb = Inst[8:6];
						      Rc = Inst[5:3];
						      reg_file[Rc] = reg_file[Ra] + reg_file[Rb];
						      //Inst[1:0] = 2'b11;
								PC = PC + 16'b1;
						   end
						 
				4'b0010: begin                                     //NAND operation
						      Rb = Inst[8:6];
						      Rc = Inst[5:3];
								reg_file[Rc] = ~(reg_file[Ra] & reg_file[Rb]);
								PC = PC + 16'b1;
							end
							
				4'b0100: begin                                     //LW operation
								read_en = 1'b1;
								Rb = Inst[8:6];
								Immd = {10'b0, Inst[5:0]};
								mem_adr = reg_file[Rb] + Immd;
								PC = PC + 16'b1;
								reg_file[Ra] = load_data;              //Reg A will be loaded with the value fetched from memory
							end
							
				4'b0101: begin                                     //SW operation
				            wr_en = 1'b1;
								Rb = Inst[8:6];
								Immd = {10'b0, Inst[5:0]};             //Sign-extending the immediate to be added with content of reg B
								mem_adr = reg_file[Rb] + Immd;
								PC = PC + 16'b1;
							end
				            
								
				4'b1100: begin                                     //BEQ operation
								Rb = Inst[8:6];
								if (reg_file[Ra] == reg_file[Rb]) begin
								   Immd = {10'b0, Inst[5:0]};          //Sign-extending the immediate to be added with PC
									PC = PC + Immd;                     //Shifting the PC to the new address
							   end
							end
								  
				4'b1000: begin                                     //JAL operation
							   Offset = {7'b0, Inst[8:0]};            //Sign-extending the offset from 9 to 16 bits
								reg_file[Ra] = PC + 16'd1;             //PC + 1 will be stored in reg A
							   PC = PC + Offset;
						   end
				
			endcase
    end
endmodule
