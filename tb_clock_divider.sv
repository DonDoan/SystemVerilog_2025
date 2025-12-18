module tb_clock_divider;

  // Signals to connect to the DUT
  logic clk;
  logic rst_n;
  logic clk_div2, clk_div4, clk_div8, clk_div16, clk_div32;

  // 1. Instantiate the Design Under Test (DUT)
  clock_divider uut (
      .clk(clk),
      .rst_n(rst_n),
      .clk_div2(clk_div2),
      .clk_div4(clk_div4),
      .clk_div8(clk_div8),
      .clk_div16(clk_div16),
      .clk_div32(clk_div32)
  );

  // 2. Generate Master Clock (e.g., 10ns period = 100MHz)
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Toggle every 5ns for a 10ns period
  end

  // 3. Stimulus Block: Reset and Duration
  initial begin
    // Reset the system at the start
    rst_n = 0;
    #20 rst_n = 1;  // Release reset after 20ns

    // Run simulation for enough time to see div32 toggle
    #1000;

    $display("Simulation finished at time %0t", $time);
    $finish;  // End the simulation
  end

  // 4. Monitoring: Log values to the console whenever they change
  initial begin
    $monitor("Time: %0t | clk_div2: %b | clk_div4: %b | clk_div8: %b", $time, clk_div2, clk_div4,
             clk_div8);
  end

  initial begin
    // Dump waveform data to a VCD file (optional, for viewing waveforms)
    $dumpfile("clock_divider_waveform.vcd");
    $dumpvars(0, tb_clock_divider);
  end

endmodule
