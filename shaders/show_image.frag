#include <flutter/runtime_effect.glsl>

out vec4 fragColor;
uniform vec2 uSize;
uniform sampler2D image;

void main() {
    vec2 fragCoord = FlutterFragCoord();
    vec2 uv = FlutterFragCoord().xy / uSize;
    fragColor = texture(image, uv.xy).rgba;
}