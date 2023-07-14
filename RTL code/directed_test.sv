`include "UART_Tx.v"
`include "UART_Rx.v"

module top();
    
    bit clk; //clock
    bit [7:0]data_tx; //input from main bus or other module
    bit en_tx; //enable signal to Tx UART 
    // logic en_rx,
    // logic u_tx, //output to another uart 
    logic u_tx_done; //Tx is done

    // logic u_rx,    //input form another uart
    logic [7:0]data_rx;  //output to main bus or other module
    bit en_rx; //enable signal to Rx UART
    logic u_rx_done; //Rx is done

    wire tx_rx;

    uart_master u1(
        .clk(clk),
        .data(data_tx),
        .en_tx(en_tx),
        .u_tx(tx_rx),
        .u_tx_done(u_tx_done)
    );

    uart_slave u2(
        .clk(clk),
        .u_rx(tx_rx),
        .en_rx(en_rx),
        .data(data_rx),
        .u_rx_done(u_rx_done)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, top);
    end

initial begin
    fork
        clkgen();
        #15 enable();
        #1 send(8'b 10010101);
    join_any
    // $display("Data received is %b", data_rx);
    #200 $finish;


end

task send;
    input [7:0]data;
    begin
        data_tx = data;
        // wait(u_tx_done);
        $display("Tx is done");
        en_tx = 0;
    end
endtask

task clkgen;
    clk = 0;
    begin
        forever #5 clk = ~clk;
    end
endtask

task enable;
    begin
        en_rx = 1;
        en_tx = 1;
        fork
            begin
                wait(u_tx_done);
                en_tx = 0;
            end
            begin
                wait(u_rx_done);
                en_rx = 0;
            end
        join
    end
endtask

endmodule