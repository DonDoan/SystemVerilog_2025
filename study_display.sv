module tb;
  reg [7:0] data_bus;
  integer   counter;
  reg       clk;

  initial begin
    clk = 0;
    forever #5 clk = ~clk; // Generate a clock with a 10ns period
  end

  initial begin
    data_bus = 8'hAA;
    counter  = 0;

    // Displaying a simple string
    $display("--------- Simulation Started ---------");

    // Displaying variables with different formats
    $display("At time %t, the data bus value is: ", $time);
    $display("  Decimal: %0d", data_bus);
    $display("  Hexadecimal: %0h", data_bus);
    $display("  Binary: %b", data_bus);

    // Using it in a loop
    repeat (5) begin
      @(posedge clk); // Wait for the positive edge of the clock
      counter = counter + 1;
      $display("Time: %t | Counter value: %d", $time, counter);
    end

    $display("--------- Simulation Ended ---------");
    $finish; // Terminate the simulation
  end
endmodule
