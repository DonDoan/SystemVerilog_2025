// Direct Assignment (Fixed Pattern)
// For a fixed value used in a testbench or simple model, you can directly assign an array literal to an unpacked array variable.

module pattern_assign;
  initial begin
    // Declare a 10-element unpacked array of bytes
    byte my_pattern[10];

    // Assign the specific sequence of values
    my_pattern = '{1, 2, 3, 4, 5, 5, 4, 3, 2, 1};

    // Display the resulting array
    $display("Generated fixed pattern: %p", my_pattern);
  end
endmodule


// Randomization with Constraints (Constrained-Random Pattern)
// In a verification environment using constrained randomization, you would define a class with a rand array and constraints that enforce the specific sequence. 
// This approach is more flexible if you plan to extend the constraints later.
// The constraints use the foreach loop to iterate through the array indices and assign values based on their position (first half increments, second half decrements after the midpoint).

class PalindromicPattern;
  // Declare a 10-element random integer array
  rand int a[10];

  // Constraints to define the pattern
  constraint y {
    foreach(a[i]) 
      if (i < 5) 
        a[i] == i + 1; 
      else 
        a[i] == 10 - i; 
  }
endclass

module top;
  initial begin
    PalindromicPattern c = new();
    if (c.randomize()) begin
      $display("Generated constrained pattern: %p", c.a);
    end else begin
      $display("Randomization failed.");
    end
  end
endmodule
