PolarityFlipBox OpenSCAD case (3D model)
=====

## The Story

    I found a client that had a specific need that could not be met at the
    local electronics store or Amazon.  He wanted a portable device that
    could take a variable DC input (5V-24V), and flip the polarity on the
    output to change the direction of a DC motor.  He wanted it timed, from
    1 second to 1000 seconds between polarity flips adjustable in 1 second
    increments.  It was to keep doing this as long as it was on.

    So I designed the hardware first, then I designed a case in OpenSCAD to
    store it in and printed it out.

## Features

    Holds the Arduino, the display, and the rotary encoder on an old Radio
    Shack circuit board in the top 1/2 of the case.  And holds the relay in
    the bottom of the case.

## Usage
    
    Import the file into OpenSCAD and have fun.

## The source code

    PolarityFlipBox.scad	OpenSCAD source by David Mandala
    BoxBottom.stl		Generated by OpenSCAD
    BoxTop.stl			Generated by OpenSCAD
    CBTop.stl			Generated by OpenSCAD
    RelayBottom.stl		Generated by OpenSCAD    
    README.md		    	This file
 
## License

    The GPLv3 license only, no later versions. See GPLv3-LICENSE.txt
