#include <flutter/runtime_effect.glsl>
#define C FlutterFragCoord()

uniform vec2 uResolution;
uniform float uTime;

out vec4 fragColor;

void main() {
    vec2 uv = vec2(C.x/uResolution.x, 1-C.y/uResolution.y);
    vec2 ndc = uv * 2. - 1.;
    float d = abs(ndc.x);
    float delay = .01;
    float t = sin(uTime) * 2.;
    float end = floor(t) * .01;
    float change = fract(t) * .01;
    vec3 col = vec3(smoothstep(d, d + max(0., delay - change),.25 + end));
    fragColor = vec4(col, 1.);
}

/// example

/// #define S (1. + sin(iTime) / 4.)
/// #define C (1. + cos(iTime) / 4.)
/// float sstep(float a, float b) {
///   return smoothstep(a - .005, a + .005, b);
/// }
/// float stroke(float x, float s, float w) {
///   float d = sstep(s, x + w / 2.) - sstep(s, x - w / 2.);
///   return clamp(d, 0., 1.);
/// }
/// color = stroke(st.x, 0.5, 0.15*S);