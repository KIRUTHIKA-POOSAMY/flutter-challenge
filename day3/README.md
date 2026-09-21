# 7-Day Flutter Challenge — Day 3: Workout Screen

This is my project for Day 3 of the Flutter UI challenge. Today, I worked on the middle screen from the design: the active workout tracker.

-

##  What I Built Today

* **Custom Circular Progress Meter:** Built the circular runner gauge from scratch using Flutter's canvas (`CustomPainter`). It has a soft blue inner ring, a light grey guide circle, and an outer curved bar that changes smoothly from green to orange with a small green dot at the top.
* **Top Bar:** Added the circular back button on the left and a rounded pill container on the right holding the favorite star, edit pencil, and options menu.
* **Workout Header:** Created the header row showing "Workout" and a bold "90 min", along with an icon avatar and custom vertical bars representing workout intensity.
* **Exercise 1/8 Card:** Created the main white card that shows the active exercise step (`Exercise 1/8`), the digital timer (`1:29:59`), the center runner badge with "10km", and a full-width peach "STOP" button at the bottom.
* **Vitals Row:** Placed `VO₂ 29` on the far left, a small divider mark in the middle, and the heart icon with `98` bpm on the far right.



##  What I Learned Today

### 1. Drawing Custom Shapes with `CustomPainter`
Standard Flutter widgets don't give you multi-ring arcs with custom colors and gradients, so I had to draw them myself:
* **Angles and Arcs (`drawArc`):** Learned that Flutter uses radians instead of normal degrees to draw circles. A full circle is 2 * pi, and 12 o'clock is `-pi / 2`.
* **Color Gradients on Curves (`SweepGradient`):** Learned how to make a color smoothly fade from lime green into orange around a curve instead of staying one solid color.
* **Placing the Detached Dot with Math:** Used simple trigonometry (`cos` and `sin`) to calculate the exact X and Y position for the little green dot so it sits right along the circle's edge with an even gap.

### 2. Nesting Rings Without Overlap
* Learned how to manage concentric circles by changing the radius for each track. The outer bar uses a larger radius, while the light blue arc sits slightly inside it so neither overlaps or looks messy.

### 3. Fixing Spacing Issues
* **Spreading items across a row:** Earlier, `VO₂ 29` and `98 bpm` were bunching up toward the center. Using `MainAxisAlignment.spaceBetween` pushed the numbers cleanly to the far left and right edges, keeping the small dash centered.
* **Combining Canvas and Widgets (`Stack`):** Learned how to draw the gauge in the background and place normal Flutter text and icons directly on top in the center.

