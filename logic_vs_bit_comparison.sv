module tb_data_types();
    // 1. Declare signals for internal testbench monitoring
    logic reset;
    logic l_val;
    bit   b_val;

    // 2. Stimulus Block: Controls the flow of the test
    initial begin
        // Time 0: Initial values (logic will be X, bit will be 0)
        $display("[%0t] Time 0: Initial state of logic=%b, bit=%b", $time, l_val, b_val);

        #10; // Wait 10 time units
        reset = 1'b1; // Simulate a reset event
        l_val = 1'b0; // Drive logic to a known state
        b_val = 1'b0; 
        $display("[%0t] Reset active: logic=%b, bit=%b", $time, l_val, b_val);

        #20;
        l_val = 1'b1; // Change values to verify they both toggle
        b_val = 1'b1;
        $display("[%0t] Data changed: logic=%b, bit=%b", $time, l_val, b_val);
        
        #10;
        $finish; // End the simulation
    end

    // 3. Monitor Block: Automatically prints values when they change
    initial begin
        $monitor("[%0t] MONITOR: logic=%b, bit=%b", $time, l_val, b_val);
    end
  
  	// dump waveform
  	initial begin
  	$dumpfile("dump.vcd"); $dumpvars;
    end
  
