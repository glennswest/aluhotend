include <configuration.scad>;

include <nutsnbolts/cyl_head_bolt.scad>;
include <nutsnbolts/materials.scad>;

separation = 44;  // Distance between ball joint mounting faces.
offset = 22;  // Same as DELTA_EFFECTOR_OFFSET in Marlin.
mount_radius = 18.5;  // Hotend mounting screws, standard would be 25mm.
jhead_od_radius = 8;  // Hole for the hotend (J-Head diameter is 16mm).
jhead_id_radius = 6;

jhead_height=2;


m5_radius=2.5;
m5nut_thickness=2.7;
m5_bowden_height=4.37;

height = m5_bowden_height;

module mount_cap() {
  difference() {
    union() {
       
		cylinder(r=offset-5, h=height, center=true, $fn=36);
		
		 for (a = [0:120:359]) rotate([0, 0, a]) {
      	  translate([0, mount_radius, 0])	cylinder(r=8.5, h=height, center=true, $fn=36);
    		  }
	}
    
    translate([0, 0, -1])cylinder(r=m5_radius, h=height*3, $fn=36);
    translate([0, 0, 0]) nutcatch_parallel("M5", l=2.7);


    for (a = [0:120:359]) rotate([0, 0, a]) {
      translate([0, mount_radius, height/2])	cylinder(r=m3_wide_radius, h=2*height, center=true, $fn=12);
    }

	
    for (a = [60:120:359]) rotate([0, 0, a]) {
      translate([0, offset, height/2])	cylinder(r=12, h=2*height, center=true, $fn=36);
    }

  }

}

translate([0, 0, height/2]) mount_cap();
