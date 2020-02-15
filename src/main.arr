import global as G
import js-file("./binds/Three") as THREE
import js-file("./binds/dom") as DOM
import js-file("./interface/three-scratch") as ITS

fov     :: Number = G.num-to-fixnum(75)
aspect  :: Number = G.num-to-fixnum(DOM.window-width() / DOM.window-height())
near    :: Number = G.num-to-fixnum(0.1)
far     :: Number = G.num-to-fixnum(1000)


canvas = DOM.get-element("gameCanvas")

renderer-params :: THREE.WebGLRendererParameters = {
    alpha: nothing,
    antialias: true,
    canvas: canvas,
    #canvas: nothing,
    context: nothing,
    depth: nothing,
    logarithmicDepthBuffer: nothing,
    powerPreference: nothing,
    precision: nothing,
    premultipliedAlpha: nothing,
    preserveDrawingBuffer: nothing,
    stencil: nothing
}

G.console-log(fov)
G.console-log(aspect)
G.console-log(near)
G.console-log(far)

scene = THREE.__new_Scene_0()
camera = THREE.__new_PerspectiveCamera_0( fov, aspect, near, far )
renderer = THREE.__new_WebGLRenderer_0(renderer-params)

box-side     :: Number = G.num-to-fixnum(1)
box-segments :: Number = G.num-to-fixnum(1)

# geometry = THREE.__new_BoxGeometry_0(nothing, nothing, nothing, nothing, nothing, nothing)
geometry = THREE.__new_BoxGeometry_0(box-side, box-side, box-side, box-segments, box-segments, box-segments)
material = THREE.__new_MeshBasicMaterial_0({
    alphaMap: nothing,
    aoMap: nothing,
    aoMapIntensity: nothing,
    color: "rgb(0, 255, 0)",
    #color: {
    #    r: G.num-to-fixnum(0),
    #    g: G.num-to-fixnum(1),
    #    b: G.num-to-fixnum(0),
    #},
    combine: nothing,
    envMap: nothing,
    map: nothing,
    morphTargets: nothing,
    opacity: nothing,
    reflectivity: nothing,
    refractionRatio: nothing,
    skinning: nothing,
    specularMap: nothing,
    wireframe: nothing,
    wireframeLinecap: nothing,
    wireframeLinejoin: nothing,
    wireframeLinewidth: nothing
})

cube = THREE.__new_Mesh_0(geometry, material )
ITS.add-to-scene(scene, cube)
ITS.setup(scene, camera, renderer, cube)
