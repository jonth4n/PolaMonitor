# Development Notes

This document records the development process of PolaMonitor, including technical decisions, challenges, discoveries and future improvements.

## Development Environment

- **Operating System:** Fedora Linux
- **Desktop Environment:** KDE Plasma 6
- **Framework:** Qt 6
- **Language:** QML
- **Development Tools:** KDE Plasma SDK and Qt Declarative tools

## Progress

### Initial Setup

- Created the initial Plasma widget structure.
- Configured `metadata.json`.
- Created the main QML interface.
- Tested the widget using `plasmoidviewer`.

### System Monitoring

- Explored the KDE System Monitor sensor components.
- Studied `SensorTreeModel` and `SensorDataModel`.
- Implemented CPU and RAM monitoring.
- Worked with sensor data and QML properties.

### Interface

- Created a dark interface with cyan accents.
- Adjusted the widget dimensions and layout.
- Started integrating the widget into the Plasma desktop.

## Challenges and Learnings

During development, I explored how KDE Plasma widgets interact with system sensors.

Some of the main learning points were:

- Understanding QML imports and component structure.
- Working with KDE sensor models.
- Understanding how sensor data is exposed to QML.
- Debugging syntax errors and property references.
- Learning how different QML components communicate.

## Future Improvements

- Add GPU monitoring.
- Add temperature monitoring.
- Improve the visual layout.
- Add configuration options.
- Improve sensor selection and customization.

## Notes

This document will be updated as the project evolves.
