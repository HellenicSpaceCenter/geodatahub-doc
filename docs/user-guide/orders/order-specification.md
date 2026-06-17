# Order Specification & Submission

After defining your area of interest, date range, and data type on the map, you are directed to the **order specification form**. This form collects the detailed parameters HSC needs to fulfill your request. Once complete, you will submit the order for HSC review.

---

## Overview

The order specification form is organized into logical groups of parameters. Some fields are required; others allow you to refine your request or leave the decision to HSC.

!!! note "Draft status"
    When you arrive at this form, your order is in **Draft** status. Nothing has been sent to HSC yet. You can save and return to complete the form at any time.

---

## Completing the Order Form

### Time Series

**Do you need multiple acquisitions throughout your selected period?**

=== "No (Single Acquisition)"
    HSC will provide one acquisition that best matches your requirements within the specified date range. This is the default for most use cases.

=== "Yes (Time Series)"
    HSC will provide a **series of acquisitions** throughout the selected period. Use this option if your analysis requires temporal change detection or monitoring over time.

    !!! example "When to use time series"
        If you selected a 30-day date range and want weekly snapshots to monitor vegetation growth, enable the time series option.

---

### Spatial Resolution

Specify the desired spatial resolution for your data. This determines the level of ground detail visible in the imagery.

- Leave this field unspecified to accept any resolution the available provider can offer
- Select a specific resolution if your analysis has minimum resolution requirements

!!! tip "Resolution and availability"
    Higher resolution data (e.g. sub-meter) significantly narrows the pool of providers and products that can fulfill your order, and may increase processing time. Only specify a resolution if it is a firm technical requirement.

---

### Data Provider

Select which satellite data provider should fulfill your order.

=== "Any Provider (Recommended)"
    HSC will select the most appropriate provider based on your requirements and availability. This gives HSC the most flexibility to fulfill your order quickly.

=== "Specific Provider"
    Choose a named satellite operator. The available providers depend on the **data type** you selected in the previous step.

    !!! info "Provider availability by data type"
        Provider options are dynamically filtered based on your selected data type. For example, thermal infrared data is available only from operators whose satellites carry thermal infrared sensors. Optical data has a broader selection of providers.

---

### Data Product

Select a specific satellite data product within the chosen provider's catalog.

=== "Any Product"
    HSC will select the most appropriate product available. Recommended if you do not have specific product requirements.

=== "Specific Product"
    Choose a named product from the provider's catalog. Use this if your analysis pipeline requires a particular processing level, band combination, or delivery format.

---

### Cloud Cover

*Applicable to optical and multispectral data.*

Cloud cover specifies the maximum acceptable percentage of the scene that can be obscured by clouds.

=== "No Preference"
    HSC will include acquisitions regardless of cloud cover. Useful when any data is better than none (e.g., for archival research where alternatives are limited).

=== "Specify Maximum"
    Use the slider to set a maximum cloud cover threshold (0–100%).

    | Value | Interpretation |
    |-------|----------------|
    | 0% | Cloud-free acquisitions only |
    | 10–20% | Suitable for most analysis applications |
    | 30–50% | Acceptable for coarser temporal monitoring |
    | > 50% | Only appropriate when data availability is more important than quality |

    !!! note
        Cloud cover filtering is only relevant for optical and multispectral data. For SAR and thermal data, cloud cover does not affect image quality and this setting will be ignored.

---

### Sensor Angle

Specify the maximum acceptable off-nadir (sensor) angle for the acquisition.

=== "No Preference"
    HSC and the provider will select the acquisition geometry that maximizes data availability.

=== "Specify Maximum Angle"
    Use the slider to set the maximum off-nadir angle. Lower angles (closer to nadir) provide more geometrically accurate imagery but reduce the available acquisition windows.

    !!! tip "Nadir vs. off-nadir"
        A nadir acquisition (0°) images directly below the satellite — best for orthophoto and mapping applications. Off-nadir acquisitions can cover your AOI even when the satellite's ground track does not pass directly overhead, increasing revisit frequency at the cost of geometric accuracy.

---

### Post-Processing

Indicate whether you need any post-processing applied to the raw data before delivery.

Options vary by provider and data type. Common post-processing services include:

- Atmospheric correction
- Orthorectification
- Pansharpening
- Band composition / indices calculation

If you are unsure, leave this set to **None** and discuss processing needs with HSC through the order comments.

---

### Priority / Urgency

Indicate whether your order should be treated as urgent.

=== "Standard Priority"
    Your order will be processed in the standard queue. Recommended for most requests.

=== "Urgent"
    Your order will be flagged for expedited processing. 

    !!! warning "Urgency requires justification"
        If you mark an order as urgent, you **must** provide a written explanation of why the request is time-sensitive. HSC will review the justification and may contact you for clarification.

---

### Intended Use Description

Provide a brief description of how you intend to use the data.

!!! abstract "Required field"
    This field is **required** before you can submit the order. Describe the project, application, or analysis that the satellite data will support.

    Examples:
    
    - *"Monitoring coastal erosion in Thessaloniki following storm events for the Ministry of Environment"*
    - *"Multi-temporal land cover classification for the Hellenic Cadastre's national mapping program"*

---

## Saving Your Progress

Click **Save and Continue** at the bottom of the form to save your progress and proceed to the submission page.

!!! note
    Saving does not submit the order. The order remains in **Draft** status and can be edited until you formally submit it.

---

## Submitting the Order

After saving the form, you are taken to the **submission page** — the final step before your order is sent to HSC.

### Submission Checklist

Before submitting, review:

- [ ] Area of interest is correctly defined
- [ ] Date range matches your data needs (past = archival, future = tasking)
- [ ] Data type is correct
- [ ] All required fields are completed
- [ ] Active workspace is the correct organization

!!! warning "Confirm your workspace at submission"
    The submission page displays a reminder of which workspace (and therefore which organization) you are acting on behalf of. **Read this carefully.** Submitting on behalf of the wrong organization cannot be undone.

    > *"You are submitting this order on behalf of [Organization Name]"*

### Confirming Submission

1. Review all displayed parameters on the submission page
2. Click **Submit**
3. A confirmation dialog will appear asking you to confirm the action
4. Click **Confirm** to finalize

!!! info "Submission is final"
    Once submitted, the order is sent to HSC and its status changes to **Submitted**. You cannot edit the order parameters after submission. If you need to make changes, you must cancel the order (while it is still in Submitted status) and create a new one, or use the **Duplicate** action to start from a copy.

### After Submission

- Your order status changes from **Draft** to **Submitted**
- HSC will receive and review your order
- You will receive a notification when HSC responds (accepts, requests clarification, or rejects the order)
- You can track progress at any time from the [Orders list](managing-orders.md)

---

## Reference: All Form Fields

??? abstract "Complete field reference"

    | Field | Required | Description |
    |-------|----------|-------------|
    | **Time Series** | Yes | Single acquisition or multiple acquisitions throughout the period |
    | **Data Type** | Yes | Optical/multispectral, thermal infrared, or SAR (set in previous step) |
    | **Spatial Resolution** | No | Desired ground resolution; leave blank for any |
    | **Data Provider** | No | Specific satellite operator or any |
    | **Data Product** | No | Specific product or any |
    | **Maximum Cloud Cover** | No | Only for optical data; percentage threshold |
    | **Maximum Sensor Angle** | No | Off-nadir angle limit |
    | **Post-Processing** | No | Processing services to apply before delivery |
    | **Priority / Urgency** | Yes | Standard or urgent (urgent requires justification) |
    | **Urgency Justification** | Conditional | Required only if priority is set to urgent |
    | **Intended Use Description** | Yes | Description of how the data will be used |
    | **Additional Comments** | No | Any other information for HSC |
