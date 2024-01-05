#include <flutter/runtime_effect.glsl>
#define C FlutterFragCoord()

uniform vec2 uResolution;

out vec4 fragColor;
float sstep(float a, float b, float blur) {
    return smoothstep(a - blur, a + blur, b);
}

float stroke(float x, float s, float w) {
  float d = sstep(s, x + w / 2.) - sstep(s, x - w / 2.);
  return clamp(d, 0., 1.);
}

float stick(vec2 uv, float blur, float width, float height) {
    float vertical = sstep(0.5, uv.x + width / 2., blur) - sstep(0.5, uv.x - width / 2., blur);
    float horizontal = sstep(0.5, uv.y + height / 2., blur) - sstep(0.5, uv.y - height / 2., blur);
    return vertical * horizontal;
}

float path(vec2 uv, float blur, float width, vec2 a, vec2 b) {
    float x = uv.x;
    float y = uv.y;
    if(!(max(a.x, b.x) >= x && x >= min(a.x, b.x)) || !(max(a.y, b.y) >= y && y >= min(a.y, b.y)) || !((a.y - b.y) * (x - a.x) == (y - a.y) * (a.x - b.x))) {
        return 0.;
    }
    return 1.;
}

void main() {
    vec2 uv = vec2(C.x/uResolution.x, 1-C.y/uResolution.y);
    fragColor = vec4(vec3(stick(uv, .01, .015, .7)), 1);
}