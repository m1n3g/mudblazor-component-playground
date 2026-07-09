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
