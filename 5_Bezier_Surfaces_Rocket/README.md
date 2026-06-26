# 3D Rocket Design via Parametric Bézier Curves

This repository contains a MATLAB implementation for designing the external aerodynamic hull of a telecommunications satellite launch vehicle. By leveraging **parametric Bézier curves** and **surfaces of revolution**, the project transitions from a theoretical 2D geometric profile into a complete 3D axis-symmetric model and a discrete 3D point cloud.

---

## 🚀 Project Overview & Pipeline

The project is structured into four distinct development phases, moving from core mathematical formulation to 3D visualization:

1. **Phase 1: Core Algorithm (`Bezier.m`)** – Implementation of the parametric Bézier curve generator.
2. **Phase 2: 2D Hull Profile** – Generation of the rocket's 2D profile using 50 evaluation points, mirrored symmetrically across the y-axis.
3. **Phase 3: 3D Surface of Revolution** – Continuous 3D surface generation by rotating the 2D profile around the vertical axis.
4. **Phase 4: Discrete Point Cloud** – Discretization of the 3D surface into a point cloud using 36 sequential rotations of $\frac{\pi}{18}$ radians.

---

## 📐 Mathematical Background

The geometry of the rocket is governed by a Bézier curve of degree $n$, defined by $(n + 1)$ control points $P_i$. 

The curve $B(t)$ is calculated using the following parametric formula:

$$B(t) = \sum_{i=0}^{n} B_i^n(t)P_i, \quad 0 \le t \le 1$$

Where the blending functions $B_i^n(t)$ are the **Bernstein Polynomials**, defined as:

$$B_i^n(t) = \binom{n}{i} (1 - t)^{n-i}t^i$$

### Implementation Details
The core routine `Bezier.m` takes the control points and a discretization parameter $d$ as inputs. It evaluates $d$ equally spaced values of $t \in [0, 1]$ to generate a $d \times 2$ matrix containing the exact spatial coordinates of the curve.

---

## 📊 Problem Parameters

The specific dimensions of the rocket model were determined parametrically based on individual dataset inputs, yielding the following geometric constraints:

* **Height ($H$):** 26 units
* **Radius ($R$):** $\approx 6.9565$ units
* **Angle ($\theta$):** $\approx 35.22^\circ$


---
