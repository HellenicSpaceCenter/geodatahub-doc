# Placing an Order

This page walks you through the first stage of creating a new satellite data request: using the map interface to define your area of interest, select your time period, and choose the type of data you need.

---

## Starting a New Order

To begin creating an order, click **New Order** in the sidebar. You will be taken to the **order creation map** — an interactive map interface where you define the core parameters of your request.

!!! warning "Check your workspace first"
    Before creating an order, confirm that the correct workspace is active. The order will be attributed to the organization (or personal account) of the workspace you are currently using. See [Workspaces](../workspaces.md) for how to switch.

---

## The Order Creation Map

The map interface is your starting point for all new orders. It provides tools to define **where** and **when** you need data, and **what type** of satellite data you require.

### Map Controls

**Base Map**

You can switch between three base map views:

=== ":material-satellite: Satellite View"
    High-resolution aerial/satellite background imagery — useful for visually identifying your area of interest.

=== ":material-map: Street Map"
    Standard road and place-name map — useful for navigating to urban or administratively-defined areas.

=== ":material-layers-off: No Base Map"
    A blank canvas — useful if you are uploading your own boundaries and do not need a reference layer.

**Administrative Boundary Layers**

Three optional overlay layers help you navigate Greece's administrative divisions:

| Layer | Description |
|-------|-------------|
| **Regions** | The 13 regions of Greece (Περιφέρειες) |
| **Regional Units** | Sub-divisions within each region |
| **Municipalities** | The most granular administrative level |

Toggle these layers on or off to help locate your area of interest and use them as reference boundaries.

---

## Step 1: Define Your Area of Interest

Your **area of interest (AOI)** is the geographic boundary that defines where you need satellite data. GeoDataHub supports three methods for defining your AOI:

=== ":material-draw: Draw on Map"

    Use the drawing tool to create a custom polygon directly on the map.

    1. Select the **Draw** tool from the map toolbar
    2. Click on the map to place the first vertex of your polygon
    3. Continue clicking to add additional vertices
    4. Close the polygon by clicking on the first vertex or double-clicking

    After drawing, you can adjust the shape by dragging individual vertices.

    !!! tip
        Drawing is ideal for irregular areas that don't align with administrative boundaries.

=== ":material-upload: Upload a File"

    Upload a pre-defined boundary from a spatial data file.

    Supported formats:

    - **GeoJSON** (`.geojson`)
    - **Shapefile** (`.shp` + associated files, typically provided as a `.zip`)
    - **KML** (`.kml`)

    1. Click the **Upload** button in the map toolbar
    2. Select your file
    3. The uploaded boundary will appear on the map

    !!! note
        For Shapefiles, ensure the projection is WGS84 (EPSG:4326) or a commonly supported CRS. The platform will attempt to re-project automatically, but results may vary.

=== ":material-map-marker: Use an Administrative Boundary"

    Select an existing Greek administrative unit as your AOI.

    1. Enable the appropriate administrative layer (Regions, Regional Units, or Municipalities)
    2. Click on the administrative unit you want to use
    3. The unit's boundary will be set as your area of interest

    !!! example
        To request data for the entire Region of Crete, enable the **Regions** layer, then click on Crete on the map. The full regional boundary will be set as your AOI automatically.

---

## Step 2: Select Your Date Range

After defining your AOI, you must specify the **time period** for which you need data using the date range selector.

The date range you select determines the **type of order** that will be created:

!!! abstract "How dates determine order type"

    === "Past Dates → Archival Order"

        If your date range starts and ends **in the past**, GeoDataHub will create an **archival order**.

        - HSC searches its catalog for existing data matching your parameters
        - If catalog data is not available, HSC may source it from a third-party provider
        - Fulfillment is generally faster than tasking orders

    === "Future Dates → Tasking Order"

        If your date range starts **today or in the future**, GeoDataHub will create a **tasking order**.

        - HSC will schedule an acquisition with the microsatellite constellation
        - Alternatively, a tasking request is placed with a commercial satellite operator
        - Fulfillment depends on satellite orbital schedules

### How to Set Dates

1. Click the date range selector
2. Click to set your **start date**
3. Click to set your **end date**
4. Click **Apply** to confirm the selection

!!! warning "Mixed date ranges"
    You cannot mix past and future dates in a single order. The selector enforces this automatically:
    
    - Once you select a past start date, only past dates are selectable for the end date
    - Once you select a present or future start date, only present and future dates are selectable for the end date
    
    If you need both archival and future data for the same area, create two separate orders.

---

## Step 3: Select Data Type

Once your AOI and date range are set, select the **type of satellite data** you need:

| Data Type | Description | Typical Use Cases |
|-----------|-------------|-------------------|
| **Optical / Multispectral** | Standard visible-light and multispectral imagery | Land use mapping, vegetation analysis, urban monitoring |
| **Thermal Infrared** | Surface temperature measurements from infrared sensors | Urban heat islands, agricultural drought monitoring, wildfire detection |
| **Synthetic Aperture Radar (SAR)** | Radar-based imagery that penetrates clouds and works in all weather | Flood mapping, infrastructure monitoring, night-time acquisitions |

Select the data type that matches your application. This selection affects which data providers and products are available in the next step.

!!! info "Provider availability varies by data type"
    Not all satellite data providers offer every data type. For example, thermal infrared data may only be available from specific operators. The available providers are shown after you select your data type.

---

## Proceeding to the Order Form

Once you have defined:

- ✅ Area of interest
- ✅ Date range
- ✅ Data type

The **basket** indicator at the top of the map page will become active, confirming you are ready to continue. Click **Proceed** to move to the full order specification form.

!!! note "What happens next"
    Your order is created as a **Draft** and you are taken to the detailed order specification form. No request has been sent to HSC yet — the draft is only visible to you until you submit it.

---

## Next Step

- [Order Specification](order-specification.md) — Complete the detailed order form and submit to the Hellenic Space Center
