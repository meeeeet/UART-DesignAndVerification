

class transaction;

    randc bit [7:0]data_tx;
    bit [7:0]data_rx;
  bit __done;
//  	bit [7:0]data_tx;

    function void display(string str);
      $display("[%s]  Status = %b Tx data = %b   Rx data= %b",str,__done,data_tx,data_rx);
    endfunction
  
  function void put(bit [7:0]data);
    data_tx=data;
  endfunction
    


endclass //trans