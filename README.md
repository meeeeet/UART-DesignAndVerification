# Design and Verification of UART

- Designed RTL modules of UART transmitter and receiver in Verilog HDL with 8-bit serial data transmission capability.
- Implemented a SystemVerilog-based testbench with driver, environment, generator, and interface components, utilizing constrained 
random test cases to effectively validate the UART functionality.

### Data format:

| data[0] | data[1:8] | data[9] | data[10] |
| --------| ----------| ------- | -------- |
|    0    |  xxxxxxxx |x|     0    | 
| Stop Bit| 8bit Data |Even Parity Bit|Stop bit| 
### I/O:
#### Tx interface:
* `clk` - **[input]** clock
* `en_tx` - **[input]** enable/disable transmitter
* `data[7:0]` - **[input]** data to transmit
* `u_tx` - **[output]** transmitter output
* `u_tx_done` - **[output]** succesfully transmitted

#### Rx interface:
* `clk` - **[input]** clock
* `en_rx` - **[input]** enable/disable receiver
* `u_rx` - **[input]** receiver input 
* `data[7:0]` - **[output]** received data
* `u_rx_done` - **[output]** succesfully received


### Simulation

For simulation of UART visit [EDAplayground](https://edaplayground.com/x/HNSN)
