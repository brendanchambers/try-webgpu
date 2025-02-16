@group(0) @binding(0) var<storage, read_write> a : array<f32>;
@group(0) @binding(1) var<storage, read_write> b : array<f32>;
@group(0) @binding(2) var<storage, read_write> out : array<f32>;

// workgroup sizes: wgs.x, wgs.y, wgs.z 
const wgs = vec3({{workgroupSize}});

@compute @workgroup_size({{workgroupSize}})
fn main(@builtin(local_invocation_id) lid: vec3<u32>) {
  // Fill-in
  let i = lid.x + lid.y*wgs.x;
  out[i] = a[lid.x] + b[lid.y];
}
