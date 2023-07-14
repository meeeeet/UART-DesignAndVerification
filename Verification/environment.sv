`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"

class environment;

generator gen;

driver drv;
virtual uart_intf vif;
mailbox gen2drive;

function new(virtual uart_intf vif);
    this.vif = vif;
//     this.gen2drive = gen2drive;
  gen2drive=new();
    drv = new(vif, gen2drive);
    gen = new(gen2drive);
endfunction


task test;
    fork
      	gen.main();
        drv.main();
    join
endtask



task run;
    test();
  	$finish;
endtask

endclass