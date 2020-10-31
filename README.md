# 50002-1D

|   Operation    | `ALUFN` code | Decimal |
| :------------: | :----------: | :-----: |
|     `ADD`      |    000000    |    0    |
|     `SUB`      |    000001    |    1    |
| `MUL` (extra)  |    000010    |    2    |
| `DIV` (extra)  |    000011    |    3    |
| `XNOR` (extra) |    000100    |    4    |
|     `SHL`      |    000101    |    5    |
|     `SHR`      |    000110    |    6    |
|     `SRA`      |    100111    |    7    |
|     `AND`      |    011000    |   24    |
|      `OR`      |    011110    |   30    |
|     `XOR`      |    010110    |   22    |
|     `LDR`      |    011010    |   26    |
|    `CMPEQ`     |    110011    |   51    |
|    `CMPLT`     |    110101    |   53    |
|    `CMPLE`     |    110111    |   55    |

`ALUFN` numbers for `SHL`, `SHR` and `SRA` temporarily changed to accomodate the restrictions of `io_dip`.
