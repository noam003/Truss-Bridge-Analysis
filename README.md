# Truss Bridge Design Analysis Using Matlab

#### Motivation
Design a Truss bridge with specifications for the maximum weight supported, the cost of the truss, and the load-to-cost ratio. Then test the design’s performance through a MATLAB written program. 

#### Truss Bridge Hand Drawn Design
![App Screenshot](https://github.com/noam003/Truss-Bridge-Analysis/blob/main/truss.png)

#### Truss Bridge Design Data and Results

_Table 1: The data analyzed by the program [program](https://github.com/noam003/Truss-Bridge-Analysis/blob/main/truss_proj.m)._
| Member Number  | Member Length (in) | Tension/Compression | Buckling Strength ± uncertainty (oz) | Magnitude of internal force at nominal maximum |
|     :---:      |     :---:      |     :---:      |     :---:      |     :---:     |
| 1 (AB)  | 7.810  | Compression  | 48.28 ± 6.914  | 39.932  |
| 2 (BC) | 7.280  | Compression  | 55.56 ± 7.417  | 47.857  |
| 3 (CD)  | 8.000  | Compression  | 46.02 ± 6.750  | 46.015  |
| 4 (DE)  | 7.071  | Compression  | 58.90 ± 7.637  | 25.824  |
| 5 (EF)  | 7.616  | Compression  | 50.78 ± 7.090  | 22.250  |
| 6 (FG)  | 10.00  | Tension  | N/A  | 8.765  |
| 7 (GH)  | 8.000  | Tension  | N/A  | 25.564  |
| 8 (AH)  | 12.00  | Tension  | N/A  | 25.564  |
| 9 (BH)  | 9.220  | Tension  | N/A  | 26.936  |
| 10 (CH)  | 8.000  | Tension  | N/A  | 13.147  |
| 11 (DH)  | 11.31  | Tension  | N/A  | 28.922  |
| 12 (DG)  | 8.000  | Compression  | 46.03 ± 6.750  | 16.799  |
| 13 (GE)  | 9.899  | Tension  | N/A  | 23.758  |


_Table 2: Summary of the results._
| Maximum Theoretical Load  | Truss Cost | Load-to-Cost Ratio |
|     :---:      |     :---:      |     :---:      |
| 51.128 oz  | $194.21  | 0.263 oz/$  |


