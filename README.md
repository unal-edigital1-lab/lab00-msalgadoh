# lab01- sumador 
laboratorio 01 introducción a HDL

Maria Alejandra Salgado Herrera

A continuacion se presenta el código y su respectiva explicacion:
 --------------
 
A continuación se definio el modulo sum1bcc, que hara todo el proceso de un sumador de 1 bit, el cual tendra dos entradas(A y B) que corresponden a los numeros que se sumaran y otra entrada Ci que sera el carry que queda de la suma, y como salidas tendremos S y Cout, correspondientes al carry de salida y la suma total, se definen a continuación: 
         
    module sum1bcc (A, B, Ci,Cout,S);
    input  A;
    input  B;
    input  Ci;
    output Cout;
    output S;
    
Se creara un cable de dos bits y tambien asiganaremos a este las salidas que una corresponde al carry que quedara para una proxima suma y el valor que queda de la suma, asi la suma sera el carry que queda Ci y las dos entradas que se tienen

    wire [1:0] st;
    assign S = st[0];
    assign Cout = st[1];

    assign st  = 	A+B+Ci;

---------
A continuacion se define el modulo sum4b, que hara todo el proceso de un sumador de 4 bits, el cual tendra dos entradas(Ai y Bi) que corresponden a los numeros de 4 bits que se sumaran, y como salidas tendremos Co y Zi, se definen a continuación: 
   
    module sum4b(Ai,Bi,co,zi);
	input [3 :0] Ai;
	input [3 :0] Bi;
	output co;
	output [3 :0] zi;
  
Tendremos 3 cables que seran los conectores entre los sumadores sencillos

    wire c1,c2,c3;
Por ultimo se instancian los sumadores de 1 bit, en donde se puede evidenciar que los carrys estan conectados entre si, asi que los carrys de salida seran los carrys de entrada de los sumadores contiguos

	sum1bcc sum0 (.A(Ai[0]), .B(Bi[0]), .Ci(0),  .Cout(c1) ,.S(zi[0]));
	sum1bcc sum1 (.A(Ai[1]), .B(Bi[1]), .Ci(c1), .Cout(c2) ,.S(zi[1]));
	sum1bcc sum2 (.A(Ai[2]), .B(Bi[2]), .Ci(c2), .Cout(c3) ,.S(zi[2]));
	sum1bcc sum3 (.A(Ai[3]), .B(Bi[3]), .Ci(c3), .Cout(co) ,.S(zi[3]));
  ---------
Por ultimo tenemos el modulo testbench para hacer la vuisualizacion de la suma de los numeros que tendremos:
-Se tiene los registros que almacenaran los dos dumeros de entrada y asi mismo los cables que conectaran la salida y el carry:

    module sum4b_tb;
	reg [3:0] Ai; 
	reg [3:0] Bi;
	wire co;
	wire [3:0] zi;

Instanciamos el modulo unit test

    sum4b uut (.Ai(Ai), .Bi(Bi), .co(co), .zi(zi));
Se hace un loop para recorrer todas las opciones de suma entre dos numeros como entrada:

		for (Bi = 0; Bi < 16; Bi = Bi + 1) begin 
			if (Bi==0)
			Ai=Ai+1;
Por ultimo se imprimen las entradas y salida en forma decimal para visualizarlo mejor de cada 8 ciclos de reloj:
	
	 #6 $display("el valor de %d + %d  = %d", Ai,Bi,zi) ;
     
