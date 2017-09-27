  
## Working in QGIS
Open QGIS

### Load Data
Import the vector data you would like to work with.  
* From this repository's [data folder](/Data): FOSS4G_Locations.geojson (locations of all of the FOSS4G conferences) and either the FOSS4G_Lines.geojson (straight lines between the conference locations) or FOSS4G_GreatCircles.geojson (great circle lines between the locations). 
* From the internet: [Natural Earth Country' 1:110m Cultural Admin-0 Country Boundaries](http://www.naturalearthdata.com/downloads/110m-cultural-vectors) and any other data you would like to add to your map (such as the Admin-1 States & Provinces Natural Earth data).

Order your layers with the countries on the bottom, then the lines, and points on top.  Save your work.

![QGIS Layers Loaded](/Images/QGIS_1_LayersLoaded.PNG)


### Use Custom SVG Markers in QGIS
I will assume you know how to change the colors of vector data in QGIS, so we won't go over that.  Instead, we'll focus on using custom SVG markers built in Inkscape.

Let's use the pin marker we made earlier: 
1. Open the layer properties for the point layer and click on the Style tab on the left side of the window.  
1. In the main part of the properties window, you'll see that your point layer was set by default to a "simple marker".  Click on the "Simple Marker" text in the white box to access options for changing the marker type.  
1. In the "Symbol layer type" drop down, select "SVG marker".  You will probably need to scroll down to see the SVG Groups and SVG Images section of the dialog.  Click the "..." button and navigate to where you saved your pin SVG file.  Select your file and click the "open" button.  (Alternatively you can put it in your User Symbols folder for QGIS to see it in the User Symbols SVG Group tree.)  The marker preview at the top of the window should have changed to a pin.  
1. Click "Apply" to see how it looks on your map.  Adjust the size of your pin marker to any size you like.  You can always make adjustments later.  Click "OK" to exit the dialog.
1. Save your work.

![Point Marker Dialog](/Images/QGIS_2_PointMarkerDialog.PNG)

![Pins on the Map](/Images/QGIS_3_PinsApplied.PNG)

You can also use SVG markers for lines.  The process is similar to what you just did with your point markers: make the SVG marker in Inkscape, load it into QGIS in the layer properties dialog, and set some parameters.  To save some time, I pre-made an SVG for you to try with your lines layer that looks like a single twist of rope.  You can use this to make your line look like string.
1. Find the Rope_Segment.svg file in the [Pre-Made SVGs Folder](/Pre-Made_SVGs) of this repository.  You'll also see that there's a pin svg in case you want to see what my version looks like.  Alternatively, you can make your own rope segment in Inkscape using the skills you just learned with the Pen Tool and Node Editor to make a similar shape.  The key to success is to make sure the left and right side of the shape fit together well when the image is repeated next to each other.  It's fiddly so I made one for you.
1. Open the Layer Properties dialog for the lines layer and go to the Style tab, just like before.
1. In the white box, click on the "Simple line" text.
1. In the "Symbol layer type" drop-down menu, pick "Marker line".  Notice that you have a longer tree of layers in the white box.
1. In the white box, click the "Simple marker" text.
1. Change the "Symbol layer type" drop-down menu selection to "SVG marker".
1. Similar to what we did before, use the "..." button to open the dialog to find and select your Rope_Segment.svg and click the "Open" button.  It may be hard to see since the rope segment colors are similar to the dialog box, but you should see what looks like a tan dashed line in the preview.
1. Adjust the size of the segments in the "Size" parameter box.  For now, pick something like 4 milimeters to be able to see the segments.  They don't fit together yet, but we'll fix that next.
1. Up at the top of the dialog, in the white box, click on the "Marker line" text.  The radio button next to "with interval" should be selected.  Change the spacing to make no space between the segments. 1.6 milimeters worked for me.  Apply these changes to the canvas with the "Apply" button.  If you like what you see, click "OK" to close the dialog, otherwise, make some more adjustments.  NOTE: A process similar to what we just did [can also be done in Inkscape](https://inkscapetutorials.org/2014/10/20/use-inkscape-to-draw-vector-rope-in-any-shape/), but it tends to work better on gentle curves.

![String Lines](/Images/QGIS_4_String.PNG)

At this point, you'll want to get an idea of what your final map will look like.  I sometimes use a [Google Image](https://images.google.com) search to get some ideas.  For example, if you want to continue with the map pin board theme, try googling related keywords to see what kinds of map pin boards there are.  Do you want to label the locations?  Do you want lines for states and provinces?  Maybe you want some city names or graticule lines?  Get everything into the canvas you think you'll need for your final map.  It doesn't have to look nice at all yet, but unless you want to add it by hand later, you'll want to put it in now.

Helpful Links:
* [Multiline Labels in QGIS](https://anitagraser.com/2011/06/15/multi-line-labels-in-qgis/) from Anita Graser
* [QGIS Training Manual Print Composer Tutorial](http://docs.qgis.org/2.14/en/docs/training_manual/map_composer/index.html)



Here's an example of a map I created with the same data you're working with.  I liked the idea of the textured string, but it was just too cluttered for my map, so I left it out.  I've included annotations on my map so you can learn how the effects were done.  None of it is fancy or difficult.  It's mostly just layering items.
![Example Map with Annotations](/Images/PinMap_Annotations.png)