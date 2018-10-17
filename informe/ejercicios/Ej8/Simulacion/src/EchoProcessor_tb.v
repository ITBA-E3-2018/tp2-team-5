//Testbench que simula el procesamiento de la
//medicion obtenida mediante el HC SR04
`timescale 10us / 10us
module EchoProcessor_tb;
wire[7:0] medicion;
reg echo;
reg trigger;
EchoProcessor inst(clk,echo,trigger,medicion);
clock_gen clk_gen(clk);
wire clk;
initial begin
    trigger=0;
    echo=0;
    #1  
    trigger=1;
    echo=0;
    #1
    trigger=0;
    echo=1;
    #100
    trigger=0;
    echo=0;
    #1
    trigger=1;
    echo=0;
    #1
    trigger=0;
    echo=1;
    #80
    trigger=0;
    echo=0;

    $finish;

end

reg dummy;
  reg[8*64:0] dumpfile_path = "output.vcd";

  initial begin
    dummy = $value$plusargs("VCD_PATH=%s", dumpfile_path);
    $dumpfile(dumpfile_path);
    $dumpvars(0,EchoProcessor_tb);
  end


endmodule
