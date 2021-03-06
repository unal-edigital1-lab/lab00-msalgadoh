module sum4b(Ai,Bi,co,zi);

	//Registros de entrada y salida
	input [3 :0] Ai;
	input [3 :0] Bi;
	output co;
	output [3 :0] zi;
	
	//Conectores entre sumadores
	wire c1,c2,c3;
	
	//Instanciar modulos de sumadores de 1 bit
	sum1bcc sum0 (.A(Ai[0]), .B(Bi[0]), .Ci(0),  .Cout(c1) ,.S(zi[0]));
	sum1bcc sum1 (.A(Ai[1]), .B(Bi[1]), .Ci(c1), .Cout(c2) ,.S(zi[1]));
	sum1bcc sum2 (.A(Ai[2]), .B(Bi[2]), .Ci(c2), .Cout(c3) ,.S(zi[2]));
	sum1bcc sum3 (.A(Ai[3]), .B(Bi[3]), .Ci(c3), .Cout(co) ,.S(zi[3]));
	
endmodule 