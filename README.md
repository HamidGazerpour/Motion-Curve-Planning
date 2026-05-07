# Motion Curve Planning

MATLAB/Octave utilities for evaluating normalized cam and motion-curve profiles. The repository contains reusable motion-law functions that return position, velocity, and acceleration, plus a sample plotting script for comparing curve shapes over a 0-360 degree cycle.

## What is included

| File | Purpose |
| --- | --- |
| `AccCosAsim.m` | Asymmetric constant-acceleration helper that evaluates normalized position, velocity, and acceleration for a split point `xv`. |
| `MCM_cubic.m` | Cubic motion curve evaluator. |
| `MCM_cycloidal.m` | Cycloidal motion curve evaluator. |
| `MCM_sshape.m` | S-shaped motion curve evaluator using parameter fields `v` and `w` to define the acceleration, constant-velocity, and deceleration regions. |
| `MCMtraposoidal.m` | Seven-segment trapezoidal/modified trapezoidal profile evaluator. |
| `mymotioncurve.m` | Example rise-dwell motion curve wrapper built on `AccCosAsim`. |
| `mainMC01.m` | Example script that samples motion curves and plots position, velocity, and acceleration. |

## Requirements

- MATLAB, or GNU Octave with compatible plotting support.
- No third-party toolboxes are required for the functions currently in this repository.

## Quick start

1. Clone the repository and open it in MATLAB or Octave.
2. Add the repository folder to your MATLAB/Octave path.
3. Evaluate one of the curve functions at a normalized input value.

```matlab
x = 0.25;
result = MCM_cycloidal(x, struct());

fprintf('pos = %.4f, vel = %.4f, acc = %.4f\n', ...
        result.pos, result.vel, result.acc);
```

Most curve functions use normalized motion coordinates:

- `x = 0` represents the start of the segment.
- `x = 1` represents the end of the segment.
- The returned struct contains:
  - `pos`: normalized position/displacement.
  - `vel`: normalized velocity.
  - `acc`: normalized acceleration.

## Function examples

### Cubic curve

```matlab
x = linspace(0, 1, 101);
pos = zeros(size(x));
vel = zeros(size(x));
acc = zeros(size(x));

for i = 1:numel(x)
    r = MCM_cubic(x(i), struct());
    pos(i) = r.pos;
    vel(i) = r.vel;
    acc(i) = r.acc;
end

plot(x, pos, '-', x, vel, '--', x, acc, ':', 'LineWidth', 2);
grid on;
legend('Position', 'Velocity', 'Acceleration');
title('Cubic Motion Curve');
```

### Cycloidal curve

```matlab
r = MCM_cycloidal(0.5, struct());
disp(r);
```

### S-shaped curve

```matlab
par.v = 0.25;
par.w = 0.75;
r = MCM_sshape(0.5, par);
disp(r);
```

`par.v` and `par.w` must satisfy `0 <= par.v <= par.w <= 1`.

### Seven-segment trapezoidal profile

```matlab
alpha_ad = 0.4;
r = MCMtraposoidal(alpha_ad);
disp(r);
```

## Running the demo script

From the repository root, run:

```matlab
mainMC01
```

The script samples motion curves from 0 to 360 degrees and plots position, velocity, and acceleration traces.

> **Note:** `mainMC01.m` references `mymotioncurve`, `mymotioncurve2`, `mymotioncurve3`, and `mymotioncurve4`, while the repository currently includes `mymotioncurve.m` with a function named `mymotioncurve1`. If MATLAB cannot find one of these functions, rename or add the expected wrapper functions before running the full demo.

## Development notes

- Keep motion-law functions side-effect free: they should compute and return a struct without plotting or modifying global state.
- Prefer normalized inputs for reusable curve functions, then scale position, velocity, and acceleration in wrapper functions when applying a real stroke length or angular interval.
- If you add a new motion law, document its input domain and required parameters in this README.

## License

No license file is currently included. Add a license before distributing or reusing this code outside the repository owner/team.
