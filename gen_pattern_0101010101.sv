// Direct Assignment (Fixed Pattern)
// For a fixed, non-random 10-bit value, the simplest method is to assign it directly using a binary literal:

module pattern_generator;
  initial begin
    // Assign the 10-bit pattern directly
    bit [9:0] my_pattern = 10'b0101010101; 
    $display("Generated fixed pattern: %b", my_pattern);
  end
endmodule


// Randomization with Constraints (Constrained-Random Pattern)
// If the requirement is to generate this specific pattern using the SystemVerilog randomization mechanism (e.g., as part of a larger testbench that might eventually vary the pattern),
// you can define a class with a rand variable and a constraint to enforce alternating bits. 
// The constraint ensures that each bit is different from the previous one. This can result in either 0101... or 1010... patterns. You may need an additional constraint if only the 0101... sequence is desired
class AlternatingPattern;
  // Declare a 10-bit random variable
  rand bit [9:0] my_pattern;

  // Constraint to ensure adjacent bits are never equal (alternating pattern)
  constraint C_alt {
    foreach(my_pattern[i]) begin
      if (i > 0) 
        my_pattern[i] != my_pattern[i-1];
    end
    // Optional constraint to force the pattern to start with '0'
    my_pattern[9] == 0; 
  }
endclass

module top;
  initial begin
    AlternatingPattern t = new();
    if (t.randomize()) begin
      $display("Generated random alternating pattern: %b", t.my_pattern);
    end else begin
      $display("Randomization failed.");
    end
  end
endmodule
