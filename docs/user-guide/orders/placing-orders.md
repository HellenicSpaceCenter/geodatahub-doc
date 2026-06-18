# Placing an Order

This page walks you through the first stage of creating a new satellite data request: using the map interface to define your area of interest, select your time period, and choose the type of data you need.

---

## Starting a New Order

To begin creating an order, click **New Order** in the sidebar. You will be taken to the **order creation page** — an interactive map interface where you define the core parameters of your request.

!!! warning "Check your workspace first"
    Before creating an order, confirm that the correct workspace is active. The order will be attributed to the organization (or personal account) of the workspace you are currently using. See [Workspaces](../workspaces.md) for how to switch.

---

## The Order Creation Page

The map interface of the order creation page is your starting point for all new orders. It provides tools to define **where** and **when** you need data, and **what type** of satellite data you require.

![Order Creation Page](../img/order-creation/page.png)
///caption
The order creation page is an interactive map interface where you define the area of interest, date range, and data type for your satellite data request. Once these parameters are set, you can proceed to the detailed order specification form.
///

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

    Use the drawing tool to create a custom rectangular area directly on the map.

    1. Select the **Draw** option from the AOI section on the right panel
    2. Click on the map to place the top-left corner of your rectangle
    3. Expand the rectangle
    4. Click on the map again to place the bottom-right corner and finalize the AOI

    ![AOI from Drawing](../img/order-creation/aoi-from-drawing.png)

=== ":material-upload: Upload a File"

    Upload a pre-defined boundary from a spatial data file.

    Supported formats:

    - **GeoJSON** (`.geojson`)
    - **Shapefile** (`.shp` + associated files, typically provided as a `.zip`)
    - **KML** (`.kml`)

    1. Click the **Upload** button on the AOI section of the right panel
    2. Select your file
    3. The uploaded boundary will appear on the map

    !!! note
        For Shapefiles, ensure the projection is WGS84 (EPSG:4326) or a commonly supported CRS. The platform will attempt to re-project automatically, but results may vary.

=== ":material-map-marker: Use an Administrative Boundary"

    Select an existing Greek administrative unit as your AOI.

    1. Click the **Administrative Boundary** option in the AOI section of the right panel
    2. A dialog will open: search for a region, regional unit, or municipality by name (at least 4 characters)
    3. Select the administrative unit
    4. Click OK to set it as your AOI and close the dialog

    ![Search Administrative Unit](../img/order-creation/search-admin-unit.png)

    ![AOI from Administrative Boundary](../img/order-creation/aoi-from-admin.png)



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


![Date Range Selector](../img/order-creation/date-range-selector.png)
///caption
The date range selector allows you to define the time period for which you need satellite data. The selected range determines whether the order is archival (past) or tasking (future).
///

---

## Step 3: Select Data/Sensor Type [tasking orders]
> This step is activated for future orders only.


![Sensor Type Selection](../img/order-creation/sensor-type-selection.png)
///caption
After defining your area of interest and date range, select the type of satellite data you need. The available sensor types are Optical/Multispectral, Thermal Infrared, and Synthetic Aperture Radar (SAR).
///

Once your AOI and date range are set, select the **type of satellite data** you need:

| Sensor Type | Description | Typical Use Cases |
|-----------|-------------|-------------------|
| **Optical / Multispectral** | Standard visible-light and multispectral imagery | Land use mapping, vegetation analysis, urban monitoring |
| **Thermal Infrared** | Surface temperature measurements from infrared sensors | Urban heat islands, agricultural drought monitoring, wildfire detection |
| **Synthetic Aperture Radar (SAR)** | Radar-based imagery that penetrates clouds and works in all weather | Flood mapping, infrastructure monitoring, night-time acquisitions |

Select the sensor type that matches your application. This selection affects which data providers and products are available in the next step.

!!! info "Provider availability varies by sensor type"
    Not all satellite data providers offer every sensor type. For example, thermal infrared data may only be available from specific operators.

---


## Step 3: Discover data availability [archival orders]
> This step is activated for past date ranges only.

If the selected date range is in the past, GeoDataHub will automatically search the Hellenic Space Center's catalog for available data matching your AOI and date range. 

![Archive Search](../img/order-creation/archive-order-search.png)


The archive search results show the available data for your selected area of interest and date range. You will be presented with a list of available products, including their acquisition dates, sensor types, and coverage. The footprints of the available data are displayed on the map, allowing you to visually confirm coverage before proceeding. Hovering a product in the list will highlight its footprint on the map.

### Adding Products to Your Order

On each product you can click **+ Add** to include it in your order. Already selected products will show a **checkmark**.

![Basket with products](../img/order-creation/basket-with-products.png)
///caption
The basket provides a brief summary of your selected products before submission and allows you to proceed to the detailed order specification form. You can remove products form the basket by clicking the "x" button on the top-right of each product.
///





### Inspecting Product Details

Each product in the list has 3 buttons for inspecting its details:
    - Show/hide preview on the map
    - Zoom map to the product's bounding box
    - Open a dialog with detailed product information

![Visualize Product](../img/order-creation/visualize-product.png)
///caption
If a product has a preview available, you can add it to the map for visual inspection. 
///

![Product details](../img/order-creation/product-details.png)
///caption
The product details dialog provides comprehensive information, including acquisition date, sensor type, and coverage.
///


### Not found what you need?
If the archive search does not return any products for your selected area and date range, or if the available products do not meet your requirements, you can create a **tasking order** instead. 

![Fallback to tasking](../img/order-creation/fallback-to-tasking.png)

This will switch the panel to the tasking order workflow, allowing you to specify the sensor type and proceed to the next step, where you can specify your requirements for a new acquisition. This workflow is essentially a request to the HSC to acquire archival data from a third-party provider.
![alt text](../img/order-creation/archive-order-panel-fallback-to-tasking.png)

## Proceeding to create the order

Once you have defined:

- ✅ Area of interest
- ✅ Date range
- ✅ Sensor type (for tasking) or selected products (for archival)

The **basket** indicator at the top of the map page will become active, confirming you are ready to continue. Click **Proceed** to move to the full order specification form.

![Basket](../img/order-creation/basket-indicator.png)
///caption
The basket provides a brief summary of your selected parameters before submission, and allows you to proceed to the detailed order specification form.
///

!!! note "What happens next"
    Your order is created as a **Draft** and you are taken to the detailed order specification form. No request has been sent to HSC yet — the draft is only visible to you until you submit it.

---

## Next Step

- [Order Specification](order-specification.md) — Complete the detailed order form and submit to the Hellenic Space Center
