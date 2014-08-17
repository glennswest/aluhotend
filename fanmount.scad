include <configuration.scad>;
include <fan_mount.scad>;
include <keystone.scad>;



module fan_mount_body()
{
	union(){
       translate([ 0,0,-5]) fan_mount(size=30,thick=5);
       translate([10,30,-5])  cube([12,45,3.9]);
       translate([22,65.1,18]) rotate([90,180,180]) keystone();
       }

}

module fan_mount_cuts()
{

     translate([12.5,0,-2.5]) rotate([90,0,0])
        cylinder(r=m3_radius, h=5, center=true, $fn=12);
     translate([17.5,0,-2.5]) rotate([90,0,0])
        cylinder(r=m3_radius, h=5, center=true, $fn=12);

}

module fanmount()
{
    difference(){
       fan_mount_body();
       fan_mount_cuts();
       }
}


translate([15,55,5]) rotate([0,0,180]) fanmount();