`include "environment.sv"
program test_main(uart_intf intf);
    
environment env;

initial begin
    env=new(intf);
    env.gen.no_of_tr=10;
    env.run();
end

endprogram