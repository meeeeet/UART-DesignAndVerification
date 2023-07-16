
class driver;

    mailbox gen2drive;
    virtual uart_intf vif;
    int no_of_tr_dri;
//   	trans t1;


    function new(virtual uart_intf vif, mailbox gen2drive);
        this.vif = vif;
        this.gen2drive = gen2drive;
        no_of_tr_dri = 0;
     
    endfunction //new()

  
  

    task main();
      forever
        begin
            transaction t1;
            gen2drive.get(t1);

          	wait(vif.en_tx);
            vif.data_tx = t1.data_tx;
          	
//           @(negedge vif.clk);
          repeat(11) begin
            @(negedge vif.clk);
          end
          
//           	wait(vif.data_tx == vif.data_rx);
            t1.data_rx = vif.data_rx;
          t1.__done=(vif.rx_done);
            t1.display("driver");
            no_of_tr_dri++;
        end

    endtask

endclass //driver