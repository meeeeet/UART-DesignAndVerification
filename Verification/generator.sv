`include "interface.sv"

class trans;

    rand bit [7:0]data_tx;
    bit [7:0]data_rx;

    function void display(string str);
        $display("[%s]  Tx data = %b   Rx data= %b",str,data_tx,data_rx);
    endfunction


endclass //trans

class generator;

    rand trans tr;
    mailbox gen2drive;
    int no_of_tr;
    // virtual uart_intf vif;

    function new(mailbox gen2drive);
        this.gen2drive = gen2drive;
    endfunction

    task main();
        repeat(no_of_tr) begin
            tr = new();
            tr.randomize();
            gen2drive.put(tr);
            // tr.display("generator");
        end
    endtask
endclass