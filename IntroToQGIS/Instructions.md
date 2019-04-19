# Intro To QGIS Workshop
Instructions &amp; data for an introductory QGIS workshop

## Workshop Description:

1:00-3:00 | Monday, October 8th, 2018 | DSI Classroom | room 360 Shields Library

2:00-4:00 | Monday, September 25th, 2017 | DSI Classroom | room 360 Shields Library

This workshop will introduce participants to QGIS, a powerful open source GIS software.  The workshop will cover typical basic GIS software workflow needs such as loading data, changing the way data is displayed, and where to find analysis tools.  In addition, participants will learn strategies for finding help with QGIS and tutorials for home learning. This workshop is not intended to teach all the concepts of GIS from the beginning (it's only 2 hours!), but rather to introduce those already familiar with the concepts of GIS to a new software option for applying those concepts.

## Prepare:
Bring your laptop with QGIS (2.18) installed - visit QGIS.org for free download

#### Are you new to GIS?
That's great!  You can still get a lot out of this workshop.  Just know that this workshop is not designed to teach you everything you need to know to do GIS effectively.  Just like you can't learn stats in an hour, a one-hour workshop can't teach you GIS. Here are some options for in-depth learning: 
 *  [A Gentle Introduction to GIS](http://docs.qgis.org/2.18/en/docs/gentle_gis_introduction/) is an accessible introduction.
 *  UC Davis has many [GIS courses](https://spatial.ucdavis.edu/teaching/). LDA 150 is a great class to start and is taught most Fall & Spring quarters.  
 *  The UC Davis Extension also offers [courses](https://extension.ucdavis.edu/certificate-program/geographic-information-systems).  
 *  More home learning options are listed at the bottom of this document.

## Table of Contents
1. Introduction
1. Demonstration: The Interface
1. Hands On: Exercises
1. Home Learning

# Introduction

## About QGIS:
QGIS (previously called Quantum GIS) is a free and open source desktop GIS software.  Since its initial development in 2002, QGIS has become one of the industry's leading software options for GIS.  QGIS is used by researchers across the world as well as by many California and Federal agencies.  QGIS allows users to access a number of other GIS software packages through it's graphical user interface including GRASS as well as user-contributed scripts and plug-ins.

QGIS runs on:

* Windows
* Mac
* Linux
* Android

## Data & File Compatibility
QGIS can read and write most **data** files that you've used in other GIS software packages.  Shapefiles, GeoTIFF, MrSIDD, etc. should all work as expected.  QGIS has the advantage of being able to read and write many open formats, most notably GeoJSON, which is a single file and human-readable, making it an excellent format for exchanging vector data.

What can't it read?  .mxd files are map files created by ESRI's proprietary software ArcGIS.  This is a file that points to datafiles on your computer and stores information about how you want to display the data.  It does not contain the data itself.  QGIS has a similar file format that ArcGIS cannot open with the extension .qgs

# DEMONSTRATION: Navigating the Interface

1.  Loading Data: Vector, Raster, CSV, Database, etc.
1.  Attribute Table
1.  Saving A Project
1.  Project Projection
1.  Changing Style/"Symbology"
1.  Analysis Tools
    *  Menus
    *  Processing Toolbox
    *  Plugins


See Also: [QGIS Training Manual: The Interface](http://docs.qgis.org/2.18/en/docs/training_manual/introduction/index.html)

# HANDS ON: Exercises
You'll use the QGIS Trainin Manual's exercises to learn about QGIS and get some experience operating the interface.  Note that these exercises have 3 levels of difficulty that are color-coded:

*  Basic: Green Label
*  Intermediate: Blue Label
*  Advanced: Red Label
    
Definitely try the green/basic exercises, and feel free to skip the blue/intermediate and red/advanced exercises as you see fit for your experience and interest.

Please complete the following items:

1.  Download the exercise data at the [QGIS Training Manual Site](http://docs.qgis.org/2.18/en/docs/training_manual/foreword/foreword.html#data)
1.  [QGIS Training Manual: The Interface](http://docs.qgis.org/2.18/en/docs/training_manual/introduction/index.html)
1.  [QGIS Training Manual: Creating a Basic Map](http://docs.qgis.org/2.18/en/docs/training_manual/basic_map/index.html) (Skip the section about the custom SVG fill.)
1.  Explore the [QGIS Training Manual](http://docs.qgis.org/2.18/en/docs/training_manual/index.html) for topics of particular interest to you.

# Home Learning:
The learning doesn't have to end when you leave the workshop!  We encourage you to continue to explore what QGIS has to offer and to find tools to help you with your analyses.

## Official 

Manual, Training Guide, Gentle Introduction to GIS [QGIS Docs](http://qgis.org/en/docs/index.html)

## Blogs & Online Learning

Gretchen Peterson: http://www.gretchenpeterson.com/blog/ 

Anita Graser: https://anitagraser.com/

Nyall Dawson: http://nyalldawson.net

Nathan Woodrow: https://nathanw.net/

And many more on [QGIS Planet](http://planet.qgis.org/planet/)


## Books

Learning QGIS

QGIS 2 Cookbook

QGIS Map Design

The Geospatial Desktop

QGIS By Example

QGIS Python Programming Cookbook

Mastering QGIS

... QGIS maintained [list of books](https://www.qgis.org/en/site/forusers/books/index.html) in print, ebook, or both.


## Other Resources
Another Useful Presentation: [Randal Hale's Intro to QGIS Slides](https://2016.foss4g-na.org/sites/default/files/slides/QGIS%20Workshop.pdf)
