struct VertexOutput {
    @builtin(position) Position : vec4<f32>,
    @location(0) fragColor : vec4<f32>,
}

@vertex
fn vs_main(@builtin(vertex_index) VertexIndex : u32) -> VertexOutput {
    var pos = array<vec2<f32>, 3>(
        vec2<f32>(0.0, 0.5), 
        vec2<f32>(-0.5, -0.5), 
        vec2<f32>(0.5, -0.5) 
    );

    var colors = array<vec4<f32>, 3>(
        vec4<f32>(1.0, 0.0, 0.0, 1.0), 
        vec4<f32>(0.0, 1.0, 0.0, 1.0), 
        vec4<f32>(0.0, 0.0, 1.0, 1.0) 
    );

    var output : VertexOutput;
    output.Position = vec4<f32>(pos[VertexIndex], 0.0, 1.0); 
    output.fragColor = colors[VertexIndex];
    return output;
}


@fragment
fn fs_main(@location(0) fragColor : vec4<f32>) -> @location(0) vec4<f32> {
    return fragColor;
}