module clock_divider (
    input  logic clk,        // Input Master Clock
    input  logic rst_n,      // Active-low asynchronous reset
    output logic clk_div2,   // Divide by 2
    output logic clk_div4,   // Divide by 4
    output logic clk_div8,   // Divide by 8
    output logic clk_div16,  // Divide by 16
    output logic clk_div32   // Divide by 32
);

  logic [4:0] count;

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      count <= 5'b0;
    end else begin
      count <= count + 1'b1;
    end
  end

  // Assigning counter bits to output clocks
  // Bit 0 toggles every 1 clk cycle (Period = 2x input)
  // Bit 1 toggles every 2 clk cycles (Period = 4x input)
  assign clk_div2  = count[0];
  assign clk_div4  = count[1];
  assign clk_div8  = count[2];
  assign clk_div16 = count[3];
  assign clk_div32 = count[4];

endmodule
