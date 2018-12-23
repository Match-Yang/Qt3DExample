import QtQuick 2.9 as QQ2
import Qt3D.Core 2.9
import Qt3D.Render 2.9
import Qt3D.Input 2.0
import Qt3D.Logic 2.0
import Qt3D.Extras 2.9

Entity {

    components: [
        RenderSettings {
            activeFrameGraph: ForwardRenderer {
                camera: mainCamera
            }
        },
        // Event Source will be set by the Qt3DQuickWindow
        InputSettings { }
    ]


    Camera {
        id: mainCamera
        position: Qt.vector3d( 0, 0, 10)
        viewCenter: Qt.vector3d( 0, 0, 0 )
    }

    SOrbitCameraController {
        camera: mainCamera
        linearSpeed: 10
        lookSpeed: 1000
    }

    Entity {
        id: cube

        CuboidMesh {
            id: cube_mesh
            xExtent: 1
            yExtent: 1
            zExtent: 1
        }

        PhongMaterial {
            id: cube_material
            ambient: Qt.rgba(1, 1, 0, 1)
        }

        Transform {
            id: t
            translation: Qt.vector3d(0, 0, 0)
            scale: 1
            rotation: fromEulerAngles(0, 0, 0)
        }

        components: [cube_mesh, cube_material, t]
    }


}
