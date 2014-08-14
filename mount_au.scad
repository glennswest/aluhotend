include <configuration.scad>;

separation = 44;  // Distance between ball joint mounting faces.
offset = 22;  // Same as DELTA_EFFECTOR_OFFSET in Marlin.
mount_radius = 18.5;  // Hotend mounting screws, standard would be 25mm.

// Tuning Parameters for Different Jheads -- Edit Here
jhead_od_radius = 8;  // Hole for the hotend (J-Head diameter is 16mm).
jhead_id_radius = 6;
jhead_upper_height = 2; // From top of hotend to notch
jhead_notch_height = 2; // Notch height
// End Edit

height = jhead_upper_height + jhead_notch_height;


module body_base() {
  union() {
		cylinder(r=offset-5, h=height, center=true, $fn=36);
		
		for (a = [0:120:359]) rotate([0, 0, a]) {
      	translate([0, mount_radius, 0])	cylinder(r=8.5, h=height, center=true, $fn=36);
    		}
		   
    }
}

module body_cuts() {
   union() {
     for (a = [0:120:359]) rotate([0, 0, a]) {
      translate([0, mount_radius, 0])	cylinder(r=m3_wide_radius, h=height, center=true, $fn=12);
     for (a = [60:120:359]) rotate([0, 0, a]) {
       translate([0, offset, height/2])	cylinder(r=12, h=height*2, center=true, $fn=36);
       }
    }
   }

}

module body()
{
    difference(){
          body_base();
          body_cuts();
          }

}

module hotend_cutouts() 
{

	
	translate([0, 0, 0])cylinder(r=jhead_od_radius, h=jhead_upper_height, $fn=36);
    translate([0, 0,-1 * jhead_upper_height]) cylinder(r=jhead_id_radius, h=height, $fn=36); 
    

	rotate([0, 0, 60])translate([0,offset/2,0])cube ([jhead_id_radius*2,offset,height*2],center=true);
	rotate([0, 0, 60])translate([0,offset/2,jhead_notch_height+2])cube ([jhead_od_radius*2,offset,height*2],center=true);


   


}
module mount() {
  difference() {
     body();
     hotend_cutouts();
  }
}

translate([0, 0, height/2]) mount();