# Custom Cartographic Symbols

## Description:
Workshop participants will learn some common tools in Inkscape, an open source vector illustration program, with the goal of creating a file that can be used as a point marker in a GIS program.

## Graphical Plan
**Inkscape:** Make Map Symbols --> **QGIS:** Compose a Map --> **Inkscape:** Finishing, Design Work

## Outline
1. Getting Started
  
1. Intro to Inkscape
   1. Demonstration: You Already Know This!
   1. Hands-On: Make a Pin Icon in Inkscape
  
2. Using your marker in a GIS (separate document)

## Getting Started
You should already have installed:
* QGIS (2.18)
* Inkscape (0.92)

## Data
Data to use in this workshop is in the [Data Folder](https://github.com/MicheleTobias/OpenSourceCartography/tree/master/Data)

Other potential data sources for your maps: [Michele's List of Data Sources](https://docs.google.com/spreadsheets/d/1964wpzdUZJElZ7xsF740BMiLcTtga82jEOnkHF7wyHU/edit?usp=sharing)

## Intro to Inkscape
### Demonstration: You Already Know This!
   1. Concept of vectors (points, lines, polygons) vs. rasters (images)
   1. Window Overview
   1. GIS-Similar Concepts
       1. Merge/Clip/Union/Etc.
       1. Layers
       1. Fill & Stroke = Symbology
       
### Hands-On: Make a Pin Icon in Inkscape
Let's learn to use Inkscape while making something we can use later: an icon to represent a point.  I'll walk you through how to make a map pin icon, but feel free to make your own version!  *Something to remember: SAVE OFTEN! Just like GIS, vector illustration programs can be a little unstable. Save every time you think you might want to.*

Open Inkscape.  Let's learn a little about the interface.
![Inkscape Interface Tour](/CustomCartographicSymbols/Images/InkscapeTour.png)

There are a lot of toolbars.  Here's a cheatsheet for the main ones:
![Toolbars Cheatsheet](/CustomCartographicSymbols/Images/Toolbars.png)
I'll assume you can use this image to help you locate tools.  If I don't explain how to find a tool, use this image to help you find it in the interface.

Draw a circle in the middle of your canvas using the Cirlce & Elipse tool. ![Circle Tool](/CustomCartographicSymbols/Images/Tool_Circle.PNG)  Hold down Ctrl while drawing your circle to make a perfect circle (instead of an elipse which is longer in one dimension).  Save.

![Draw a Circle](/CustomCartographicSymbols/Images/Pin_1_Circle.png)

Select your cirle with the Select & Transform Objects tool ![Select Tool](/CustomCartographicSymbols/Images/Tool_Select.PNG) and then Open the Fill & Stroke dialog. ![Fill and Stroke Dialog](/Images/Tool_FillStroke.PNG)  You can set the fill & stroke either in this dialog or on the pallette at the bottom of the screen. Set the fill to an orange color and the stroke to a darker orange.  Save.

![Make the Circle Orange](/CustomCartographicSymbols/Images/Pin_2_OrangeCircle.png)

Now use the rectangle tool ![Rectangle Tool](/CustomCartographicSymbols/Images/Tool_Rectangle.PNG) to draw a skinny, tall rectangle. Make the fill a medium gray and the stroke a dark gray.  Save.

![Add a Gray Rectangle](/CustomCartographicSymbols/Images/Pin_3_Rectangle.png)

Before this will look like a pin at all, we need to do some arranging. Open the Align & Distribute dialog. ![Align Tool](/CustomCartographicSymbols/Images/Tool_Align.PNG) Select your circle with the Select tool, then hold down Shift and select the rectangle.  Now both the circle and rectangle are selected.  Change the drop-down in the Align dialog to "First Selected" and the click the button to "Center on Vertical Axis" (hover over the buttons to get a tool tip with the name of the buttons).  Now your rectangle should be in the middle of your circle.  Save.

![Align objects](/CustomCartographicSymbols/Images/Pin_4_Align.png)

You'll probably want to move the rectangle so it's near the bottom of the circle.  Select the rectangle and use the arrow keys on your keyboard to move it down.  Hold Shift with the arrow keys to move objects in larger jumps.    Save.

![Align objects](/CustomCartographicSymbols/Images/Pin_5_Move.png)

Looking better!  But the rectangle should really be underneath the circle.  Select the rectangle.  On the left side above the canvas, you'll see that the tool bar has options to raise and lower items relative to each other.  Use "Lower Selection to Bottom" ![Send to Back Tool](/Images/Tool_SendToBack.PNG) to put the rectangle below the circle.  Now it's really starting to look like a pin!  Save.

![Change the order](/CustomCartographicSymbols/Images/Pin_6_Order.png)

We could use our drawing just the way it is, but let's add a few more elements to make it look more realistic and to learn a few more tools.  First, let's give the pin's stem some dimension by rounding the end of the rectangle.  Select the rectangle and read the text at the bottom of the screen: "**Rectangle** in layer **Layer 1**."  This tells us that the type of object we've selected is a rectangle.  To edit the rectangle more than just changing it's size, we'll need to turn it into a Path.  With the rectangle selected, click the Path menu at the top of the screen and select "Object to Path".  Select the Node Editing tool ![Node Tool](/Images/Tool_Node.PNG), then click on the rectangle.  You should see that each corner now has a little diamond-shaped node.

![Nodes Active](/CustomCartographicSymbols/Images/Pin_7_NodesActive.PNG)

With the node tool still active, click on the line segment between the bottom two nodes. The two bottom nodes will be highlighted to show they are selected (they turn blue on my personal computer, but that might vary depending on operating system and such).

![Selected Nodes](/CustomCartographicSymbols/Images/Pin_8_SelectedNodes.PNG)

The tool menu above your canvas has changed to show tools relevant to working with nodes.  Click the button to "Make Selected Segments Curves" ![Curve Segments Tool](/CustomCartographicSymbols/Images/Tool_CurveSegment.PNG).  Little circles will appear to indicate the Bezier curve handles, but they are hard to see since they are inline with the bottom of the rectangle.  Zooming in with the zoom settings in the lower right corner of the screen can help.  Click one handle and drag it to see how it affects the line segment.  Adjust both handles to make a relatively symetrical curve at the bottom of your pin.  Save.

![Curve Handles](/CustomCartographicSymbols/Images/Pin_9_CurveHandles.PNG)

Let's make the pin look shiny.  This will be a good opportunity to test out some of the things you've learned.  Using the Pen (Bezier Curve) Tool ![Pen Tool](/CustomCartographicSymbols/Images/Tool_Bezier.PNG), draw an elongated triangle along the upper left side of the pin - one click for each corner of the triangle and a final 4th click on the first corner to close up the polygon.  Select your new triangle with the selection tool (the arrow) to make it active, then change the fill to a light orange.  You can either remove the stroke or set it to the same light orange color.  Save.

![Triangle Shine](/CustomCartographicSymbols/Images/Pin_10_TriangleShine.PNG)

Using the Node Tool like before, round the two longer sides to make the pin look curved.  Save.

![Curved Triangle](/CustomCartographicSymbols/Images/Pin_11_CurvedTriangle.PNG)

And add some shine to the pin stem with a smaller rectangle of a lighter gray on top of your pin's stem. Curve the top and bottom edges to make it look 3 dimensional.  Save.

![All Done](/CustomCartographicSymbols/Images/Pin_12_Finished.png)

Adjust the page size: In the File menu, click on Document Properties.  In the Custom Size section, expand the "Resize page to content..." section by clicking on the little + sign.  Make sure nothing in your drawing is selected by clicking in a blank space.  Click the "Resize page to drawing or selection" button.  The page boundary should now hug the edge of your drawing.  Save one final time, close Inkscape, and you'll be ready to use your new pin marker in QGIS or ArcGIS!

[Instructions for using your marker in QGIS](/CustomCartographicSymbols/WorkingInQGIS.md)

[Instructions for using your marker in ArcGIS](/CustomCartographicSymbols/WorkingInArcGIS.md)

