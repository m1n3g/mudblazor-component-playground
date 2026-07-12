# Changelog

A visual reference playground for mapping MudBlazor components to Figma design system components.

## 2026-07-03

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

#### Components Haven't Create

- Container, Grid, Hidden, Stack, Autocomplete, Field, Focus Trap, Highlighter, DataGrid, Drop Zone, Image, Popover, Message Box, Overlay

#### Local Run / Startup Issue

During repeated `dotnet run` cycles, the app intermittently got stuck at the Blazor WebAssembly loading screen (`99%`) and showed the generic message `An unhandled error has occurred`.

Two issue sources were identified:

- Local ASP.NET Core HTTPS development certificate was in an invalid state on macOS
- App startup had duplicated theme-provider setup and a render-time theme detection path that could fail during initialization

Environment fix performed locally:

- Ran `dotnet dev-certs https --clean`
- Ran `dotnet dev-certs https`
- Ran `dotnet dev-certs https --trust`
- Verified with `dotnet dev-certs https --check`

Code-level mitigation applied:

- Removed the extra `MudThemeProvider` from [`App.razor`](./App.razor)
- Kept the single `MudThemeProvider` in [`MainLayout.razor`](./Layout/MainLayout.razor)
- Wrapped `GetSystemDarkModeAsync()` in a safe `try/catch` so theme detection cannot break app startup
- Removed `FocusOnNavigate` from [`App.razor`](./App.razor) to reduce one more startup-time client-side step
- Added no-cache meta tags to [`wwwroot/index.html`](./wwwroot/index.html) to reduce stale asset issues during reruns

Result:

- Build remains clean with `0 warnings, 0 errors`
- Local rerun stability improved after certificate repair and startup simplification

## 2026-07-09

### Startup and Local Run Stability

This update focused on fixing repeated local Blazor WebAssembly startup failures after rebuilds and browser refreshes.

Changes made:

- Removed the manual `aspnetcore-browser-refresh.js` reference from [`wwwroot/index.html`](./wwwroot/index.html)
- Removed temporary startup diagnostics that had been added during troubleshooting
- Restored the normal app startup flow in [`App.razor`](./App.razor) and [`Program.cs`](./Program.cs)
- Cleaned invalid HTML comments out of [`Layout/MainLayout.razor`](./Layout/MainLayout.razor)
- Updated [`wwwroot/index.html`](./wwwroot/index.html) to use `Blazor.start(...)` with a safer boot-resource loader
- Kept a special case for `dotnetjs` so Blazor receives the required URI string
- Applied `cache: "no-store"` to boot-resource fetches to reduce stale hashed `.wasm` and related asset mismatches during local reruns

Result:

- `dotnet build` succeeds with `0 warnings` and `0 errors`
- Local startup now works again after the loader fix

### MudAlert Demo Layout Update

The left options panel spacing was adjusted in [`Pages/Components/Feedback/MudAlertDemo.razor`](./Pages/Components/Feedback/MudAlertDemo.razor):

- Changed `me-md-4` to `me-md-6`
- This increases the medium-and-up end margin from `16px` to `24px`

### New Working Rule

A new project guideline has been added in [`GUIDELINES.md`](./GUIDELINES.md):

- Treat [`wwwroot/index.html`](./wwwroot/index.html) as a protected file
- Do not modify it by default
- Ask for user approval first before changing it again

### Docker Setup

Docker support was added so the Blazor WebAssembly app can be built and run in containers for both standard hosting and development workflows.

Changes made:

- Added a multi-stage [`Dockerfile`](./Dockerfile) to restore, publish, and package the app
- Added [`nginx.conf`](./nginx.conf) to serve the published `wwwroot` output with SPA fallback routing
- Added [`.dockerignore`](./.dockerignore) to keep build context smaller and exclude local artifacts
- Added [`docker-compose.yml`](./docker-compose.yml) for the default container run setup
- Added [`docker-compose.dev.yml`](./docker-compose.dev.yml) for development and hot-reload workflow
- Updated [`.gitignore`](./.gitignore) to ignore local Docker data, logs, and environment files while keeping Docker project files tracked

Result:

- The project now has a versioned Docker setup for build, runtime, and development use
- Docker-related project configuration is ready to commit with the rest of the repo

### Docker Dev Workflow Fix

The Docker development workflow was adjusted after VS Code showed many false Razor warnings such as unresolved `MudGrid`, `MudItem`, and `MudAlert` components.

Cause identified:

- The development container mounted the project into `/src`
- Container restore/build output wrote Linux paths into the host `obj` folder
- VS Code on Windows then read stale `/src` and `/root/.nuget/packages` metadata and could not resolve MudBlazor components correctly

Changes made:

- Updated [`docker-compose.dev.yml`](./docker-compose.dev.yml) to store `/src/obj` and `/src/bin` in Docker named volumes
- Removed stale host `bin` and `obj` folders
- Ran `dotnet restore` on the host to regenerate Windows-path Razor and NuGet metadata
- Verified `dotnet build MudPlayground.csproj --no-restore` succeeds with `0 warnings` and `0 errors`
- Rebuilt and restarted the Docker dev workflow successfully

Result:

- The Blazor app runs in Docker development mode again
- VS Code Razor warnings for MudBlazor components were cleared
- Docker dev builds no longer overwrite host `bin` and `obj` metadata

## 2026-07-10

### MudAppBar Demo Restructure

The App Bar demo was reorganized to follow the same overall content pattern used by the Alert demo.

Changes made in [`Pages/Components/Layout/MudAppBarDemo.razor`](./Pages/Components/Layout/MudAppBarDemo.razor):

- Kept the existing page title and description block
- Moved the demo output into a top `Preview` section
- Moved the controls into a bottom `Options` section
- Kept both the basic app bar and contextual app bar examples
- Shared the same `dense` and `elevation` controls across both preview areas

Result:

- The page now follows a clearer top-to-bottom preview flow
- The structure is aligned more closely with the standard demo direction being tested in the project

### MudAlert Demo Standardized Layout

The Alert demo was reworked into the new preferred page structure and centered container layout.

Changes made in [`Pages/Components/Feedback/MudAlertDemo.razor`](./Pages/Components/Feedback/MudAlertDemo.razor):

- Commented out the previous Alert demo UI markup for reference
- Added a new live layout with the alert preview on top and the options panel below
- Centered the page content in a shared max-width container
- Centered the preview area and kept the alert itself constrained with `max-width`
- Centered the options panel and constrained it with its own max-width
- Removed the extra `Preview` and `Options` section titles
- Updated the top title/description block to use the same centered max-width as the main content

Result:

- The Alert page now matches the desired standardized structure
- The preview and controls are easier to scan vertically
- The overall content alignment is more consistent across desktop widths

### Build Status

Verification completed:

- `dotnet build` succeeds with `0 warnings` and `0 errors`

### Protected File Rule

No changes were made to [`wwwroot/index.html`](./wwwroot/index.html) during these component layout updates, following the protected-file guideline in [`GUIDELINES.md`](./GUIDELINES.md).

### Shared Demo Page Layout

The project now has a reusable layout component for demo pages so shared structure and spacing can be managed in one place instead of being duplicated page by page.

Changes made:

- Added [`Layout/DemoPageLayout.razor`](./Layout/DemoPageLayout.razor) as the shared wrapper for title, preview, and options sections
- Added [`Layout/DemoPageLayout.razor.css`](./Layout/DemoPageLayout.razor.css) for shared responsive layout styling
- Added [`Layout/DemoPageLayoutVariant.cs`](./Layout/DemoPageLayoutVariant.cs) to support reusable layout variants such as vertical, horizontal, preview-only, and custom
- Refactored [`Pages/Components/Feedback/MudAlertDemo.razor`](./Pages/Components/Feedback/MudAlertDemo.razor) to use the shared demo layout component
- Updated [`GUIDELINES.md`](./GUIDELINES.md) with rules for when to use the shared demo page layout and how page-level spacing should be handled

Result:

- Shared container width, centering, preview wrapper, and options wrapper behavior are now centralized
- Future demo pages can reuse the same UI pattern while still choosing an appropriate layout variant
- The Alert demo now acts as the first page using the shared layout system

### Verification

Verification completed after the shared layout refactor:

- `dotnet build --no-restore` succeeds with `0 warnings` and `0 errors`
- A full `dotnet build` was blocked in this environment because NuGet network access to `api.nuget.org` is restricted

## 2026-07-11

### MudAppBar Demo Rebuild

The App Bar demo was redesigned into a configurable playground page using the shared demo layout pattern.

Changes made in [`Pages/Components/Layout/MudAppBarDemo.razor`](./Pages/Components/Layout/MudAppBarDemo.razor):

- Moved the page onto the reusable `DemoPageLayout`
- Switched the page to use the horizontal variant on large screens
- Replaced the previous static multiple-example structure with a single live configurable preview
- Added options for regular and contextual action bar modes
- Added controls for color, fixed state, dense mode, elevation, bottom app bar, menu usage, navigation icon, end action, and title visibility
- Added icon and action selection controls for the app bar buttons
- Added contextual state controls including selected count and contextual visibility

### Contextual App Bar Runtime Fix

The contextual preview initially failed at runtime when switching modes.

Changes made in [`Pages/Components/Layout/MudAppBarDemo.razor`](./Pages/Components/Layout/MudAppBarDemo.razor):

- Restored the contextual preview to use `MudLayout`, `MudAppBar Contextual="true"`, `MudMainContent`, and `MudContextualActionBar` together
- Fixed a loop-variable capture issue in the contextual card preview that caused `IndexOutOfRangeException`
- Added contextual reset behavior for selected items
- Centered the contextual card content block inside the preview area

Result:

- Switching to contextual action bar mode works correctly again
- The contextual preview no longer throws the runtime index error

### Shared Demo Layout Adjustments

The reusable demo page layout was updated to better support wider option panels and horizontal demo pages.

Changes made in [`Layout/DemoPageLayout.razor`](./Layout/DemoPageLayout.razor) and [`Layout/DemoPageLayout.razor.css`](./Layout/DemoPageLayout.razor.css):

- Enabled the App Bar demo to use the horizontal preview/options layout variant
- Increased the shared preview/options panel gap to `36px`
- Added `4px` left and right padding to preview and options panel wrappers
- Set the horizontal options panel to use `24px` top and bottom padding on `lg+`
- Kept the horizontal options panel at `0px` top and bottom padding on `xs`, `sm`, and `md`
- Applied `::deep` selectors where needed so the scoped CSS correctly reaches the rendered `MudPaper` elements

Result:

- The shared layout now supports a more spacious horizontal arrangement for control-heavy demo pages
- MudAppBarDemo benefits from the updated layout behavior without duplicating layout logic in the page file

### Verification

Verification completed:

- `dotnet build --no-restore` succeeds with `0 warnings` and `0 errors`

### MudBreadcrumbs Demo Playground

The Breadcrumbs demo was converted from static examples into a configurable playground page using the shared demo layout.

Changes made in [`Pages/Components/Navigation/MudBreadcrumbsDemo.razor`](./Pages/Components/Navigation/MudBreadcrumbsDemo.razor):

- Moved the page onto `DemoPageLayout`
- Replaced multiple static breadcrumb examples with one live preview
- Added controls for preset, separator type, separator text/icon, items count, max items, icon visibility, and last-item disabled state
- Centered the breadcrumb preview in the shared preview panel
- Updated slider labels to include current values such as `Items Count: 4` and `Max Items: 4`
- Adjusted the options grid so single half-width conditional fields stay left-aligned

Result:

- The Breadcrumbs page now matches the standard playground structure
- Separator and collapse behavior can be tested from one preview instead of separate hardcoded examples

### Shared Demo Rules Refinement

The project guidelines were expanded to make the shared demo pages more consistent.

Changes made in [`GUIDELINES.md`](./GUIDELINES.md):

- Clarified that demo previews should not add extra component-level padding by default
- Clarified that preview content should stay centered unless a component needs a special wrapper
- Added a rule that numeric sliders should show the current value in the label, for example `Elevation: 0`

Changes applied to demos:

- Updated elevation slider labels in [`MudAlertDemo.razor`](./Pages/Components/Feedback/MudAlertDemo.razor)
- Updated elevation slider labels in [`MudAppBarDemo.razor`](./Pages/Components/Layout/MudAppBarDemo.razor)
- Updated elevation slider labels in [`MudBadgeDemo.razor`](./Pages/Components/Feedback/MudBadgeDemo.razor)

Result:

- Shared demo pages now follow clearer preview-padding and slider-label rules
- Interactive numeric controls are easier to read while adjusting values

## 2026-07-12

### MudButton Demo Playground

The Button demo was rebuilt into the shared configurable demo pattern.

Changes made in [`Pages/Components/Buttons/MudButtonDemo.razor`](./Pages/Components/Buttons/MudButtonDemo.razor):

- Replaced the old custom two-column page with `DemoPageLayout`
- Added a centered live preview button with click count
- Added controls for variant, color, size, label, start icon, end icon, disabled, full width, drop shadow, and ripple
- Initialized defaults from the local MudBlazor 9.6 XML API metadata where available
- Replaced the old HTML `ButtonType` selector with higher-level demo modes: `Regular`, `Loading`, and `Link`
- Added loading-specific preview behavior with spinner and loading label
- Added link-specific options including `Href` and open-in-new-tab behavior

Result:

- The Button page now follows the same reusable playground structure as the newer demos
- Regular, loading, and link button states can be previewed from one page

### App Shell Responsive Header

The app shell header was updated so the title can disappear on very narrow screens without affecting the action icons.

Changes made in [`Layout/MainLayout.razor`](./Layout/MainLayout.razor) and [`Layout/MainLayout.razor.css`](./Layout/MainLayout.razor.css):

- Wrapped the `MudPlayground` title in a dedicated `.app-shell-title-wrap` element
- Added a media query to hide that wrapper below `300px`
- Used the wrapper approach instead of targeting `MudText` directly to avoid Blazor scoped CSS limitations

Result:

- The header keeps the menu and right-side actions visible on very small screens
- The title no longer competes for space below `300px`

### Changelog Consolidation

The project changelog structure was simplified into a single root file.

Changes made:

- Added [`CHANGELOG.md`](./CHANGELOG.md) as the primary changelog file
- Moved the dated content from the per-day files in [`Changelog`](./Changelog) into the root changelog
- Removed the old daily markdown changelog files after consolidation

Result:

- The project now has one central changelog file instead of multiple dated files

### Additional Demo Playground Updates

More component demos were converted or refined today to follow the shared interactive playground pattern.

Changes made:

- Added [`Pages/Components/Buttons/MudButtonFabMenu.razor`](./Pages/Components/Buttons/MudButtonFabMenu.razor) as a new configurable Floating Action Button Menu demo
- Updated [`Layout/NavMenu.razor`](./Layout/NavMenu.razor) to include the new `Button FAB Menu` navigation item
- Reworked [`Pages/Components/Buttons/MudButtonFabDemo.razor`](./Pages/Components/Buttons/MudButtonFabDemo.razor) into a clearer vertical playground with dedicated controls for the extended FAB text and icons
- Rebuilt [`Pages/Components/Buttons/MudButtonGroupDemo.razor`](./Pages/Components/Buttons/MudButtonGroupDemo.razor) as a configurable preview with variant, color, size, vertical/full-width, and drop-shadow controls
- Rebuilt [`Pages/Components/Buttons/MudIconButtonDemo.razor`](./Pages/Components/Buttons/MudIconButtonDemo.razor) into the shared playground layout with a more structured control order
- Rebuilt [`Pages/Components/Buttons/MudToggleIconButtonDemo.razor`](./Pages/Components/Buttons/MudToggleIconButtonDemo.razor) into the shared playground layout with separate toggled-state controls
- Refined [`Pages/Components/DataDisplay/MudAvatarDemo.razor`](./Pages/Components/DataDisplay/MudAvatarDemo.razor) to better separate avatar and avatar-group modes, clean up conditional options, and improve control ordering
- Refined [`Pages/Components/DataDisplay/MudCardDemo.razor`](./Pages/Components/DataDisplay/MudCardDemo.razor) with additional header/avatar options, cleaner text-field ordering, clearable card text inputs, and full-row actions alignment
- Refined [`Pages/Components/Navigation/MudBreadcrumbsDemo.razor`](./Pages/Components/Navigation/MudBreadcrumbsDemo.razor) with working separator controls and clearer slider labels that show current values

Result:

- The button, card, avatar, and breadcrumbs demos now follow a more consistent playground UX
- More demos now share the same preview/options structure and conditional control behavior

### Home Page Visual Refresh

The home page presentation was enhanced to feel more intentional and polished.

Changes made:

- Updated [`Pages/Home.razor`](./Pages/Home.razor)
- Added [`Pages/Home.razor.css`](./Pages/Home.razor.css) for page-specific visual styling

Result:

- The landing view now has a stronger visual identity than the earlier plain content layout

### App Shell and Repo Cleanup

The shared shell and repository settings were adjusted to better match the current project state.

Changes made:

- Updated [`Layout/MainLayout.razor`](./Layout/MainLayout.razor) to use a non-dense app bar
- Updated [`Layout/MainLayout.razor`](./Layout/MainLayout.razor) to point the GitHub action link to the current repository URL
- Kept the very-small-screen title-hiding wrapper in [`Layout/MainLayout.razor`](./Layout/MainLayout.razor) and [`Layout/MainLayout.razor.css`](./Layout/MainLayout.razor.css)
- Updated [`.gitignore`](./.gitignore) to ignore the old uppercase [`GUIDELINES.md`](./GUIDELINES.md) filename while the project uses the lowercase guideline file

Result:

- The app shell header better fits the updated playground layout
- Repository housekeeping is aligned with the current naming and link structure
