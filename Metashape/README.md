# Maptime Metashape workshop
Materials for Feb 25, 2020 #maptimeDavis workshop on Metashape photogrammetry

## Advance preparation (complete prior to start of workshop)

If you wish to follow allong, you will need to:

1. Install [Metashape Professional 1.6.1](https://www.agisoft.com/downloads/installer/). If you do not have a license, you can activate a 30-day trial license. Although a GPU is required for processing real datasets, it's OK if your laptop doesn't have one, as we are providing examples at multiple stages of processing for you to explore.

2. Clone this repository to your computer (it contains the data files we will be processing). (Total file size approx. XX GB.)

3. If you wish to follow along with the **scripted** workflow demo in addition to the GUI demo, you will also need to set up the standalone Metashape Python module and the UC Davis Metashape Workflows tool (follow Setup instructions [here](https://github.com/ucdavis/metashape)).

## Metashape GUI walkthrough

The steps we will walk through are the following:

*\* indicates this repo includes a Metashape project resulting from the associated step*

1. Add photos (Workflow -> Add folder; add the **XYZ** folder from this repo)
2. \*Align photos (Workflow -> Align photos)
3. Optimize cameras (Reference pane: Optimize cameras)
4. Build dense cloud (Workflow -> Build dense cloud)
5. \*Classify ground points (Tools -> Dense cloud -> Classify ground points)
6. Buld DEM (Workflow -> Build DEM)
7. Build orthomosaic (Workflow -> Build orthomosaic)
8. Export DEM and orthomosaic (File -> Export -> ...)

### Workflow parameter selection reference materials ###
- For a limited amount of information on the parameters to choose for each of these steps: [Agisoft Tutorial](https://www.agisoft.com/pdf/PS_1.3%20-Tutorial%20(BL)%20-%20Orthophoto,%20DEM%20(without%20GCPs).pdf)
- For more detailed descriptions of the reasons to select certain parameters, as well as additional quality refinements that are possible: [USGS Data Post-Processing Recommendations](https://uas.usgs.gov/nupo/pdf/PhotoScanProcessingDSLRMar2017.pdf) (though we find that more than one iteration of point cloud filtering is unnecessary)

## Metashape Batch tool for semi-scripted workflows

Found under Workflow -> Batch process.

## Scripted metashape workflow

This repo includes a configuration file that can be used to process the example photo set using the [UC Davis Metashape Workflow Tool](https://github.com/ucdavis/metashape). The configuration file is in `example_config_file/config_example.yml`. **Note that you need to change the absolute file paths in the config file to match your machine.** Assuming both the Metashape Workflow Tool ("metashape" repository) and this repository ("maptime-metashape-workshop") are in the same directory and that *that directory is your working directory*, you would run the workflow using the included configuration file as follows:

`python metashape/python/metashape_workflow.py maptime-metashape-workshop/example_config_file/config_example.yml`


