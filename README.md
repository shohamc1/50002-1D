# 50002-1D

|   Operation    | `ALUFN` code | Decimal |
| :------------: | :----------: | :-----: |
|     `ADD`      |    000000    |    0    |
|     `SUB`      |    000001    |    1    |
| `MUL` (extra)  |    000010    |    2    |
| `DIV` (extra)  |    000011    |    3    |
|     `SHL`      |    000101    |    5    |
|     `SHR`      |    000110    |    6    |
|     `SRA`      |    000111    |    7    |
|     `AND`      |    011000    |   24    |
| `XNOR` (extra) |    011001    |   25    |
|      `OR`      |    011110    |   30    |
|     `XOR`      |    010110    |   22    |
|     `LDR`      |    011010    |   26    |
|    `CMPEQ`     |    110011    |   51    |
|    `CMPLT`     |    110101    |   53    |
|    `CMPLE`     |    110111    |   55    |

`ALUFN` numbers for `SHL`, `SHR` and `SRA` temporarily changed to accomodate the restrictions of `io_dip`.

Description	ALUFN	A	B	output	Extras
Adder		A	B	output	(z, v, n)
|(50) + (50)        |	000000 |	0000000000110010	0000000000110010	0000000001100100	000
|(-50) + (50) 	    | 000000 |	1111111111001110	0000000000110010	0000000000000000	100
|(-50) + (-64) 	    | 000000 |	1111111111001110	1111111111000000	1111111110001110	001
|(-32767) + (-32767)|	000000 |	1000000000000001	1000000000000001	0000000000000010	010
|(32767) + (32767)	| 000000 |	0111111111111111	0111111111111111	1111111111111110	011
Subtract					
|(50) – (-50) 	    |  000001 |	0000000000110010	1111111111001110	0000000001100100	000
|(50) – (50) 	      | 000001  | 0000000000110010	0000000000110010	0000000000000000	100
|(-50) – (64) 	    | 000001	| 1111111111001110	0000000001000000	1111111110001110	001
|(-32767) – (32767) |	000001	| 1000000000000001	0111111111111111	0000000000000010	010
|(32767) – (-32767) |	000001	| 0111111111111111	1000000000000001	1111111111111110	011
Compare: z, v, n				000…(=, <, =<)	
|(50) vs (-50) : 000       | d51d53d55	| 0000000000110010	1111111111001110	000	
|(50) vs (50) : 100        | d51d53d55	| 0000000000110010	0000000000110010	101	
|(-50) vs (64) : 001       | d51d53d55	| 1111111111001110	0000000001000000	011	
|(-32767) vs (32767) : 010 | d51d53d55	| 1000000000000001	0111111111111111	011	
|(32767) vs (-32767): 011  | d51d53d55	| 0111111111111111	1000000000000001	000	
Boolean (40 & -40)					
|AND (A & -A )             |	d24 |	0000000000101000	1111111111011000	0000000000001000	
|OR (A | -A)               |	d30	| 0000000000101000	1111111111011000	1111111111111000	
|XOR (A ^ -A) 	           |  d22	| 0000000000101000	1111111111011000	1111111111110000	
|XNOR (A ~^ -A) 	         |  d25	| 0000000000101000	1111111111011000	0000000000001111	
|LDR (A)                   |	d26	| 0000000000101000	1111111111011000	0000000000101000	
Shifter(40 / -40)					
|SL (A<<5)                 | d5 | 0000000000101000	0000000000000101	0000010100000000	
|SR (A>>5) 	               | d6	| 0000000000101000	0000000000000101	0000000000000001	
|SRA (-A>>5)	             | d7	| 1111111111011000	0000000000000101	1111111111111110	
Multiplier (40 & -40)					
|Mul (A * -A)              | d2	| 0000000000101000	1111111111011000	1111100111000000	
|Mul (-A * -A)	           | d2	| 1111111111011000	1111111111011000	0000011001000000	

 
Adder/ Subtract Unit:
The 5 test cases used in the adder unit are designed to produce unique values for Z, V and N. In addition, the adder should also correctly compute the values of Z, V and N after operations that are supposed to overflow. For instance, adding the values of (-32767) and (-32767) should result in Z=0, V=1 and N=0, which indicates a negative value as the result. Another extreme case would be adding (32767) and (32767) together, resulting in both V and N being equal to 1, which indicates a positive value as the result.
The test cases for the subtract unit are designed such that applying 2s-complement on B will result in the same test cases in the adder portion being activated. For instance, testing (50) – (-50) is the same as testing (50) + (50). Hence, the test cases would just test if the 2s-complement functionality is working as intended.
Compare Unit:
	Compare unit makes use of the Z, V and N values obtained from the subtract unit. Hence, I just replicated the test cases in the subtract unit here (which already provides unique combinations of Z, V and N), and analyse the results. One extreme case is that the compare unit should correctly identify (Z, V, N) values of (0,1,0) and (0,0,1) as negative results from the subtract unit, hence correctly interpret that A is smaller than B. 
