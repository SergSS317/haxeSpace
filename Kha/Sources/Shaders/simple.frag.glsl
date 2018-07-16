#version 450

// Interpolated values from the vertex shaders
in vec2 vUV;
in vec4 color;

// Values that stay constant for the whole mesh.
uniform sampler2D myTextureSampler;

out vec4 fragColor;

void main() {

	// Output color = color of the texture at the specified UV
	
	//fragColor = vec4(color.rgb, texture(myTextureSampler, vUV).r * color.a);
	
	
	vec4 texcolor = texture(myTextureSampler, vUV) * color;
	texcolor *= color.a;
	
	
	
	
	
	
	
	
	
	fragColor = texcolor;
	//fragColor = texture(myTextureSampler, vUV)*color;
}