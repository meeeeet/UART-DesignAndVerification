

class transaction;

    rand bit [7:0]data_tx;
    bit [7:0]data_rx;
//  	bit [7:0]data_tx;

    function void display(string str);
        $display("[%s]  Tx data = %b   Rx data= %b",str,data_tx,data_rx);
    endfunction
  
  function void put(bit [7:0]data);
    data_tx=data;
  endfunction
    


endclass //trans