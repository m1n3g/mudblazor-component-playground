# MudBlazor Component Playground

![.NET](https://img.shields.io/badge/.NET-10-512BD4?logo=dotnet&logoColor=white)
![Blazor](https://img.shields.io/badge/Blazor-WebAssembly-512BD4?logo=blazor&logoColor=white)
![MudBlazor](https://img.shields.io/badge/UI-MudBlazor-594AE2)

An interactive MudBlazor component playground for exploring components, testing variations, and supporting Figma design system development.

> This is an unofficial community project and is not affiliated with the MudBlazor team.

## 🔍 Overview

MudBlazor Component Playground provides a visual environment for exploring MudBlazor components and their available options.

Each component page includes:

- A live component preview
- Interactive controls for component properties
- Variants, colors, sizes, icons, states, and layout options
- Immediate visual feedback
- Component-specific examples and descriptions

Users can combine options like building blocks and see the resulting component without repeatedly editing Razor code.

## 🎛️ How It Works

1. Select a MudBlazor component from the navigation menu.
2. Adjust its available properties, variants, states, and layout options.
3. View the updated result instantly in the live preview.

The preview responds immediately as the selected options change, making it easier to understand how each component behaves.

## ✨ Features

- Interactive MudBlazor component previews
- Component-specific configuration controls
- Live visual updates
- Light and dark theme support
- Responsive layouts
- Organized component navigation
- Blazor WebAssembly architecture
- Docker support
- Figma design system development workflow

## 🎨 Figma UI Kit

[![Open in Figma](https://img.shields.io/badge/Open%20in-Figma-F24E1E?logo=figma&logoColor=white)](https://www.figma.com/community/file/1432408934517112427/mudblazor-ui-kit-design-system-for-blazor)

This playground is developed alongside the **MudBlazor UI Kit: Design System for Blazor**, created and maintained by the same author for designers and developers building Blazor applications with MudBlazor.

The UI kit closely follows MudBlazor’s component naming, structure, variants, and design principles, helping maintain consistency between Figma designs and MudBlazor implementations.

## 🧱 Component Coverage

The playground is currently organized into the following component categories:

| Category | Components |
| --- | --- |
| Buttons | Button, Floating Action Button (FAB), Button Group, Icon Button, Scroll to Top, Toggle Icon Button |
| Charts | Interactive chart demonstrations |
| Data Display | Avatar, Card, Carousel, Chat, Chips, Chip Set, Expansion Panels, List, Pagination, Simple Table, Stepper, Table, Inline Edit Table, Tabs, Timeline, Tooltip, Tree View, Typography |
| Feedback | Alert, Badge, Dialog, Overlay, Progress, Skeleton, Snackbar |
| Inputs | Checkbox, Color Picker, Date Picker, Date Range Picker, File Upload, Form, Numeric Field, Radio, Rating, Select, Slider, Switch, Text Field, Time Picker, Toggle Group |
| Layout | App Bar, Divider, Drawer, Paper, Spacer, Toolbar |
| Navigation | Breadcrumbs, Link, Menu, Nav Menu |

Additional components, properties, states, and variations will be added progressively.

## 🚀 Getting Started

### 📋 Requirements

- .NET 10 SDK
- A modern web browser
- Git

### 📥 Clone and Run

```bash
git clone https://github.com/m1n3g/mudblazor-component-playground.git
cd mudblazor-component-playground
dotnet run
```

Open the local address shown in the terminal.

## 🐳 Docker

A production Docker configuration is included in the repository.

Build and run the application with Docker Compose:

```bash
docker compose up --build
```

Development-specific Docker configuration can be kept locally and excluded from Git.

## 📄 Disclaimer

MudBlazor is developed and maintained by the MudBlazor team. This unofficial community project is not affiliated with, sponsored by, or endorsed by the official MudBlazor project.