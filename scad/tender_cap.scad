// Base dimensions (mm)
base_x = 20.38;
base_y = 10.16;
height = 30;        // 3 cm

// Parameters
wall = 1;           // wall thickness
floor = 2;          // bottom thickness
clearance = 0.3;    // tolerance for fitting

// Derived values
inner_x = base_x + clearance;
inner_y = base_y + clearance;

outer_x = inner_x + 2 * wall;
outer_y = inner_y + 2 * wall;

// Rendering resolution for circular geometry (higher = smoother)
$fn = 100;

// Model
union() {
    // bottom
    cube([outer_x, outer_y, floor], center = false);

    // walls
    // left
    translate([0, 0, 0])
        cube([wall, outer_y, height]);

    // right
    translate([outer_x - wall, 0, 0])
        cube([wall, outer_y, height]);

    // front
    translate([wall, 0, 0])
        cube([inner_x, wall, height]);

    // back
    translate([wall, outer_y - wall, 0])
        cube([inner_x, wall, height]);
}