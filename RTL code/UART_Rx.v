module uart_slave(
    input clk,    //clock
    input u_rx,    //input form another uart
    output [7:0]data,  //output to main bus or other module
    input en_rx, //enable signal to Rx UART
    output reg u_rx_done //Rx is done
);

reg [2:0] state_rx;
reg [3:0] count;
reg [7:0] dout;


parameter IDLE = 3'b000;
parameter START = 3'b001;
parameter DATA = 3'b010;
parameter PARITY = 3'b011;
parameter DONE = 3'b100;

always @(negedge clk ) begin
    
    case (state_rx)
    IDLE: begin
        if (en_rx) begin
            count <= 0;
            u_rx_done <= 0;
        end
        else begin
            state_rx <= IDLE;
        end

        if (u_rx == 0) begin
            state_rx <= DATA;
        end
        else begin
                state_rx <= IDLE;
        end

    end

    DATA: begin
        dout[count] <= u_rx;
        if (count == 3'b111) begin
            state_rx <= PARITY;
        end
        else begin
            state_rx <= DATA;
            count <= count + 1;
        end
    end

    PARITY: begin
        if (u_rx == ^dout) begin
            state_rx <= DONE;
          	 u_rx_done <= 1;
        end
        else begin
            state_rx <= IDLE;
        end
    end

    DONE: begin
        state_rx <= IDLE;
    end

    default: begin
        state_rx <= IDLE;
    end

    endcase
end

assign data = ((state_rx == DONE)&(en_rx)) ? dout : 8'bzzzzzzzz;

endmodule