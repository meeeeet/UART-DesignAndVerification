`include "test.sv"
`include "interface.sv"
`include "UART_Tx.v"
`include "UART_Rx.v"

module top;

bit clk;
bit en_tx, en_rx;
wire serial_line;

uart_intf uart_intf(clk, en_tx, en_rx);


uart_master master(
    .clk(uart_intf.clk),
    .en_tx(en_tx),
    // .en_rx(en_rx),
    .data(uart_intf.data_tx),
    .u_tx(serial_line)
    .u_tx_done(uart_intf.tx_done)
);

uart_slave slave(
    .clk(uart_intf.clk),
    // .en_tx(en_tx),
    .en_rx(en_rx),
    .data(uart_intf.data_rx),
    .u_rx(serial_line),
    .u_rx_done(uart_intf.rx_done)
);


test t1(uart_intf);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
end

endmodule