// systemVerilog: Generate the pattern 9 19 29 39 49 59 69 79
// Direct Assignment (Fixed Pattern)
// For a simple, fixed sequence of numbers, assign the values directly to an unpacked array within an initial block: 
// systemverilog
module pattern_assign;
  initial begin
    // Declare an 8-element unpacked array of integers
    int my_pattern[8];

    // Assign the specific sequence of values using an array literal
    my_pattern = '{9, 19, 29, 39, 49, 59, 69, 79};

    // Display the resulting array
    $display("Generated fixed pattern: %p", my_pattern);
  end
endmodule

// Randomization with Constraints (Constrained-Random Pattern)
// In a testbench environment using constrained randomization, you can define a class with a rand dynamic array and constraints that enforce the specific arithmetic progression. 
// This approach uses a foreach loop to define the value of each element based on its index
class ArithmeticPattern;
  // Declare an 8-element random integer array (dynamic array)
  rand int a[];

  // Constraints to define the array size and the pattern
  constraint size {
    a.size() == 8;
  }
  
  constraint more {
    foreach (a[i]) begin
      // Formula: a[i] = (i * 10) + 9
      a[i] == (i * 10) + 9;
    end
  }

  function void post_randomize();
    $display("Generated constrained pattern: %p", a);
  endfunction
endclass

module tb;
  initial begin
    ArithmeticPattern pkt;
    pkt = new();
    if (!pkt.randomize()) begin
      $display("Randomization failed.");
    end
  end
endmodule
