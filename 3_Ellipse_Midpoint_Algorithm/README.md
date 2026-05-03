# Midpoint Ellipse Algorithm (Kappel's Method)

This module implements the mathematical generation of an ellipse based on the Midpoint Algorithm. An ellipse is defined as the set of points where the sum of distances from two focal points is constant. 

For an ellipse centered at $(0,0)$ with axes lengths $2a$ and $2b$, the equation is:
$$\frac{x^2}{a^2} + \frac{y^2}{b^2} = 1$$

## 📐 Algorithmic Pillars

The algorithm determines the ideal pixels that best approximate the mathematical curve while minimizing computational cost. It operates on three core principles:

### 1. Four-Way Symmetry
The algorithm computes points exclusively for the first quadrant, starting from the rightmost edge $(a, 0)$ and ending at the top vertex $(0, b)$. The points for the remaining three quadrants are generated instantly via symmetric reflection, saving significant execution time.

### 2. Two-Region Division
Because the curve's gradient changes continuously, the quadrant is divided into two distinct regions. The split occurs at the exact point where the tangent slope is $-1$ ($45^\circ$).
* **Region 1 (Slope > -1):** The curve is steeper. The algorithm steadily increments the $y$-coordinate at each step and decides whether it needs to decrement the $x$-coordinate.
* **Region 2 (Slope $\le$ -1):** The curve becomes flatter. The algorithm steadily decrements the $x$-coordinate at each step and decides whether it needs to increment the $y$-coordinate.

### 3. Decision Parameter ($f_{mid}$)
To select the correct pixel at each step, the algorithm evaluates the ellipse equation at the midpoint between two candidate pixels. If the midpoint falls inside the ellipse, one pixel is chosen; if outside, the other is chosen. 
* **Performance Benefit:** Updating this parameter inside the loop relies *exclusively* on simple arithmetic operations. Heavy computational processes like square roots and trigonometric functions are completely avoided, making the algorithm extremely fast (a direct generalization of Bresenham's circle algorithm).

---

## ⚡ Computational Complexity

The computational efficiency of this algorithm makes it ideal for computer graphics systems:

* **Time Complexity:** $\mathcal{O}(a + b)$ or $\mathcal{O}(\max(a, b))$
  The algorithm calculates the ellipse step-by-step (pixel-by-pixel) along one quadrant. In the worst-case scenario, the total iterations across both loops are proportional to the sum of the radii. Execution time per pixel is strictly $\mathcal{O}(1)$, as each iteration relies only on elementary integer arithmetic.
  
* **Space Complexity:** $\mathcal{O}(1)$
  The algorithm extracts the $(x, y)$ coordinates and pushes them directly to the rendering function. There is no need to store the calculated points in data structures (like arrays or lists) prior to drawing. Only a small, fixed number of auxiliary variables are allocated in memory.
