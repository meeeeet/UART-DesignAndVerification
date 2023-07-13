interface uart_intf(input clk,en_rx,en_tx);
    
    // logic clk;
    logic [7:0]data_rx;
    logic [7:0]data_tx;
    logic u_tx;
    // logic tx_en;
    // logic rx_en;
    logic tx_done;
    logic rx_done;

    // modport master (
    // input clk, data_tx, tx_en, 
    // output u_tx, tx_done
    // );

    // modport slave (
    // input clk, u_rx, rx_en,
    // output data_rx, rx_done
    // );

endinterface //uart_intf
