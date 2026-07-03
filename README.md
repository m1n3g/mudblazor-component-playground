# Development Log
A visual reference playground for mapping MudBlazor components to Figma design system components.

## Development Log

### Dev Branch Update

This update focuses on upgrading the project platform and cleaning up compatibility issues after migrating to newer framework and component versions.

#### Upgrade Summary

The project has been upgraded from:

- .NET 8 to .NET 10
- MudBlazor 8.11.0 to MudBlazor 9.6.0
- Blazor WebAssembly packages aligned to version 10.0.0

Updated project configuration:

- [`MudPlayground.csproj`](./MudPlayground.csproj)

#### MudBlazor v9 Migration Cleanup

Several MudBlazor API and parameter changes were updated across the demo app to keep the project compatible with MudBlazor 9.6.0.

Updated areas include:

- Shared layout compatibility
- Component parameter changes
- Chart model migration
- Form validation behavior
- Select and multiselect binding
- TreeView callback types
- File upload templates
- Removed or changed MudBlazor components

Key changes include:

- Added `@using MudBlazor.Charts` in [`_Imports.razor`](./_Imports.razor)
- Updated parameters such as `MiniWidth`, `ChartLabels`, `TabPanelsClass`, `ShowCloseIcon`, and `CloseIconClicked`
- Updated accessibility-related attributes such as lower-case `aria-label`
- Removed unsupported `Rounded` parameter from [`MudAlertDemo.razor`](./Pages/Components/Feedback/MudAlertDemo.razor)
- Migrated chart demos to the newer generic chart model
- Reworked removed component usage in [`MudChatDemo.razor`](./Pages/Components/DataDisplay/MudChatDemo.razor)
- Adjusted timeline compatibility in [`MudTimelineDemo.razor`](./Pages/Components/DataDisplay/MudTimelineDemo.razor)
- Added a standard line chart fallback for [`MudTimeSeriesChartDemo.razor`](./Pages/Components/Charts/MudTimeSeriesChartDemo.razor)

#### Updated Demo Pages

The following demo pages were updated as part of the compatibility pass:

- [`MudAlertDemo.razor`](./Pages/Components/Feedback/MudAlertDemo.razor)
- [`MudChatDemo.razor`](./Pages/Components/DataDisplay/MudChatDemo.razor)
- [`MudTimelineDemo.razor`](./Pages/Components/DataDisplay/MudTimelineDemo.razor)
- [`MudTimeSeriesChartDemo.razor`](./Pages/Components/Charts/MudTimeSeriesChartDemo.razor)
- [`MudFormDemo.razor`](./Pages/Components/Inputs/MudFormDemo.razor)
- [`MudSelectDemo.razor`](./Pages/Components/Inputs/MudSelectDemo.razor)
- [`MudTreeViewDemo.razor`](./Pages/Components/DataDisplay/MudTreeViewDemo.razor)
- [`MudFileUploadDemo.razor`](./Pages/Components/Inputs/MudFileUploadDemo.razor)

#### Current Status

- Branch: `dev`
- Modified files: `19`
- Target framework: `.NET 10`
- MudBlazor version: `9.6.0`
- Build result: `0 warnings, 0 errors`

The project now builds successfully on .NET 10 with MudBlazor 9.6.0 and is ready for continued component reference development.


#### Components haven't create
- Container, Grid, Hidden, Stack, Autocomplete, Field, Focus Trap, Highlighter, DataGrid, Drop Zone, Image, Popover, Message Box, Overlay
