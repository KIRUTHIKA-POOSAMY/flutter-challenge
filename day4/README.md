# Workout Tracker UI (Day 4 - Flutter Challenge)

A Flutter replication of a workout session tracking interface featuring custom canvas-rendered ring gauges, active progress metrics, and exercise set management cards.

---

## Features

- **Adaptive Screen Layout**: Built with `LayoutBuilder` and `ConstrainedBox` to automatically scale and adapt to different emulator screen sizes (iOS and Android devices) without pixel overflows.
- **Concentric Canvas Gauges (`CustomPainter`)**:
  - Full subtle channel guidelines.
  - Multi-stop gradient sweep (Lime Green `#86B533` to Amber Orange `#DE7E12`) on the outer active segment.
  - Directional anti-clockwise light blue progress arc (`#C7E3ED`).
  - Positioned cap dot indicator.
- **Top Workout Summary**: Real-time duration stats alongside a mini frequency/intensity bar chart.
- **Active Exercise Card**: Shows current round indicator (`1/8`), stopwatch, live VO₂ reading, pagination tracker, heart rate BPM, and an accessible call-to-action button.
- **Secondary Set Preview**: Displays upcoming workout set (`Bench Press 3/10`), completion percentage indicator, and quick-action play control.

