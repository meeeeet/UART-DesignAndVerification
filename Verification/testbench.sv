`include "test.sv"
`include "interface.sv"
`include "UART_Tx.v"
`include "UART_Rx.v"

module top;

bit clk;
bit en_tx, en_rx;
wire serial_line;

uart_intf intf(clk, en_tx, en_rx);


uart_master master(
    .clk(intf.clk),
    .en_tx(en_tx),
    // .en_rx(en_rx),
    .data(intf.data_tx),
    .u_tx(serial_line)
    .u_tx_done(intf.tx_done)
);

uart_slave slave(
    .clk(intf.clk),
    // .en_tx(en_tx),
    .en_rx(en_rx),
    .data(intf.data_rx),
    .u_rx(serial_line),
    .u_rx_done(intf.rx_done)
);


test t1(intf);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
end

endmodule