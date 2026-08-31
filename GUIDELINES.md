# Project Guidelines

## Protected Files

### `wwwroot/index.html`

- Treat `wwwroot/index.html` as a protected file.
- Do not modify `wwwroot/index.html` by default.
- Only modify `wwwroot/index.html` after explicit user approval.
- Consider `wwwroot/index.html` changes only for startup, boot, cache, or script-loading issues that cannot be safely fixed elsewhere.

## Default Change Scope

- Prefer fixing issues in Razor components, CSS files, layout files, and C# files first.
- Avoid changing app boot behavior unless the problem is clearly related to Blazor startup or static resource loading.

## Demo Page Layout

- Reuse `Layout/DemoPageLayout.razor` for component demo pages whenever the page fits a shared title, preview, and options structure.
- Keep shared width, centering, outer gap, and section wrappers inside `DemoPageLayout`; page files should mainly provide the actual preview and options content.
- Use `DemoPageLayoutVariant.Vertical` for the default stacked pattern: title, preview, then options.
- Use `DemoPageLayoutVariant.Horizontal` when preview and options should sit side by side on large screens and stack on smaller screens.
- Use `DemoPageLayoutVariant.PreviewOnly` when a page only needs the title and preview section.
- Use `DemoPageLayoutVariant.Custom` only when the page structure genuinely does not fit the shared patterns.
- Let `app-shell-body` control global horizontal page padding; demo pages should avoid reintroducing separate left and right wrapper padding unless a page has a specific exception.
- Inside demo preview areas, do not add extra component-level padding by default; rely on the outer `MudPaper` padding from `DemoPageLayout`.
- Keep preview content centered by default and only add inner wrappers when the component behavior genuinely requires them.
- Initialize demo component state from the component API defaults whenever the API documentation states a default value.
- When a demo uses sliders for numeric properties such as `Elevation`, include the current value in the slider label, for example `Elevation: 0`.
- If a demo exposes non-default behavior, make it a deliberate user selection instead of the initial page state.
- If the API documentation does not explicitly state a default, prefer the component's natural default value and note that assumption in code comments or changelog only when it affects behavior.
- When a demo displays all `Variant` options, use `Text, Outlined, Filled` when `Text` is the API-default variant; otherwise use `Filled, Outlined, Text`. Determine the primary sequence from the API documentation first, and follow an explicit user-requested sequence second.
- When a demo displays all `Size` options, list them in the order `Small, Medium, Large`.
- For similar input option lists, prefer this sequence when the API supports the option: `Dense`, `Read only`, `Disabled`, `Drop Shadow`, `Ripple`, `Placeholder`, `Helper text`, `Helper text on focus`, `Clearable`, `Shrink label`, `Required`, `Error`. Skip options that are not supported by the component, then place component-specific options after this shared sequence.
- Use `<MudText Typo="Typo.subtitle2" Class="mx-2">Label</MudText>` for grouped section labels, replacing `Label` with the section name.
- Never use `MudPaper` in an options panel; use the panel's existing layout and grouping labels instead.

## Demo-Specific Styling

- Keep CSS that is specific to a component demo inside that page's `.razor` file, normally in a local `<style>` block.
- Do not create an external `.razor.css` file for a demo-specific style unless the user explicitly requests it or the style is shared by multiple components.
