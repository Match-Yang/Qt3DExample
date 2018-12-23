import QtQuick 2.9 as QQ2
import Qt3D.Core 2.9
import Qt3D.Render 2.9
import Qt3D.Input 2.0
import Qt3D.Logic 2.0
import Qt3D.Extras 2.9
import S3D 1.0

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
        position: Qt.vector3d( 0, 0, 50)
        viewCenter: Qt.vector3d( 0, 0, 0 )
    }

    SOrbitCameraController {
        camera: mainCamera
        linearSpeed: 10
        lookSpeed: 1000
    }

    Entity {
        id: cube

        PlaneMesh {
            id: cube_mesh
            height: 10
            width: 10
            meshResolution: Qt.size(10, 10)
        }

        TextureMaterial {
            id: cube_material
            texture: Texture2D {
                id: myTexture
                minificationFilter: Texture.Linear
                magnificationFilter: Texture.Linear
                wrapMode {
                    x: WrapMode.Repeat
                    y: WrapMode.Repeat
                }
                maximumAnisotropy: 16.0
                PaintedTextureImage {
                    id: textureImage

                    QQ2.Timer {
                        interval: 1000
                        repeat: true
                        running: true
                        triggeredOnStart: true
                        property real count: 0
                        onTriggered: {
                            textureImage.text = "Hello, " + count
                            count ++
                        }
                        QQ2.Component.onCompleted: mainCamera.tiltAboutViewCenter(45)
                    }
                }
            }
        }

        Transform {
            id: tf
            translation: Qt.vector3d(0, 0, 0)
            scale: 1
            rotation: fromEulerAngles(0, 0, 0)
        }

        components: [cube_mesh, cube_material, tf]
    }


}
