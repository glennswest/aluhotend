include <configuration.scad>;
include <nutsnbolts/cyl_head_bolt.scad>;
include <nutsnbolts/materials.scad>;

module radial_fan_mount_body()
{
	cube([80,12,8]);  // Horizontal
    rotate([0, 0 , 90]) cube([60,12,15]); // Vertical
    translate([-23,60,0])  rotate([90,0,0]) cube([20,15,5]);

     
}

module radial_fan_mount_cuts()
{
    // Holes For Fan
    translate([10, 6, 3]) nutcatch_parallel("M3", l=3);
    translate([10, 6, 8]) hole_through("M3",14,h=3);
    translate([70, 6, 3]) nutcatch_parallel("M3", l=3);
    translate([70, 6, 8]) hole_through("M3",14,h=3);

    rotate([90,0,0]) translate([-17, 10, 3 - 60]) nutcatch_parallel("M3", l=3);
    rotate([90,0,0]) translate([-17, 10, 8 - 60]) hole_through("M3",14);    
    rotate([90,0,0]) translate([-17,  5, 3 - 60]) nutcatch_parallel("M3", l=3);
    rotate([90,0,0]) translate([-17,  5, 8 - 60]) hole_through("M3",14);    

}

module radialfanmount()
{
   difference(){
       radial_fan_mount_body();
       radial_fan_mount_cuts();
       }

}

radialfanmount();