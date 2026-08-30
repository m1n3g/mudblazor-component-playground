# MudBlazor UI Kit: Design System for Blazor Review

UI Kit guideline version: 1.1.0

## Purpose

Use this skill to inspect and maintain component pages inside the main
MudBlazor UI Kit: Design System for Blazor Figma Design file.

A component page includes the full documentation and specimen area for one
component, for example, the complete Alert page, App Bar page, Avatar page, etc.

The goal is to ensure the entire component page follows the MudBlazor UI Kit
guidelines before the component is published.

This skill is for the MudBlazor UI Kit: Design System for Blazor source file.

Do not use this skill for consumer-side validation or published-component
testing in the MudBlazor Playground file.


# Guideline Rules

## Style

### Page Header

Check whether the page header uses our own documentation component.

If it does not, report that the `.page-header` component from the
`❖ Document Components` page should be applied, with the title and link
refilled and the URL link set correctly.

Do not apply or modify the page header during the initial inspection.
Only apply the change after user confirmation.


### Text Colors

Use the following text colors on a white `#FFFFFF` background:

- Description Vector
  - Color: `#808080`

- Description / body text
  - Size: 18px
  - Weight: Regular
  - Color: `#616161`

- Section title
  - Example: "MudBreadcrumbs"
  - Size: 24px
  - Weight: Semi Bold
  - Letter spacing: 0.3px
  - Color: `#000000`

- Component property labels
  - Variant/property labels in the specimen area
  - Size: 16px
  - Weight: Medium
  - Color: `#616161`


### Table Structure

Text styles are already defined inside the `.Row` and `.Cell` components.
Do not recreate those text styles manually.

`.row` variants:

- `Type = Header` — use for the first row
- `Type = Body` — use for all body rows

`.cell` has a `Text` property for setting cell content via component
properties. Use `setProperties` to fill cell text rather than editing
text nodes directly.

`.cell` variants:

- `Type = Header` — header cell styling
- `Type = Default` — body cell styling

Cell widths:

- Property = `240`
- Description = `600`
- Values/Options = `Fill`

When resetting or rebuilding table rows:

1. Reset the row instance.
2. Reset every cell instance inside the row.
3. Refill the content afterward.

Do not reset only the row while leaving overridden cell instances unchanged.


### Specimen Axis Labels

Use the `.axis-label` component from the `❖ Document Components` page for
all axis labels in the specimen area.

Do not recreate axis label text styles manually.

Use:
- `Type = Default` for label items with text
- `Type = Spacer` for empty spacer items

Set Position based on placement relative to the specimen grid:

- `top` — x-axis labels placed above the grid
- `bottom` — x-axis labels placed below the grid
- `left` — y-axis labels placed to the left of the grid
- `right` — y-axis labels placed to the right of the grid

#### Label Format

- Single property: `Property = Value` (e.g. `Color = Default`, `Size = Large`)
- Multiple values (max 2): `Value1 / Value2` (e.g. `Filled / Enabled`)

Use `=` when displaying one property with its value.
Use `/` when combining two property values without naming the properties.

Maximum 2 values per label.

#### Axis Placement

- **x-axis** — horizontal labels placed at top or bottom of the specimen
- **y-axis** — vertical labels placed at left or right of the specimen

Each side can hold dual axes. For example:

- y-axis1 (left) + y-axis2 (right)
- y-axis3 (left) + y-axis4 (right)

#### Axis Frame Rules

- Axis frames should not clip content (clip content = off)
- x-axis (top/bottom): align top-left
- y-axis on left side: align top-right
- y-axis on right side: align top-left

#### Spacer Rules

The `.axis-label` spacer (`Type = Spacer`) is placed **only as the first
child of the first y-axis frame** (e.g. y-axis1). Its purpose is to
accommodate the height of the first x-axis row above plus the 28px gap
to the component body.

Spacer sizing:

- Width: **HUG** (default instance width)
- Height: **47px fixed** (default)

Adjust the spacer height only when the x-axis label above uses multi-line
text that increases its row height. Otherwise always use 47px.

Do not place spacers in x-axis frames or in y-axis frames that do not have
a corresponding x-axis row above them.

#### Axis-Label Instance Sizing

Internal text node: always **HUG content** for both width and height.

**Top / Bottom labels** (x-axis):

- Width: HUG content (follows the text width)
- Height: **HUG content** (follows the text height)

**Left / Right labels** (y-axis):

- Width: **HUG content** (follows the text width)
- Height: **Fixed** — set to the tallest variant height in the
  corresponding row. For example, if a row contains variants with
  heights 37px, 43px, and 37px, set the label height to 43px.

When the component variants within a row have varying heights, always pick
the maximum height for that row's label.

#### X-Axis Frame Sizing

- Padding left: **20px**
- Padding right: **20px**
- Gap (itemSpacing): **20px** (default; adjust if needed for alignment)
- Padding top/bottom: 0

These values mirror the component set's internal alignment, where variants
are positioned 20px from the left edge with 20px gaps between them.

#### Y-Axis Frame Sizing

- First child: spacer (see Spacer Rules above)
- Padding: **0** (no padding on any side)
- Gap (itemSpacing): **20px** (default; matches the component set's
  internal gap between variant rows)

Each subsequent `.axis-label` instance height is set to follow the tallest
variant height in the corresponding row (see Axis-Label Instance Sizing
above). A second pass may be needed to fine-tune individual label heights
after the initial setup.


## Documentation Content

<!--
Check that the documentation accurately represents the actual MudBlazor
component.

### Description

Check the component description for:

- Accuracy
- Clear wording
- Relevant MudBlazor API information
- Any required custom UI Kit description

Use the relevant MudBlazor API documentation as a reference when available.

Do not invent component behavior, properties, or descriptions that are not
supported by the actual component.
-->


### Property Table

Check that:

- Property names are correct.
- Property descriptions are correct.
- Values/Options are correct for each property.
- Unsupported options are not documented.
- Relevant supported options are not accidentally omitted.

Where a property contains predefined values, verify those values against the
actual component.


## Component Specimen and Variants

Inspect the complete specimen area.

Check:

- Component property labels
- Variant labels
- x-axis labels
- y-axis labels
- Actual component variants
- Relationships between displayed labels and component properties

At the end of the inspection, cross-check the labels against the actual
component variants.

The specimen labels must accurately represent the available component
variants.

Do not assume a label is correct only because it already exists on the page.


## Styles and Variables

Inspect the styles used by the component and documentation where applicable.

Check:

- Min width
- Max width
- Min height
- Max height
- Icon size
- Gaps
- Padding
- Opacity
- Border radius
- Typography (Local text styles)
- Colors
- Stroke
- Border width

### Stroke Alignment

All component variants that use strokes (e.g. Outlined, Bordered) must use `strokeAlign = INSIDE`.

Do not use `OUTSIDE` or `CENTER`.

Stroke weight must use the appropriate `border-width` variable (e.g. `border-width/border-1`) rather than a hardcoded value.

If the stroke weight uses a hardcoded value but a matching `border-width` variable exists, report it as an issue.


### Layer Naming Convention

Rename inner component layers to match real MudBlazor CSS class names using lowercase kebab-case.

All MudBlazor CSS class names start with `mud-`.

#### Rules

1. **Known CSS class name**: If the layer maps to a known MudBlazor CSS class, use that class name exactly.
   - Example: `MudAlertIcon` → `mud-alert-icon`
   - Example: `MudAlertMessage` → `mud-alert-message`
   - Example: `MudAlertClose` → `mud-alert-close`

2. **User-specified class name**: If the user explicitly provides a class name for a layer, use that name exactly.
   - Example: User says "rename as mud-alert-text" → `mud-alert-text`

3. **PascalCase legacy format**: If a layer uses the old PascalCase format (first letter uppercase, no spacing, e.g. `MudSomethingName`), convert to kebab-case: split on uppercase boundaries, lowercase everything, join with hyphens.
   - `MudBreadcrumbItem` → `mud-breadcrumb-item`
   - `MudText` → `mud-text`
   - `MudAppBar` → `mud-app-bar`
   - `logoContainer` → `logo-container`

4. **Icon instances from the Icons page**: If an inner layer is an instance whose main component lives on the `Icons` page, rename it to `mud-icon`.
   - Example: `event_note` (instance from Icons page) → `mud-icon`
   - Example: `settings_ethernet` (instance from Icons page) → `mud-icon`
   - Only apply this rule to icon instances sourced from the `Icons` page.

5. **Inner component instances from component pages**: If an inner layer is an instance of another MudBlazor component (e.g. `MudIconButton`, `MudBreadcrumbItem`), do NOT rename it. Keep the original component instance name as-is.
   - Example: `MudIconButton` → keep as `MudIconButton`
   - These are real component references and their names must match the
     source component.

6. **Generic or unspecified layers**: If a layer has a generic name (e.g. `text`) and no specific CSS class name is known or provided by
   the user, prefer `mud-text` for text layers.

7. **Do not invent class names**: Do not guess or fabricate CSS class names that do not exist in MudBlazor. If unsure whether a specific class name exists, use the generic `mud-` prefix pattern from rule 6 and report it as `NEEDS CONFIRMATION`.



- Shadow/effect values (Local effect styles)

When a matching UI Kit variable exists, the value should use the appropriate
variable rather than an unnecessary hard-coded value.

Cross-check applicable values against the defined variable list in the
MudBlazor UI Kit.

Do not replace a valid native MudBlazor component style merely because it is
not represented by a custom UI Kit variable.

If a value comes from native MudBlazor component behavior or styling,
identify that before recommending a change.

If you are unsure whether a value is native MudBlazor behavior or an incorrect
custom style, report it for review instead of changing it automatically.


## Protected Inner Components

Do not touch or modify protected inner components.

Example:

`MudBreadcrumbItem`

If a MudBlazor component contains nested/internal components that are intended
to remain unchanged, inspect them only as necessary to understand the parent
component.

Do not modify those inner components unless the user explicitly approves that
specific change.


# Review Workflow

## Phase 1 — Determine Review Scope

Review the ENTIRE component page.

Example:

If the user asks to review `MudAlert`, inspect the complete Alert page rather
than only the selected MudAlert layer.

The review should include all relevant areas on that page:

- Main documentation
- Title and description
- Links
- Property table
- Values/Options
- Section headings
- Specimen area
- Variant/property labels
- Component variants
- Relevant component structure
- Relevant style and variable usage

A selected layer may indicate which component the user wants reviewed, but the
inspection scope is the full component page.


## Phase 2 — Inspect Only

IMPORTANT:

This phase is READ-ONLY.

Do not modify anything during the initial inspection.

Do not change:

- Layers
- Frames
- Components
- Instances
- Variants
- Component properties
- Variables
- Styles
- Text
- Tables
- Auto layout
- Spacing
- Colors
- Effects
- Documentation content

Inspect first and compare the complete component page against all Guideline
Rules in this skill.


## Inspection Order

Inspect the page in this order:

### 1. Documentation Structure

Check:

- Page structure
- Title
- Link
- Description
- Section titles
- Property table
- Table structure
- Table cell types
- Table column widths


### 2. Documentation Content

Check:

- Description accuracy
- Property names
- Property descriptions
- Values/Options
- Missing information
- Unsupported information


### 3. Component Specimen

Check:

- Property labels
- Variant labels
- x-axis
- y-axis
- Actual component variants
- Label-to-variant consistency


### 4. Styles

Check:

- Text colors
- Typography
- Spacing
- Padding
- Gaps
- Border radius
- Border width
- Min/max dimensions
- Icon sizing
- Shadows/effects
- Other applicable styles


### 5. Variables

Check:

- Whether applicable styles use the correct UI Kit variables
- Whether a hard-coded value should use an existing variable
- Whether the selected variable resolves to the expected value

Do not recommend creating a new variable simply because one does not currently
exist.

Report the missing-variable case first and let the user decide.


### 6. Component Structure

Check:

- Component hierarchy
- Nested instances
- Variant structure
- Property exposure
- Relevant auto layout
- Protected inner components

Do not modify protected inner components.


## Phase 3 — Report Findings

After completing the full inspection, report the results before making any
changes.

Group findings into these categories:

### Documentation
### Content
### Specimen / Variants
### Styles
### Variables
### Component Structure

For every issue, provide:

- Issue number
- Category
- Location
- Current state/value
- Expected state/value
- Why it does not follow the guideline
- Recommended fix

Use a concise format such as:

`#1 — Styles — Alert / Description`

Current:
`#808080`

Expected:
`#616161`

Reason:
Description body text should use the defined body-text color.

Recommended fix:
Change the description text color to `#616161` using the appropriate variable
if one exists.


## Passed Checks

Also report areas that passed.

Do not report only failures.

Example:

- Documentation structure: PASS
- Table structure: PASS
- Description content: ISSUE FOUND
- Specimen labels: PASS
- Variables: 2 ISSUES FOUND


## Uncertain Findings

If something cannot be confirmed safely, mark it as:

`NEEDS CONFIRMATION`

Explain what could not be verified.

Do not turn uncertainty into a definite error.

Do not guess.


# Confirmation Gate

STOP after reporting the inspection results.

DO NOT FIX ANYTHING YET.

Wait for explicit user confirmation.

The user may approve:

- All findings
- Specific issue numbers
- A specific category
- A modified version of a recommended fix

Examples of valid approval:

- "Fix all."
- "Fix #1, #3 and #5."
- "Fix the documentation issues only."
- "Fix #2 but keep the current padding."

Only proceed with changes that were explicitly approved.


# Phase 4 — Fix Approved Findings

After the user confirms the fixes, modify only the approved findings.

For each approved issue:

1. Locate the exact affected layer/component/content.
2. Apply the smallest necessary correction.
3. Preserve unrelated structure and behavior.
4. Reuse existing variables and components when appropriate.
5. Do not modify anything outside the approved scope.

Do not use approval for one issue as permission to fix other nearby issues.

If fixing an approved issue reveals another problem, do not automatically fix
the new problem.

Report it separately.


## Fix Restrictions

While fixing:

- Do not modify unapproved findings.
- Do not change unrelated layers.
- Do not detach instances unless explicitly approved.
- Do not rebuild components that only require a small correction.
- Do not modify protected inner components without explicit approval.
- Do not create unsupported component properties.
- Do not create unsupported variants.
- Do not invent MudBlazor behavior.
- Do not introduce unnecessary variables.
- Do not overwrite valid native MudBlazor behavior with arbitrary UI Kit values.


# Phase 5 — Re-check

After completing all approved fixes, inspect the ENTIRE component page again.

Do not only check the layers that were changed.

Run the same Guideline Rules against the page again to ensure the fixes did not
create new inconsistencies.


## Final Report

Report the final status using:

### Passed

Checks that now comply with the guidelines.

### Remaining Issues

Previously reported or newly discovered issues that still require attention.

### Not Changed

Issues that were intentionally left unchanged because the user did not approve
them.

### Needs Confirmation

Anything that still cannot be safely verified.

Conclude with one of these statuses:

`UI KIT REVIEW: PASS`

Use this only when the entire reviewed component page passes the applicable
Guideline Rules.

or

`UI KIT REVIEW: ISSUES REMAIN`

Use this when one or more applicable issues remain.


# Core Rules

Always follow these principles:

1. Inspect the entire component page.
2. Inspect before modifying.
3. Never make changes during the initial inspection.
4. Report findings clearly.
5. Wait for explicit user confirmation before fixing.
6. Fix only approved findings.
7. Use the smallest necessary change.
8. Preserve unrelated components and structure.
9. Do not modify protected inner components without explicit approval.
10. Do not invent unsupported MudBlazor behavior, properties, options, or variants.
11. Prefer existing UI Kit variables when an appropriate variable exists.
12. Distinguish native MudBlazor styling from custom UI Kit styling before flagging it.
13. Re-check the entire component page after fixes.
14. Never mark the page as PASS while known applicable issues remain.