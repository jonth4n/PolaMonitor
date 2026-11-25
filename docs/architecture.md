# PolaMonitor Architecture

This document describes the basic structure and organization of PolaMonitor.

## Overview

PolaMonitor is a KDE Plasma 6 widget built with QML.

Its main purpose is to retrieve system monitoring data and display it through a lightweight graphical interface.

## Project Structure

### `metadata.json`

Contains the widget metadata, including:

- Plugin identification.
- Widget name and description.
- Version.
- License.
- Minimum supported Plasma version.

### `contents/ui/main.qml`

The main interface and logic of the widget.

Responsible for:

- Creating the widget layout.
- Defining visual components.
- Connecting to KDE sensor models.
- Displaying system information.

### `docs/`

Contains project documentation.

- `architecture.md`: technical organization.
- `development-notes.md`: development history and learning notes.

## Technologies and Components

### QML

Used to define the interface and component behavior.

### Qt Quick

Provides the visual components and layout system.

### KDE Plasma

Provides the desktop widget environment through Plasma APIs.

### KSysGuard Sensors

Provides access to system sensor models and monitoring information.

## Data Flow

The general data flow is:

1. The widget initializes its QML components.
2. Sensor models provide available system information.
3. The interface accesses the relevant sensor data.
4. The displayed values are updated as the data changes.

## Future Architecture Improvements

As the project grows, the code may be separated into smaller components to improve readability and maintainability.

Possible additions include:

- Separate components for CPU, RAM and GPU.
- Configuration interface.
- Sensor selection system.
- Reusable visual components.
