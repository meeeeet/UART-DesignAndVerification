`include "driver.v"

class environment;

generator gen;

driver drv;
virtual uart_intf vif;
mailbox gen2drive;

function new(virtual uart_intf vif, mailbox gen2drive);
    this.vif = vif;
    this.gen2drive = gen2drive;
    drv = new(vif, gen2drive);
    gen = new(gen2drive);
endfunction


task test;
    fork
        drv.main();
        gen.main();
    join
endtask

task post_test;
    wait(gen.no_of_tr==drv.no_of_tr_dri);
endtask

task run;
    test();
    post_test();
    $finish;
endtask

endclass