# Computer Graphics: Low-Level Rasterization & Typography

This repository contains a from-scratch implementation of fundamental 2D rasterization algorithms in MATLAB. Instead of relying on high-level plotting utilities, this project simulates a low-level graphics rendering pipeline by drawing vector primitives pixel-by-pixel.

## 📌 Project Highlights

* **Pixel-Level Control:** Implemented a custom `draw_pixel` engine using 1x1 filled polygons to accurately simulate screen-space rasterization.
* **Bresenham's Algorithms:** Highly efficient implementations for drawing lines and circles using integer arithmetic, bypassing the need for floating-point operations.
* **Kappel's Ellipse Algorithm:** Mathematical calculation and rendering of elliptical curves.
* **Algorithmic Shape Manipulation:** Modified standard algorithms to render specific geometric fractions (e.g., bottom-half circles for the letter "U", right-half ellipses for the letter "Ρ").
* **2D Affine Transformations:** Utilization of homogeneous coordinates and matrix multiplication to apply complex spatial transformations (e.g., scaling relative to arbitrary pivot points).
* **Complexity Analysis:** Includes deep-dive documentation on algorithm efficiency, time complexity O(a+b), and region-based rasterization logic.

---

## 📂 Repository Structure

### `1_Typography_Projects/`
The main execution scripts that combine primitives to form complex shapes and letters.
* **`main_UOA.m`**: Renders the letters "UOA" using a combination of straight lines, concentric circles, and semi-circles.
* **`main_GRAFIKA.m`**: Renders the Greek word "ΓΡΑΦΙΚΑ" utilizing complex curves, including Kappel's right-half ellipse.

### `2_Rasterization_Algorithms/`
The core mathematical engines powering the rendering.
* **`draw_pixel.m`**: The base rendering function that maps a continuous (x, y) coordinate to a discrete 1x1 graphical pixel.
* **`bresenham_line.m`**: Bresenham's Line Generation Algorithm.
* **`bresenham_circle.m`**: Bresenham's Circle Generation Algorithm.
* **`bresenham_circle_bottom.m`**: Modified circle algorithm restricted to y ≤ y_c.
* **`kappel_ellipse_right.m`**: Kappel's algorithm optimized for right-side elliptical rendering.

### `3_Ellipse_Midpoint_Algorithm/`
A dedicated module focusing on the mathematical analysis and implementation of the Midpoint Ellipse Algorithm.
* **`kappel_ellipse.m`**: The pure algorithm implementation demonstrating 4-way symmetry and decision parameter evaluation.
* **`README.md`**: Detailed theoretical documentation, complexity analysis, and explanation of region-based curve rasterization.

### `4_Affine_Transformations/`
Implementation of 2D spatial transformations using Homogeneous Coordinates.
* **`composite_scaling.m`**: Script demonstrating how to scale a polygon relative to an arbitrary pivot point by combining Translation and Scaling matrices into a single composite matrix.

---

## 🛠️ Tech Stack & Concepts

* **Language:** MATLAB
* **Core Concepts:** Rasterization, Primitive Generation, Integer Arithmetic Modeling, Coordinate Geometry, Affine Transformations, Homogeneous Coordinates, Algorithm Complexity, Computer Graphics Fundamentals.

---

## 🎓 Academic Context & Author

These rasterization algorithms and rendering scripts were developed as part of the Computer Graphics coursework at the **National and Kapodistrian University of Athens (NKUA)**.
