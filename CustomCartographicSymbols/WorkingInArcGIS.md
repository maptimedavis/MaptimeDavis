Now you're almost ready to use your pin icon in a map in ArcGIS.

Fist, ArcGIS requires that we use a .emf (Enhanced Metafile) file, so here's how we do that:
1. If it's not already open, open your pin .svg file that you were just working on in the [Instructions Document](/CustomCartographicSymbols/Instructions.md) in Inkscape.
2. Click the File menu (upper left corner), choose Save As.
3. In the "Save Type As" dropdown menu at the bottom of the Save As dialog, select "Enhanced Metafile (.emf)", and click the Save button to finish.
4. In the EMF Output window that pops up, make sure you check the option to "Convert Text to Paths".

Now we can use our pin in ArcMap
1. Open ArcMap
2. Load the FOSS4G Locations point layer and the country boundaries you downloaded earlier.


3. In ArcGIS - Symbol Properties --> choose Picture marker Symbol Type --> browse to EMF file

* can't chance the colors in ArcMap

Alternative is to convert it to a font, then you can change the colors.

Reference: https://gis.stackexchange.com/questions/32271/creating-new-custom-vector-marker-symbol-for-arcmap
