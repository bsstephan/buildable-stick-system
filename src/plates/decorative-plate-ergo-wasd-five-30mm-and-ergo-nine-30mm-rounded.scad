include <parameters.scad>
decorative_radius_scale = 1.5;
include <components.scad>
include <lib/MinkowskiRound.scad>

module rounded_ergo_wasd_five_30mm_and_ergo_nine_30mm_decorative_plate() {
	difference() {
		linear_extrude(2) round2d(1, 50, $fn=100) projection(cut=true) union() {
			translate([-panel_x/2, 0, -50]) mirror([1, 0, 0]) ergo_wasd_five_30mm();
			translate([panel_x/2, 0, -50]) ergo_nine_30mm();
		}
		// cut out the normal holes
		union() {
			translate([-panel_x/2, 0, -1]) mirror([1, 0, 0]) ergo_wasd_five_30mm();
			translate([panel_x/2, 0, -1]) ergo_nine_30mm();
		}
	}
}

rounded_ergo_wasd_five_30mm_and_ergo_nine_30mm_decorative_plate();
