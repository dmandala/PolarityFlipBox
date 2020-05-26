/* 
 * PolarityFlipBox.scad * Copyright David Mandala 2020 All rights reserved.
 *  
 * License: GPL v3 ONLY 
 * and/or 
 * The Creative Commons CC BY-SA 4.0.  
 *
 * In non-legalese, this means that you are free to use, reproduce, sell or
 * modify our designs in any way you see fit, as long as you retain this
 * same license for your projects using our work.  For those wanting to use
 * our hardware designs and/or software packages, we require you: 
 * 
 * Label the product as a clone.  It must be clear that it is not a product from our
 * THEM, Designed by THEM or Secured by THEM.
 *
 * Host your own copy of the source files on your own server or similar,
 * even if they are unmodified.  Do not just point to our existing source.
 *
 */

WallThickness = 2;
IntraBoxSpace = .6;
Smoothing = 100;

InnerBoxWidth = 60;
InnerBoxLength = 125;
InnerBoxHeight = 55;

OuterBoxWidth = InnerBoxWidth + (WallThickness*2) + IntraBoxSpace;
OuterBoxLength = InnerBoxLength + (WallThickness*2) + IntraBoxSpace;
OuterBoxHeight = InnerBoxHeight + (WallThickness);

USBConnectorLength = WallThickness;
USBConnectorWidth = 12;
USBConnectorHeight = 7.5;
USBZ = 19.;

BPlugDia = 7.9; 
BPlugWallHeight = 20;
BPlugHeigth = WallThickness;
BPlugZ = 7 + WallThickness;
BPlugBlackX = 0;
BPlugBlackY = InnerBoxWidth/3;
BPlugRedX = 0;
BPlugRedY = (InnerBoxWidth / 3) * 2;
BPlugBlue1X = InnerBoxLength-WallThickness;
BPlugBlue1Y = InnerBoxWidth/3;
BPlugBlue2X = InnerBoxLength-WallThickness;;
BPlugBlue2Y = (InnerBoxWidth / 3) * 2;

RelayLength = 50;
RelayWidth = 34.9;
RelayHoleDia = 2.5;
RelayHoleSpacer = 4;
RelayHoleSpacerDia = 3;
RelayHoleHeight = 10;

RelayHole1X = 3.2;
RelayHole1Y = 3.2;
RelayHole2X = 3.2;
RelayHole2Y = 31.7;
RelayHole3X = 46.8;
RelayHole3Y = 3.2;
RelayHole4X = 46.8;
RelayHole4Y = 31.7;

//Contro Board
CBLength = 72;
CBWidth = 47;
CBHeight = 28;
CBHoleDia = 3;
CBHoleSpacer = 9.5;
CBHoleHeight     = 16;
CBHole1X = 3.3;
CBHole1Y = 3.3;
CBHole2X = 3.3;
CBHole2Y = 43.7;
CBHole3X = 68.7;
CBHole3Y = 3.3;
CBHole4X = 68.7;
CBHole4Y = 43.7;
CBDisplayOffsetX = 8.50;
CBDisplayOffsetY = 9;
CBDisplayWidth = 26.50;
CBDisplayLength = 15.00;

CBREOffsetX = 15.00;
CBREOffsetY = 49.4;
CBREDia = 8.5;

//ControlBoardTop();
//RelayBottom();
// Display the top of the box
BoxTop();
// Now move over and display the bottom of the box so both can be exported
// as an STL file.
translate([0,OuterBoxWidth+10,0])
    BoxBottom();
        // Remove the USB Connector Hole
        //translate([OuterBoxLength-(WallThickness), (OuterBoxWidth/2)-(CBWidth/2),USBZ])
        //cube([USBConnectorLength,USBConnectorWidth, USBConnectorHeight]);

module BoxTop() {
    CBInstallOffsetAdjustment = 2;
    
    difference(){
        // Primary Box
        cube([OuterBoxLength, OuterBoxWidth, OuterBoxHeight]);
        translate([WallThickness,WallThickness,WallThickness])
        cube([InnerBoxLength+IntraBoxSpace, InnerBoxWidth+IntraBoxSpace, InnerBoxHeight]);
        // Remove part of the end wall
        translate([0,0,OuterBoxHeight-(BPlugWallHeight-1)])
        cube([WallThickness, OuterBoxWidth, OuterBoxHeight-(BPlugWallHeight-1)]);
        // Remove part of the other end wall
        translate([OuterBoxLength-(WallThickness),0,OuterBoxHeight-(BPlugWallHeight-1)])
        cube([WallThickness, OuterBoxWidth, OuterBoxHeight-(BPlugWallHeight-1)]);
        // Remove the USB Connector Hole
        translate([OuterBoxLength-WallThickness, (OuterBoxWidth/2)-7,USBZ])
        cube([USBConnectorLength,USBConnectorWidth, USBConnectorHeight]);
        // Remove the ControlBoardTop Space
        translate([OuterBoxLength-(CBLength+WallThickness+CBInstallOffsetAdjustment), (OuterBoxWidth/2)-(CBWidth/2),0])
        cube([CBLength,CBWidth, WallThickness]);
    }
    translate([OuterBoxLength-(CBLength+WallThickness+CBInstallOffsetAdjustment), (OuterBoxWidth/2)-(CBWidth/2),0])
    ControlBoardTop();
}

module BoxBottom() {
    difference() {
        // Primary Box
        cube([InnerBoxLength, InnerBoxWidth, InnerBoxHeight]);
        // Remove main center
        translate([WallThickness,WallThickness,WallThickness])
        cube([InnerBoxLength-(WallThickness*2), InnerBoxWidth-(WallThickness*2), InnerBoxHeight-WallThickness]);
        // Remove part of the end wall
        translate([0,WallThickness,BPlugWallHeight])
        cube([WallThickness, InnerBoxWidth-(WallThickness*2), InnerBoxHeight-(BPlugWallHeight)]);
        // Remove part of the other end wall
        translate([InnerBoxLength-WallThickness, WallThickness,BPlugWallHeight])
        cube([WallThickness, InnerBoxWidth-(WallThickness*2), InnerBoxHeight-(BPlugWallHeight)]);
        // Black Banana Plug Location
        translate([BPlugBlackX, BPlugBlackY, BPlugZ])
        rotate([0,90,0])
        cylinder(h=BPlugHeigth, d=BPlugDia, $fn=Smoothing, center=false);
        // Red Banana Plug Location
        translate([BPlugRedX, BPlugRedY, BPlugZ])
        rotate([0,90,0])
        cylinder(h=BPlugHeigth, d=BPlugDia, $fn=Smoothing, center=false);
        // Blue1 Banana Plug Location
        translate([BPlugBlue1X, BPlugBlue1Y, BPlugZ])
        rotate([0,90,0])
        cylinder(h=BPlugHeigth, d=BPlugDia, $fn=Smoothing, center=false);
        // Blue2 Banana Plug Location
        translate([BPlugBlue2X, BPlugBlue2Y, BPlugZ])
        rotate([0,90,0])
        cylinder(h=BPlugHeigth, d=BPlugDia, $fn=Smoothing, center=false);
    }
    // Insert the relay holder plate 12 is an arbitrary number to move the plate out of the way of the Banana plugs
    translate([(InnerBoxLength/2)-12, (InnerBoxWidth/2)-(RelayWidth/2),0])
    RelayBottom();
}


module ControlBoardTop() {
    difference(){
    union() {
        // Face Plate
        cube([CBLength,CBWidth, WallThickness]);
        // Standoff
        BoardStandoff(CBHole1X, CBHole1Y, CBHoleSpacer, CBHoleDia, WallThickness+(CBHoleSpacer/2),CBHoleHeight, CBHoleDia, WallThickness+(CBHoleHeight/2),"Red");
        // Standoff
        BoardStandoff(CBHole2X, CBHole2Y, CBHoleSpacer, CBHoleDia, WallThickness+(CBHoleSpacer/2),CBHoleHeight, CBHoleDia, WallThickness+(CBHoleHeight/2),"Blue");
        // Standoff
        BoardStandoff(CBHole3X, CBHole3Y, CBHoleSpacer, CBHoleDia, WallThickness+(CBHoleSpacer/2),CBHoleHeight, CBHoleDia, WallThickness+(CBHoleHeight/2),"Green");
        // Standoff
        BoardStandoff(CBHole4X, CBHole4Y, CBHoleSpacer, CBHoleDia, WallThickness+(CBHoleSpacer/2), CBHoleHeight, CBHoleDia, WallThickness+(CBHoleHeight/2),"Orange");
    }
    // View Port
    translate([CBDisplayOffsetY, CBDisplayOffsetX, 0])
    cube([CBDisplayLength, CBDisplayWidth, WallThickness]);
    // Rotary Encoder Port
    translate([CBREOffsetY, CBREOffsetX, WallThickness/2])
    cylinder(h=WallThickness, d=CBREDia, $fn=Smoothing, center=true);
    }
    // Internal Display Bezel
    difference() {
        translate([CBDisplayOffsetY-1, CBDisplayOffsetX-1, WallThickness])
        cube([CBDisplayLength+2, CBDisplayWidth+2, 3.7]);
        translate([CBDisplayOffsetY, CBDisplayOffsetX, WallThickness])
        cube([CBDisplayLength, CBDisplayWidth, 3.7]);
    }
}

module RelayBottom() {
    // Base Plate
    cube([RelayLength,RelayWidth, WallThickness]);
    // Standoff
    BoardStandoff(RelayHole1X, RelayHole1Y, RelayHoleSpacer, RelayHoleSpacerDia, WallThickness+(RelayHoleSpacer/2), RelayHoleHeight, RelayHoleDia, WallThickness+(RelayHoleHeight/2),"Red");
    // Standoff
    BoardStandoff(RelayHole2X, RelayHole2Y, RelayHoleSpacer, RelayHoleSpacerDia, WallThickness+(RelayHoleSpacer/2), RelayHoleHeight, RelayHoleDia, WallThickness+(RelayHoleHeight/2),"Blue");
    // Standoff
    BoardStandoff(RelayHole3X, RelayHole3Y, RelayHoleSpacer, RelayHoleSpacerDia, WallThickness+(RelayHoleSpacer/2), RelayHoleHeight, RelayHoleDia, WallThickness+(RelayHoleHeight/2),"Green");
    // Standoff
    BoardStandoff(RelayHole4X, RelayHole4Y, RelayHoleSpacer, RelayHoleSpacerDia, WallThickness+(RelayHoleSpacer/2), RelayHoleHeight, RelayHoleDia, WallThickness+(RelayHoleHeight/2),"Orange");
}

module BoardStandoff(XOffset, YOffset, BaseHeigth, BaseDia, BaseZ, PinHeigth, PinDia, PinZ, TagColor){
        color(TagColor)
        translate([XOffset, YOffset, BaseZ])
        cylinder(h=BaseHeigth, d=BaseDia+2, $fn=Smoothing, center=true);
        translate([XOffset, YOffset, PinZ])
        cylinder(h=PinHeigth, d=PinDia, $fn=Smoothing, center=true);
}


