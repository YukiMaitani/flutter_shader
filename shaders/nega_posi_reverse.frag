#include <flutter/runtime_effect.glsl>

out vec4 fragColor;
uniform vec2 uSize;
uniform sampler2D uTexture;

void main() {
    vec2 uv = FlutterFragCoord().xy / uSize;
    vec4 tex = texture(uTexture, uv.xy);
    fragColor = vec4(1 - tex.rgb, tex.a);
}