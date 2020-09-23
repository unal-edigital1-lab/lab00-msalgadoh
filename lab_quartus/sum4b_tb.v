`timescale  1ns / 1ps

module sum4b_tb;

	//Registros que almacenan entradas
	reg [3:0] Ai; 
	reg [3:0] Bi;
	
	//Conectores
	wire co;
	wire [3:0] zi;

  //Funcion para instanciar el sumador 4 bits
  sum4b uut (.Ai(Ai), .Bi(Bi), .co(co), .zi(zi));

  initial begin
    Ai=0;
	 //Loop para recorrer todas las opciones
		for (Bi = 0; Bi < 16; Bi = Bi + 1) begin 
			if (Bi==0)
			Ai=Ai+1;
			
	//Imprime entradas y salida en decimal cada 8 ciclos de reloj
	 #6 $display("el valor de %d + %d  = %d", Ai,Bi,zi) ;
		end
  end      


initial begin: TEST_CASE
     $dumpfile("sum4b_tb.vcd");
     $dumpvars(-1, uut);
     #(1280) $finish;
   end

endmodule 