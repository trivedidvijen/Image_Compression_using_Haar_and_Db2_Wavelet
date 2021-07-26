# Image compression using Haar & Db2 Wavelet 

## Introduction

This was initially developed during Spring 2018 as part of ***Wavelets*** course project in Matlab R2015a.

## Approach

Inbuilt image ‘Woman’ was taken for the project. Both Haar  & Db2 Wavelets were used upto 2 levels of decomposition. Comparison is provided in terms of parameters like energy details in average and detail coefficients and PSNR and MSE values for reconstructed image after each level of decomposition.

## Observation

| Type of Wavelet                                               | Haar     | Db2      |
| ------------------------------------------------------------- | -------- | -------- |
| Percent of Energy in Details after 1st level decomposition    | 2.2511   | 2.1585   |
| Percent of Energy in Average after 1st level of decomposition | 97.7489  | 97.8415  |
| Percent of Energy in Details after 2nd level decomposition    | 1.3107   | 1.2160   |
| Percent of Energy in Average after 2nd level of decomposition | 96.4382  | 101.3402 |
| MSE after 1st level decomposition                             | 374.6873 | 362.0800 |
| PSNR after 1st level decomposition                            | 22.3941  | 22.5428  |
| MSE after 2nd level decomposition                             | 592.8576 | 555.0072 |
| PSNR after 2nd level decomposition                            | 20.4013  | 20.6878  |

### Original Image

!["Orginial Image"](original.bmp)

### Images using Haar wavelet

!["Level 1 Decomposition using Haar Wavelet"](haar/level%201%20decomposition.jpg)

!["Level 2 Decomposition using Haar Wavelet"](haar/level%202%20decomposition.jpg)

!["Recovered image after first level decomposition using Haar Wavelet"](haar/recovered%20image%20after%20level%201%20decomposition.jpg)

!["Recovered image after second level decomposition using Haar Wavelet"](haar/recovered%20image%20after%20level%202%20decomposition.jpg)

### Images using Db2 wavelet

!["Level 1 Decomposition using Db2 Wavelet"](db2/level%201%20decomposition.jpg)

!["Level 2 Decomposition using Db2 Wavelet"](db2/level%202%20decomposition.jpg)

!["Recovered image after first level decomposition using Db2 Wavelet"](db2/recovered%20image%20after%20level%201%20decomposition.jpg)

!["Recovered image after second level decomposition using Db2 Wavelet"](db2/recovered%20image%20after%20level%202%20decomposition.jpg)

## Conclusion

Original image size is 65 Kb.

Level 1 compressed image size is 17 Kb. This gives a compression ratio of $3.82 : 1$.

Level 2 compressed image size is 5 Kb. This gives a compression ratio of $13 : 1$.