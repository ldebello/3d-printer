// Bingo control board — numbered pockets (1..cols*rows) for balls, flat on the bed for printing.
// Layout: OpenSCAD for-loop uses y downward in code; y_pos flips so pocket 1 is top-left as on a real board.

// ----- User-tunable dimensions (mm) -----

// Nominal ball size; hole is slightly larger so balls sit in the pocket without binding.
ball_diameter = 14.85;
clearance = 0.6;
hole_diameter = ball_diameter + clearance;

// Grid: gap between hole centers, column/row count (default 10x9 = 90 numbers).
spacing = 3;
cols = 10;
rows = 9;

// Main solid: thicker bottom block + thinner top plate where holes and engraving live.
top_thickness = 5;
bottom_thickness = 6;

// Perimeter wall around the grid; base_extra makes the bottom footprint slightly larger than the top “step”.
wall = 5;
base_extra = 4;

// Engraved number depth/size; title along the front edge of the board.
text_depth = 1.2;
text_size = 6.5;
title_size = 11;

// Raised rim around the top surface so balls do not roll off easily.
lip_height = 2.5;

// Rounded rectangle look: hull of four cylinders at the corners (same radius on XY).
round_radius = 4;

// ----- Derived sizes (do not edit unless you know the geometry) -----

// Center-to-center spacing of holes; title band uses one row’s worth of height.
pitch = hole_diameter + spacing;
title_height = pitch;

// Top stepped platform (grid area + title strip + walls).
top_w = cols * pitch + 2 * wall;
top_h = rows * pitch + 2 * wall + title_height;

// Bottom slab is larger by base_extra; offset_val centers the top step on the base.
bot_w = top_w + base_extra;
bot_h = top_h + base_extra;
offset_val = base_extra / 2;

total_height = top_thickness + bottom_thickness;

// Curve quality for cylinders/hulls (higher = smoother, slower preview).
$fn = 60;

// ----- Geometry: base + top step, then subtract holes, numbers, and title -----

union() {

    // 1) Board body: rounded bottom block + rounded top step (hull of corner cylinders).
    difference() {
        union() {
            hull() {
                translate([round_radius, round_radius, 0]) cylinder(r=round_radius, h=bottom_thickness);
                translate([bot_w-round_radius, round_radius, 0]) cylinder(r=round_radius, h=bottom_thickness);
                translate([bot_w-round_radius, bot_h-round_radius, 0]) cylinder(r=round_radius, h=bottom_thickness);
                translate([round_radius, bot_h-round_radius, 0]) cylinder(r=round_radius, h=bottom_thickness);
            }

            translate([offset_val, offset_val, bottom_thickness])
            hull() {
                translate([round_radius, round_radius, 0]) cylinder(r=round_radius, h=top_thickness);
                translate([top_w-round_radius, round_radius, 0]) cylinder(r=round_radius, h=top_thickness);
                translate([top_w-round_radius, top_h-round_radius, 0]) cylinder(r=round_radius, h=top_thickness);
                translate([round_radius, top_h-round_radius, 0]) cylinder(r=round_radius, h=top_thickness);
            }
        }

        // Pocket grid: through-hole from below the top face + engraved index (1 .. cols*rows).
        for (x = [0:cols-1]) {
            for (y = [0:rows-1]) {
                y_pos = (rows - 1) - y;
                idx = y * cols + x + 1;
                tx = offset_val + wall + x * pitch + hole_diameter/2;
                ty = offset_val + wall + y_pos * pitch + hole_diameter/2;

                translate([tx, ty, bottom_thickness + 1])
                    cylinder(h = top_thickness + 2, d = hole_diameter);

                translate([tx, ty, bottom_thickness + 0.1])
                    linear_extrude(height = 1.2)
                        text(str(idx), size = text_size, halign = "center", valign = "center", font = "Arial:style=Bold");
            }
        }

        // Title engraved on the top face, along the board edge (same strip height as one pitch).
        translate([bot_w/2, bot_h - offset_val - wall/2 - title_height/2, total_height - text_depth])
            linear_extrude(height = text_depth + 0.1)
                text("BINGO EN CASA", size = title_size, halign = "center", valign = "center", font = "sans:style=Bold");
    }

    // 2) Lip: outer wall on top of the board, inner hull inset by 2 mm so it forms a shallow tray rim.
    translate([offset_val, offset_val, total_height])
        difference() {
            hull() {
                translate([round_radius, round_radius, 0]) cylinder(r=round_radius, h=lip_height);
                translate([top_w-round_radius, round_radius, 0]) cylinder(r=round_radius, h=lip_height);
                translate([top_w-round_radius, top_h-round_radius, 0]) cylinder(r=round_radius, h=lip_height);
                translate([round_radius, top_h-round_radius, 0]) cylinder(r=round_radius, h=lip_height);
            }
            translate([0, 0, -1])
            hull() {
                r_in = max(0.1, round_radius - 2);
                translate([2+r_in, 2+r_in, 0]) cylinder(r=r_in, h=lip_height+2);
                translate([top_w-2-r_in, 2+r_in, 0]) cylinder(r=r_in, h=lip_height+2);
                translate([top_w-2-r_in, top_h-2-r_in, 0]) cylinder(r=r_in, h=lip_height+2);
                translate([2+r_in, top_h-2-r_in, 0]) cylinder(r=r_in, h=lip_height+2);
            }
        }
}
