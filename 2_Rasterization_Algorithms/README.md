# ⚙️ Core Rasterization Algorithms

This directory contains the low-level mathematical implementations of classic computer graphics algorithms. Instead of relying on high-level MATLAB plotting functions, these scripts operate on a continuous coordinate plane and map geometric primitives to a discrete 2D grid, effectively simulating a raw hardware frame buffer.

## 🧠 Implemented Algorithms

### 1. The Rendering Base (`draw_pixel.m`)
The foundation of the custom graphics engine. It abstracts the MATLAB coordinate system into a pixel-based display by generating a 1x1 filled polygon (unit square) centered at a given $(x, y)$ coordinate.

### 2. Bresenham's Line Algorithm (`bresenham_line.m`)
An optimized line-drawing algorithm that determines the pixels on a 2D raster that should be selected to form a straight line between two points.
* **Algorithmic Efficiency:** Relies exclusively on an error accumulator and **integer arithmetic** (addition and subtraction), completely bypassing computationally expensive floating-point multiplications and divisions.

### 3. Midpoint Circle Algorithm
Generates rasterized circles by calculating the optimal discrete path for the perimeter.
* **`bresenham_circle.m`:** Exploits **eight-way symmetry**. It calculates the pixel coordinates for a single octant and efficiently mirrors them across the remaining seven octants to complete the shape.
* **`bresenham_circle_bottom.m`:** A specialized variant restricted to rendering only the lower quadrants ($y \le y_c$). This was specifically modified to construct the bottom curve of the letter "U" without overlapping unnecessary pixels.

### 4. Kappel's Ellipse Algorithm (`kappel_ellipse_right.m`)
A robust algorithm for rendering elliptical curves. It dynamically handles the critical gradient shift as the curve transitions from a region where the horizontal change dominates ($|dx| > |dy|$) to where the vertical change dominates ($|dy| > |dx|$), ensuring a smooth, gap-free stroke. This implementation is tailored to output the right-side half of an ellipse (utilized for the letter "Ρ").
