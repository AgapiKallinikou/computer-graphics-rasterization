# 2D Profile Generation via Cubic Splines Interpolation

This repository contains a MATLAB implementation that mathematically defines and plots the upper silhouette of a dog using **Cubic Splines**. By utilizing piecewise cubic polynomial interpolation, the project achieves a smooth, continuous, and geometrically accurate 2D outline mapped from a discrete coordinate grid.

---

## 🐶 Methodology & Approach

To construct the complete silhouette, the data points were extracted from a reference grid and segmented into three distinct anatomical regions:
1. **Body & Back**
2. **Head **
3. **Snout **

### Implementation Details
* **Node Definition:** Coordinate vectors $(x, y)$ were defined for the boundary nodes of each distinct region.
* **Piecewise Interpolation:** MATLAB's built-in `spline` function was utilized to compute the interpolating cubic polynomials. This mathematical approach guarantees that the curve passes exactly through every control point while maintaining continuous first ($S'$) and second ($S''$) derivatives at all internal nodes ($C^2$ continuity), ensuring an elegant and organic visual result.
* **Polynomial Extraction:** The exact mathematical formulation was retrieved using the `unmkpp` function, which extracts the structural coefficients of the local cubic polynomials.
* **Geometric Scaling:** The final composite graph was rendered using `axis equal` to maintain identical scaling across both axes, preserving the original proportions of the vector design.

---

## 📐 Mathematical Formulation

Each sub-interval $[x_i, x_{i+1}]$ is governed by a local cubic spline equation of the form:

$$S(x) = a(x - x_i)^3 + b(x - x_i)^2 + c(x - x_i) + d$$

The extracted piecewise polynomials for each region are detailed below:

### Region 1: Body & Back 
* For $x \in [1, 2]$:  $S(x) = 0.0277(x - 1)^3 - 0.2967(x - 1)^2 + 0.9691(x - 1) + 3.0000$
* For $x \in [2, 5]$:  $S(x) = 0.0277(x - 2)^3 - 0.2137(x - 2)^2 + 0.4586(x - 2) + 3.7000$
* For $x \in [5, 6]$:  $S(x) = 0.3407(x - 5)^3 + 0.0354(x - 5)^2 - 0.0762(x - 5) + 3.9000$
* For $x \in [6, 7]$:  $S(x) = -0.5744(x - 6)^3 + 1.0576(x - 6)^2 + 1.0169(x - 6) + 4.2000$
* For $x \in [7, 8]$:  $S(x) = 0.1570(x - 7)^3 - 0.6657(x - 7)^2 + 1.4087(x - 7) + 5.7000$
* For $x \in [8, 10]$: $S(x) = 0.0227(x - 8)^3 - 0.1946(x - 8)^2 + 0.5483(x - 8) + 6.6000$
* For $x \in [10, 13]$: $S(x) = -0.0001(x-10)^3 - 0.0583(x-10)^2 + 0.0426(x-10) + 7.1000$
* For $x \in [13, 17]$: $S(x) = -0.0001(x-13)^3 - 0.0594(x-13)^2 - 0.3104(x-13) + 6.7000$

### Region 2: Head 
* For $x \in [17, 20]$: $S(x) = 0.0124(x - 17)^3 - 0.3005(x - 17)^2 + 1.6232(x - 17) + 4.5000$
* For $x \in [20, 23]$: $S(x) = 0.0124(x - 20)^3 - 0.1889(x - 20)^2 + 0.1550(x - 20) + 7.0000$
* For $x \in [23, 24]$: $S(x) = 0.2207(x - 23)^3 - 0.0773(x - 23)^2 - 0.6434(x - 23) + 6.1000$
* For $x \in [24, 25]$: $S(x) = -0.2490(x-24)^3 + 0.5848(x-24)^2 - 0.1359(x-24) + 5.6000$
* For $x \in [25, 27]$: $S(x) = -0.0657(x-25)^3 - 0.1620(x-25)^2 + 0.2869(x-25) + 5.8000$
* For $x \in [27, 27.7]$: $S(x) = -0.0657(x-27)^3 - 0.5563(x-27)^2 - 1.1498(x-27) + 5.2000$

### Region 3: Snout
* For $x \in [27.7, 28]$: $S(x) = 0.0942(x-27.7)^3 - 0.8174(x-27.7)^2 + 0.9034(x-27.7) + 4.1000$
* For $x \in [28, 29]$: $S(x) = 0.0942(x - 28)^3 - 0.7326(x - 28)^2 + 0.4384(x - 28) + 4.3000$
* For $x \in [29, 30]$: $S(x) = 0.0942(x - 29)^3 - 0.4500(x - 29)^2 - 0.7442(x - 29) + 4.1000$

---

## 📊 Visualizations & Results

The resulting plot clearly showcases the seamless connection points (knots) linking the independent interpolation regions at $x = 17$ and $x = 27.7$.



---


