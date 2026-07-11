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
- Initialize demo component state from the component API defaults whenever the API documentation states a default value.
- If a demo exposes non-default behavior, make it a deliberate user selection instead of the initial page state.
- If the API documentation does not explicitly state a default, prefer the component's natural default value and note that assumption in code comments or changelog only when it affects behavior.
