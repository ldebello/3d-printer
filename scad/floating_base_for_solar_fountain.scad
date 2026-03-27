// Total outside diameter of the floating base
outer_diameter = 280;

 // Diameter of the center pass-through opening
inner_diameter = 140;

// Outer diameter of the fountain body being retained
fountain_diameter = 162;

// Height of the external perimeter wall
outer_wall_height = 30;

// Thickness of the bottom floor/base plate
base_thickness = 4;

// Thickness used for both outer and inner retaining walls
wall_thickness = 3;

// Height of the inner wall that keeps the fountain in place
fountain_retainer_height = 12;

// Number of evenly spaced drainage holes
drain_hole_count = 12;

// Diameter of each drainage hole
drain_hole_diameter = 10;

// Rendering resolution for circular geometry (higher = smoother)
$fn = 100;

difference() {
    union() {
        // 1. Outer bowl (30 mm wall)
        difference() {
            cylinder(h = outer_wall_height, d = outer_diameter);
            translate([0, 0, base_thickness])
                cylinder(h = outer_wall_height + 1, d = outer_diameter - (wall_thickness * 2));
        }

        // 2. Inner retainer (prevents fountain from shifting)
        difference() {
            cylinder(h = base_thickness + fountain_retainer_height, d = fountain_diameter + (wall_thickness * 2));
            translate([0, 0, base_thickness])
                cylinder(h = fountain_retainer_height + 1, d = fountain_diameter);
        }
    }

    // 3. Through center hole
    translate([0, 0, -5])
        cylinder(h = outer_wall_height + 10, d = inner_diameter);

    // 4. Drain holes
    for (i = [0 : drain_hole_count - 1]) {
        rotate([0, 0, i * (360 / drain_hole_count)])
        translate([(outer_diameter + fountain_diameter) / 4 + 5, 0, -1])
            cylinder(h = base_thickness + 2, d = drain_hole_diameter);
    }

    // 5. Half cut for Bambu A1
    translate([-outer_diameter, 0, -1])
        cube([outer_diameter * 2, outer_diameter, outer_wall_height + 5]);
}
