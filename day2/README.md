# 7-Day Flutter Challenge — Day 2: Fitness Activity Dashboard

Submission for Day 2 of the 7-Day Flutter UI Challenge. Today's focus was expanding the dashboard interface into a multi-metric fitness tracker complete with interactive card layouts, custom progress indicators, and path-based activity wave charts.



# What I Did

* Constructed Dual Metric Cards:
 Built side-by-side expanded cards for **Time** (`1:30 Hours`) and **Exercises** (`12/8 Tasks`) using tailored pastel color themes, custom icon indicators, and responsive padding.
* Refined Weekly Calendar Strip:
 Built a horizontal date selector with day/date baseline alignments, featuring individual circular badges on dates `1` and `2`, and a grouped pill highlight for `WED 4`.
* Implemented Circular Progress Gauge:
 Added a stacked circular tracker (`64%`) using `CircularProgressIndicator` paired with the overall score (`1544`) and a percentage growth indicator (`+6%`).
* Engineered Custom Curve Wave Graph:
 Created a custom chart using Flutter's `CustomPainter` to draw smooth multi-crest cubic bezier curves (`cubicTo`) and placed an active indicator dot along the rising crest above Wednesday/Thursday.
* Card Border & Visual Hierarchy:
 Wrapped the weekly metrics and wave graph in an enclosed white card with subtle borders and shadows to achieve a unified, modern card design.


# What I Learnt

* Custom Vector Drawing with `CustomPainter`:
Gained hands-on experience utilizing `Path`, `moveTo`, and `cubicTo` to plot smooth mathematical curves and render custom line graphs without external charting libraries.
* Proportional Screen Adaptation:
 Learned how to calibrate card heights, spacings, and viewport dimensions to balance content evenly without bottom overflow or excessive empty space.
* Advanced Color Matching & Hierarchy:
 Applied exact hex values across pastels (powder cyan `#CEEEF6`, pale lime `#D8F2BC`, terracotta `#B25D48`, and slate-blue `#EDF3F7`) to build an aesthetically balanced, accessible mobile dashboard.
* Dynamic Widget Reusability:
 Modularized reusable helper methods (`_buildMetricCard` and `_buildDateItem`) to keep `main.dart` structured and readable.


