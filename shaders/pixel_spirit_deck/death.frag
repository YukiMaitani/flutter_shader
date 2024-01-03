#include <flutter/runtime_effect.glsl>
#define C FlutterFragCoord()

uniform vec2 uResolution;
uniform float uTime;

out vec4 fragColor;

void main() {
    vec2 uv = vec2(C.x / uResolution.x, 1 - C.y / uResolution.y);
    fragColor = vec4(vec3(step(1 - (cos(uTime + uv.x) * .25 + uv.x), uv.y)), 1);
}

/// example

/// #define S (1. + sin(iTime) / 4.)
/// #define C (1. + cos(iTime) / 4.)
/// float sstep(float a, float b) {
///    return smoothstep(a - .005, a + .005, b);
/// }
/// color = sstep(0.5, (st.x * S + st.y * C) * 0.5);

/// sinとcosを両方掛け合わせることで、上下左右に波打つようなエフェクトを作ることができる
/// 現在の座標に足しているので、対角線上に波打つ