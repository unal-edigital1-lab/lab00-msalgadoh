`timescale 1ns / 1ps

module sum4b_TB;

  // Inputs
  reg [3:0] xi; //Almacena 4 bits
  reg [3:0] yi;

  // Outputs
  wire co;
  wire [3:0] zi;

  // Instantiate the Unit Under Test (UUT)
  sum4b uut (
    .xi(xi), 
    .yi(yi), 
    .co(co), 
    .zi(zi)
  );

  initial begin
  // Initialize Inputs
    xi=0;
  for (yi = 0; yi < 16; yi = yi + 1) begin //Loop
	if (yi==0)
	xi=xi+1;
	 #5 $display("el valor de %d + %d = %d", xi,yi,zi) ;//Imprime entradas y salida en decimal con un ciclo de reloj
    end
  end      


initial begin: TEST_CASE
     $dumpfile("sum4b_TB.vcd");
     $dumpvars(-1, uut);
     #(1280) $finish;
   end

endmodule

