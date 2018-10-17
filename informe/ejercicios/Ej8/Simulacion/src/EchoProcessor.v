
module EchoProcessor(Clk,echo,t_s,result);
input Clk, echo,t_s;
output wire[7:0] result;
wire aux_clk;
and(aux_clk,Clk,echo);
counter ingeniero(result,aux_clk,t_s);


endmodule
