`default_nettype none // Overrides default behaviour (in a good way)

module led_array_driver(ena, x, cells, rows, cols);
  // Module I/O and parameters
  parameter N=8; // Size of Conway Cell Grid.
  parameter ROWS=N;
  parameter COLS=N;

  // I/O declarations
  input wire ena;
  input wire [$clog2(N):0] x;
  input wire [N*N-1:0] cells;
  output logic [N-1:0] rows;
  output logic [N-1:0] cols;

  // You can check parameters with the $error macro within initial blocks.
  initial begin
    if ((N <= 0) || (N > 8)) begin
      $error("N must be within 0 and 8.");
    end
    if (ROWS != COLS) begin
      $error("Non square led arrays are not supported. (%dx%d)", ROWS, COLS);
    end
    if (ROWS < N) begin
      $error("ROWS/COLS must be >= than the size of the Conway Grid.");
    end
  end

  wire [N-1:0] x_decoded;
  decoder_3_to_8 COL_DECODER(ena, x, x_decoded);

  always_comb begin : led_array_driver

    rows = 0;
    if (N == 3) begin
      rows[2] = ~((x_decoded[2] & cells[2]) |
                  (x_decoded[1] & cells[1]) |
                  (x_decoded[0] & cells[0]));

      rows[1] = ~((x_decoded[2] & cells[5]) |
                  (x_decoded[1] & cells[4]) |
                  (x_decoded[0] & cells[3]));

      rows[0] = ~((x_decoded[2] & cells[8]) |
                  (x_decoded[1] & cells[7]) |
                  (x_decoded[0] & cells[6]));

    end
    if (N == 5) begin
      rows[4] = ~((x_decoded[4] & cells[4]) |
              (x_decoded[3] & cells[3]) |
              (x_decoded[2] & cells[2]) |
              (x_decoded[1] & cells[1]) |
              (x_decoded[0] & cells[0]));

      rows[3] = ~((x_decoded[4] & cells[9]) |
              (x_decoded[3] & cells[8]) |
              (x_decoded[2] & cells[7]) |
              (x_decoded[1] & cells[6]) |
              (x_decoded[0] & cells[5]));

      rows[2] = ~((x_decoded[4] & cells[14]) |
              (x_decoded[3] & cells[13]) |
              (x_decoded[2] & cells[12]) |
              (x_decoded[1] & cells[11]) |
              (x_decoded[0] & cells[10]));

      rows[1] = ~((x_decoded[4] & cells[19]) |
              (x_decoded[3] & cells[18]) |
              (x_decoded[2] & cells[17]) |
              (x_decoded[1] & cells[16]) |
              (x_decoded[0] & cells[15]));

      rows[0] = ~((x_decoded[4] & cells[24]) |
              (x_decoded[3] & cells[23]) |
              (x_decoded[2] & cells[22]) |
              (x_decoded[1] & cells[21]) |
              (x_decoded[0] & cells[20]));
    end
    if (N == 8) begin
      rows[7] = ~((x_decoded[0] & cells[0]) |
                  (x_decoded[1] & cells[1]) |
                  (x_decoded[2] & cells[2]) |
                  (x_decoded[3] & cells[3]) |
                  (x_decoded[4] & cells[4]) |
                  (x_decoded[5] & cells[5]) |
                  (x_decoded[6] & cells[6]) |
                  (x_decoded[7] & cells[7]));

      rows[6] = ~((x_decoded[0] & cells[8]) |
                  (x_decoded[1] & cells[9]) |
                  (x_decoded[2] & cells[10]) |
                  (x_decoded[3] & cells[11]) |
                  (x_decoded[4] & cells[12]) |
                  (x_decoded[5] & cells[13]) |
                  (x_decoded[6] & cells[14]) |
                  (x_decoded[7] & cells[15]));

      rows[5] = ~((x_decoded[0] & cells[16]) |
                  (x_decoded[1] & cells[17]) |
                  (x_decoded[2] & cells[18]) |
                  (x_decoded[3] & cells[19]) |
                  (x_decoded[4] & cells[20]) |
                  (x_decoded[5] & cells[21]) |
                  (x_decoded[6] & cells[22]) |
                  (x_decoded[7] & cells[23]));

      rows[4] = ~((x_decoded[0] & cells[24]) |
                  (x_decoded[1] & cells[25]) |
                  (x_decoded[2] & cells[26]) |
                  (x_decoded[3] & cells[27]) |
                  (x_decoded[4] & cells[28]) |
                  (x_decoded[5] & cells[29]) |
                  (x_decoded[6] & cells[30]) |
                  (x_decoded[7] & cells[31]));

      rows[3] = ~((x_decoded[0] & cells[32]) |
                  (x_decoded[1] & cells[33]) |
                  (x_decoded[2] & cells[34]) |
                  (x_decoded[3] & cells[35]) |
                  (x_decoded[4] & cells[36]) |
                  (x_decoded[5] & cells[37]) |
                  (x_decoded[6] & cells[38]) |
                  (x_decoded[7] & cells[39]));

      rows[2] = ~((x_decoded[0] & cells[40]) |
                  (x_decoded[1] & cells[41]) |
                  (x_decoded[2] & cells[42]) |
                  (x_decoded[3] & cells[43]) |
                  (x_decoded[4] & cells[44]) |
                  (x_decoded[5] & cells[45]) |
                  (x_decoded[6] & cells[46]) |
                  (x_decoded[7] & cells[47]));

      rows[1] = ~((x_decoded[0] & cells[48]) |
                  (x_decoded[1] & cells[49]) |
                  (x_decoded[2] & cells[50]) |
                  (x_decoded[3] & cells[51]) |
                  (x_decoded[4] & cells[52]) |
                  (x_decoded[5] & cells[53]) |
                  (x_decoded[6] & cells[54]) |
                  (x_decoded[7] & cells[55]));

      rows[0] = ~((x_decoded[0] & cells[56]) |
                  (x_decoded[1] & cells[57]) |
                  (x_decoded[2] & cells[58]) |
                  (x_decoded[3] & cells[59]) |
                  (x_decoded[4] & cells[60]) |
                  (x_decoded[5] & cells[61]) |
                  (x_decoded[6] & cells[62]) |
                  (x_decoded[7] & cells[63]));

    end

    cols[0] = x_decoded[0];
    cols[1] = x_decoded[1];
    cols[2] = x_decoded[2];
    cols[3] = x_decoded[3];
    cols[4] = x_decoded[4];
    cols[5] = x_decoded[5];
    cols[6] = x_decoded[6];
    cols[7] = x_decoded[7];
  end
  
endmodule

`default_nettype wire // reengages default behaviour, needed when using 
                      // other designs that expect it.