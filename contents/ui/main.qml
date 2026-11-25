import QtQuick
import QtQuick.Layouts
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasmoid
import org.kde.plasma.components as PlasmaComponents
import org.kde.kirigami as Kirigami
import org.kde.ksysguard.sensors as Sensors

PlasmoidItem {
    id: root

    // Remove o fundo padrão do Plasma para usar o seu visual próprio
    Plasmoid.backgroundHints: PlasmaCore.Types.NoBackground

    Layout.minimumWidth: Kirigami.Units.gridUnit * 13
    Layout.minimumHeight: Kirigami.Units.gridUnit * 6

    // Sensores
    Sensors.Sensor {
        id: cpuSensor
        sensorId: "cpu/all/usage"
        updateRateLimit: 1000
    }

    Sensors.Sensor {
        id: ramPercentSensor
        sensorId: "memory/physical/usedPercent"
        updateRateLimit: 2000
    }

    Sensors.Sensor {
        id: ramUsedSensor
        sensorId: "memory/physical/used"
        updateRateLimit: 2000
    }

    // Cartão principal com gradiente e borda brilhante
    Rectangle {
        id: card
        anchors.fill: parent
        radius: 14

        // Preto profundo com ~70% de opacidade (não fica totalmente fechado, mas mantém o texto legível)
        color: "#B30a0a0c"

        border.width: 1
        // Borda sutil que brilha levemente ao passar o mouse
        border.color: hoverArea.containsMouse ? "#66ffffff" : "#26ffffff"

        Behavior on border.color { ColorAnimation { duration: 200 } }


        // Transição suave na cor da borda ao passar o mouse
        Behavior on border.color { ColorAnimation { duration: 200 } }

        MouseArea {
            id: hoverArea
            anchors.fill: parent
            hoverEnabled: true
        }

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 14
            spacing: 10

            // Cabeçalho
            RowLayout {
                Layout.fillWidth: true
                PlasmaComponents.Label {
                    text: "POLAMONITOR"
                    font.pixelSize: 11
                    font.bold: true
                    font.letterSpacing: 1.5
                    color: "#ffffff"
                }
                Item { Layout.fillWidth: true }
                // Indicador pulsante
                Rectangle {
                    width: 15; height: 15; radius: 8
                    color: "#ff0000"
                    SequentialAnimation on opacity {
                        loops: Animation.Infinite
                        NumberAnimation { from: 1.0; to: 0.3; duration: 900 }
                        NumberAnimation { from: 0.3; to: 1.0; duration: 900 }
                    }
                }
            }

            // Bloco CPU
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 4
                RowLayout {
                    PlasmaComponents.Label { text: "CPU"; color: "#ffffff"; font.bold: true }
                    Item { Layout.fillWidth: true }
                    PlasmaComponents.Label {
                        text: cpuSensor.formattedValue
                        color: "#ffffff"
                        font.bold: true
                    }
                }
                // Barra de progresso customizada
                Rectangle {
                    Layout.fillWidth: true
                    height: 6
                    radius: 3
                    color: "#545454"

                    Rectangle {
                        height: parent.height
                        radius: 3
                        width: parent.width * Math.min(1, (cpuSensor.value || 0) / 100)
                        // Muda de cor se passar de 80%
                        color: (cpuSensor.value || 0) > 80 ? "#ffffff" : "#ffffff"

                        Behavior on width { NumberAnimation { duration: 350; easing.type: Easing.OutCubic } }
                        Behavior on color { ColorAnimation { duration: 250 } }
                    }
                }
            }

            // Bloco RAM
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 4
                RowLayout {
                    PlasmaComponents.Label { text: "RAM"; color: "#ffffff"; font.bold: true }
                    Item { Layout.fillWidth: true }
                    PlasmaComponents.Label {
                        text: ramUsedSensor.formattedValue + " (" + Math.round(ramPercentSensor.value || 0) + "%)"
                        color: "#ffffff"
                        font.bold: true
                    }
                }
                Rectangle {
                    Layout.fillWidth: true
                    height: 6
                    radius: 3
                    color: "#545454"

                    Rectangle {
                        height: parent.height
                        radius: 3
                        width: parent.width * Math.min(1, (ramPercentSensor.value || 0) / 100)
                        color: (ramPercentSensor.value || 0) > 85 ? "#ff0000" : "#ffffff"

                        Behavior on width { NumberAnimation { duration: 350; easing.type: Easing.OutCubic } }
                        Behavior on color { ColorAnimation { duration: 250 } }
                    }
                }
            }
        }
    }
}
