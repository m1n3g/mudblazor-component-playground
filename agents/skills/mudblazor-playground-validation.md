# MudBlazor Playground Component Validation

Playground validation version: 1.0.0

## Purpose

Use this skill to validate published MudBlazor UI Kit components inside the
MudBlazor Playground Figma Design file.

The MudBlazor Playground is a consumer/testing file.

Components used here must come from the published MudBlazor UI Kit library.

The goal is to verify that a published component is correctly configured and
usable from a consumer perspective before it is considered complete.

This skill is for the MudBlazor Playground file.

Do not use this skill to modify the source component definitions inside the
MudBlazor UI Kit: Design System for Blazor file.


# Validation and Testing Rules

## Published Component Only

Always test the published component from the MudBlazor UI Kit library.

Do not:

- Recreate the component manually
- Detach the published component instance
- Modify the source component definition from the Playground
- Add properties or options that do not exist
- Invent unsupported component behavior
- Create invalid test cases simply to increase the number of tests

The Playground should represent how a real consumer uses the published
component.


## Test Based on Actual Component Properties

Base validation and test cases only on:

- Exposed component properties
- Available property options
- Boolean properties
- Text properties
- Instance swap properties
- Variant properties
- Nested instances
- Other properties actually exposed by the published component

Do not assume properties exist.

Inspect the published component first and identify what is actually available.


## Property Coverage

Check all exposed properties and ensure each applicable property is represented
in the test coverage.

For every property, determine:

- Property name
- Property type
- Available values/options
- Default value
- Whether it affects another property
- Whether it applies to nested instances
- Whether it can be combined with other properties

Do not omit a supported property without a reason.


## Property Options

For properties that contain predefined options:

- Test each supported option.
- Use only options exposed by the published component.
- Do not create unsupported values.
- Confirm that changing the option produces the expected component state.

Examples include:

- Size
- Color
- Variant
- Orientation
- Position
- State
- Alignment

Only test examples that actually apply to the component being validated.


## Valid Property Combinations

Test valid combinations of properties and property options supported by the
component.

The purpose is not to create every mathematically possible combination.

The purpose is to cover combinations that are valid and meaningful for the
actual component.

Check for interactions between properties.

For example, if one property changes the behavior, visibility, layout, state,
or available options of another property, include appropriate combination
tests.

Do not create combinations that the component does not support.


## Nested Instances

Inspect all exposed nested instances.

For each nested instance:

- Identify the available instance options.
- Check applicable properties.
- Check applicable property options.
- Check valid combinations.
- Confirm the nested instance behaves correctly inside the parent component.

Where applicable, test each nested instance against the relevant parent
properties.

Do not detach nested instances.

Do not modify the source definition of a nested component.


## Coverage Requirement

Before considering a component validated, confirm that the test coverage
includes all applicable:

- Properties
- Property options
- Nested instances
- Nested-instance options
- Valid property combinations
- Important property interactions

The validation should cover the published component completely without
introducing behavior or options that do not exist in the actual component.


# Validation Workflow

## Phase 1 — Identify the Component

Identify the published component the user wants to validate.

Example:

`MudAvatar`

Use the component from the published MudBlazor UI Kit library.

Do not use a local recreation of the component.


## Phase 2 — Inspect Exposed Configuration

Before creating test cases, inspect the published component and identify:

- Exposed properties
- Property types
- Property options
- Default values
- Nested instances
- Nested-instance options
- Property relationships
- Valid combinations

Build the validation plan from the actual published component.

Do not build the test plan from assumptions or memory.


## Phase 3 — Plan Test Coverage

Create a coverage plan before placing test instances.

Group the required coverage where applicable:

### Properties

List each exposed property that needs validation.

### Property Options

List the available options that need validation.

### Nested Instances

List each exposed nested instance and its applicable options.

### Property Combinations

Identify meaningful valid combinations that should be tested.

### Property Interactions

Identify properties whose behavior depends on another property.

Do not add invalid or unsupported test cases.


## Phase 4 — Create the Playground Test Area

Create or use the test frame for the component in the MudBlazor Playground.

Place the new component test area in the existing testing sequence and follow
the current Playground layout and organization.

Keep tests for one component together.

Use published component instances for every test case.

Do not detach instances.


## Phase 5 — Build Test Cases

Create the required component instances based on the coverage plan.

Each test instance should have a clear purpose.

Avoid duplicate instances that test the exact same configuration unless the
duplicate is needed to test another interaction.

Where helpful, organize test cases by:

- Property
- Property option
- Nested instance
- Combination
- State

Keep the test structure understandable so a user can identify what each
instance is validating.


## Phase 6 — Validate Each Test

For each test case, verify:

- The expected property can be selected.
- The expected option is available.
- The component updates correctly.
- The selected state is visually represented correctly.
- Nested instances remain functional.
- Property combinations behave as expected.
- No unsupported option appears unexpectedly.
- No expected option is missing.
- The component remains usable as a library instance.

Do not alter an instance manually to hide a problem with the published
component.


## Published Component Issues

If a problem comes from the published component itself, report it as a source
component issue.

Examples:

- Missing property
- Missing property option
- Incorrect property name
- Incorrect variant mapping
- Broken nested instance
- Incorrect default value
- Invalid option exposed
- Valid option missing
- Property combination does not behave correctly

Do not patch the Playground instance to make the published component appear
correct.

The Playground is for detecting these problems.


# Validation Report

After completing the validation, report the results.

Group findings into:

### Property Coverage
### Property Options
### Nested Instances
### Valid Combinations
### Property Interactions
### Published Component Issues

For every issue, provide:

- Issue number
- Category
- Property/instance involved
- Current behavior
- Expected behavior
- Test case where the issue was found
- Recommended source correction

Example:

`#1 — Property Options — MudAvatar / Size`

Current:
`Large` is not available from the published instance.

Expected:
`Small`, `Medium`, and `Large` should be available according to the published
component configuration.

Result:
`FAIL`

Recommended action:
Review the Size property configuration in the MudBlazor UI Kit source
component.


## Passed Checks

Also report successful coverage.

Example:

- Color property: PASS
- Size options: PASS
- Square property: PASS
- Nested icon instance: PASS
- Size + Color combinations: PASS
- Nested-instance combinations: ISSUE FOUND


## Uncertain Findings

If something cannot be verified safely, mark it as:

`NEEDS CONFIRMATION`

Explain what could not be confirmed.

Do not guess.


# Final Coverage Check

Before finishing, cross-check the published component one final time against
the Playground tests.

Confirm that every applicable:

- Property
- Property option
- Nested instance
- Nested-instance option
- Valid combination
- Important property interaction

has appropriate test coverage.

If something is missing, validation is not complete.


# Final Report

Conclude with one of these statuses:

`PLAYGROUND VALIDATION: PASS`

Use this only when the published component has complete applicable coverage and
all tested behavior works correctly.

or

`PLAYGROUND VALIDATION: ISSUES FOUND`

Use this when one or more published-component issues are found.

or

`PLAYGROUND VALIDATION: INCOMPLETE`

Use this when required coverage could not be completed or verified.


# Core Rules

Always follow these principles:

1. Test the published MudBlazor UI Kit component.
2. Treat the Playground as a consumer of the published library.
3. Inspect the actual exposed properties before creating tests.
4. Base tests only on supported properties, options, and nested instances.
5. Cover every applicable exposed property.
6. Cover every applicable property option.
7. Test meaningful valid property combinations.
8. Test applicable nested instances and their relevant combinations.
9. Do not add unsupported or invalid cases.
10. Do not detach published component instances.
11. Do not modify source component definitions from the Playground.
12. Do not manually patch an instance to hide a source-component problem.
13. Report published-component problems clearly.
14. Cross-check coverage before marking validation complete.
15. Never mark validation as PASS while known applicable issues or missing
    coverage remain.