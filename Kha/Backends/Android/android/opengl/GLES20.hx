package android.opengl;

import java.NativeArray;
import java.lang.Byte;
import java.nio.Buffer;
import java.nio.FloatBuffer;
import java.StdTypes;

extern class GLES20 {
	public static var GL_COLOR_BUFFER_BIT : Int;
	public static var GL_NO_ERROR : Int;
	public static var GL_TEXTURE0 : Int;
	public static var GL_TEXTURE_2D : Int;
	public static var GL_TEXTURE_MIN_FILTER : Int;
	public static var GL_TEXTURE_MAG_FILTER : Int;
	public static var GL_NEAREST : Int;
	public static var GL_TEXTURE_WRAP_S : Int;
	public static var GL_TEXTURE_WRAP_T : Int;
	public static var GL_CLAMP_TO_EDGE : Int;
	public static var GL_FLOAT : Int;
	public static var GL_TRIANGLES : Int;
	public static var GL_FRAGMENT_SHADER : Int;
	public static var GL_VERTEX_SHADER : Int;
	public static var GL_BLEND : Int;
	public static var GL_SRC_ALPHA : Int;
	public static var GL_ONE_MINUS_SRC_ALPHA : Int;
	public static var GL_ARRAY_BUFFER : Int;
	public static var GL_DYNAMIC_DRAW : Int;
	public static var GL_ELEMENT_ARRAY_BUFFER : Int;
	public static var GL_STATIC_DRAW : Int;
	public static var GL_UNSIGNED_SHORT: Int;
	public static var GL_SHORT: Int;
	public static var GL_COMPILE_STATUS: Int;
	public static var GL_LINK_STATUS: Int;
	public static var GL_TRUE: Int;
	public static var GL_FALSE: Int;
	public static var GL_LINEAR: Int;
	public static var GL_RGBA: Int;
	public static var GL_UNSIGNED_BYTE: Int;
	public static var GL_FRAMEBUFFER: Int;
	public static var GL_RENDERBUFFER: Int;
	public static var GL_COLOR_ATTACHMENT0: Int;
	public static var GL_DEPTH_ATTACHMENT: Int;
	public static var GL_STENCIL_ATTACHMENT: Int;
	public static var GL_DEPTH_COMPONENT16: Int;
	public static var GL_LUMINANCE: Int;
	public static var GL_DEPTH_BUFFER_BIT: Int;
	public static var GL_STENCIL_BUFFER_BIT: Int;
	public static var GL_DEPTH_TEST: Int;
	public static var GL_ALWAYS: Int;
	public static var GL_NEVER: Int;
	public static var GL_EQUAL: Int;
	public static var GL_NOTEQUAL: Int;
	public static var GL_LESS: Int;
	public static var GL_LEQUAL: Int;
	public static var GL_GREATER: Int;
	public static var GL_GEQUAL: Int;
	public static var GL_CULL_FACE: Int;
	public static var GL_FRONT: Int;
	public static var GL_BACK: Int;
	public static var GL_ZERO: Int;
	public static var GL_ONE: Int;
	public static var GL_DST_ALPHA: Int;
	public static var GL_ONE_MINUS_DST_ALPHA: Int;
	public static var GL_REPEAT: Int;
	public static var GL_MIRRORED_REPEAT: Int;
	public static var GL_NEAREST_MIPMAP_NEAREST: Int;
	public static var GL_NEAREST_MIPMAP_LINEAR: Int;
	public static var GL_LINEAR_MIPMAP_NEAREST: Int;
	public static var GL_LINEAR_MIPMAP_LINEAR: Int;

	public static var GL_STENCIL_TEST : Int;
	public static var GL_STENCIL_FUNC : Int;
	public static var GL_STENCIL_FAIL : Int;
	public static var GL_STENCIL_PASS_DEPTH_FAIL : Int;
	public static var GL_STENCIL_PASS_DEPTH_PASS : Int;
	public static var GL_STENCIL_REF : Int;
	public static var GL_STENCIL_VALUE_MASK : Int;
	public static var GL_STENCIL_WRITEMASK : Int;
	public static var GL_STENCIL_INDEX8 : Int;

	public static var GL_KEEP : Int;
	public static var GL_REPLACE : Int;
	public static var GL_INCR : Int;
	public static var GL_DECR : Int;
	public static var GL_INVERT : Int;
	public static var GL_INCR_WRAP : Int;
	public static var GL_DECR_WRAP : Int;

	public static var GL_FRAMEBUFFER_COMPLETE : Int;
	public static var GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT : Int;
	public static var GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT : Int;
	public static var GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS : Int;
	public static var GL_FRAMEBUFFER_UNSUPPORTED : Int;
	
	public static var GL_ACTIVE_UNIFORMS: Int;

	public static function glClear(bits: Int): Void;
	public static function glGetError(): Int;
	public static function glBindBuffer(type : Int, buffer : Int) : Void;
	public static function glActiveTexture(texture : Int) : Void;
	public static function glBindTexture(type : Int, texture : Int) : Void;
	public static function glTexParameteri(textype : Int, type : Int, value : Int) : Void;
	public static function glEnableVertexAttribArray(attribute : Int) : Void;
	public static function glCreateShader(shader : Int) : Int;
	public static function glDrawArrays(type : Int, start : Int, count : Int) : Void;
	public static function glDrawElements(mode: Int, count: Int, type: Int, indices: Buffer): Void;
	public static function glUniform1i(location: Int, x: Int): Void;
	public static function glUniform1f(location: Int, x: Single): Void;
	public static function glUniform2f(location: Int, x: Single, y: Single): Void;
	public static function glUniform3f(location: Int, x: Single, y: Single, z: Single): Void;
	public static function glUniform4f(location: Int, x: Single, y: Single, z: Single, w: Single): Void;
	public static function glUniform1fv(location: Int, count: Int, v: NativeArray<Single>, offset: Int): Void;
	public static function glUniform4fv(location: Int, count: Int, v: NativeArray<Single>, offset: Int): Void;
	public static function glUniformMatrix3fv(location: Int, count: Int, transpose: Bool, value: NativeArray<Single>, offset: Int): Void;
	public static function glUniformMatrix4fv(location: Int, count: Int, transpose: Bool, value: NativeArray<Single>, offset: Int): Void;
	public static function glLinkProgram(program : Int) : Void;
	public static function glUseProgram(program : Int) : Void;
	public static function glCreateProgram() : Int;
	public static function glEnable(state : Int) : Void;
	public static function glShaderSource(shader : Int, source : String) : Void;
	public static function glCompileShader(shader : Int) : Void;
	public static function glBlendFunc(srcfunc : Int, destfunc : Int) : Void;
	public static function glViewport(x : Int, y : Int, width : Int, height : Int) : Void;
	public static function glClearColor(r : Single, g : Single, b : Single, a : Single) : Void;
	public static function glClearDepthf(depth : Single) : Void;
	public static function glAttachShader(program : Int, shader : Int) : Void;
	public static function glBindAttribLocation(program : Int, unknown : Int, name : String) : Void;
	public static function glGetUniformLocation(program : Int, name : String) : Int;
	public static function glGetAttribLocation(program : Int, name : String) : Int;
	public static function glVertexAttribPointer(attribute: Int, count: Int, type: Int, unknown: Bool, bytes: Int, offset: Int): Void;
	public static function glBufferData(type : Int, size : Int, vertices : Buffer, draw : Int) : Void;
	public static function glGenTextures(unknown1 : Int, textures : NativeArray<Int>, unknown2 : Int) : Void;
	public static function glGenBuffers(unknown1 : Int, textures : NativeArray<Int>, unknown2 : Int) : Void;
	public static function glGetShaderiv(shader: Int, pname: Int, params: NativeArray<Int>, offset: Int): Void;
	public static function glGetShaderInfoLog(shader: Int): String;
	public static function glGetProgramiv(program: Int, pname: Int, params: NativeArray<Int>, offset: Int): Void;
	public static function glGetProgramInfoLog(program: Int): String;
	public static function glBindFramebuffer(target: Int, framebuffer: Int): Void;
	public static function glGenFramebuffers(n: Int, framebuffers: NativeArray<Int>, offset: Int): Void;
	public static function glFramebufferTexture2D(target: Int, attachment: Int, textarget: Int, texture: Int, level: Int): Void;
	public static function glTexImage2D(target: Int, level: Int, internalformat: Int, width: Int, height: Int, border: Int, format: Int, type: Int, pixels: Buffer): Void;
	public static function glDeleteTextures(n: Int, textures: NativeArray<Int>, offset: Int): Void;
	public static function glDeleteFramebuffers(n: Int, framebuffers: NativeArray<Int>, offset: Int): Void;
	public static function glTexSubImage2D(target: Int, level: Int, xoffset: Int, yoffset: Int, width: Int, height: Int, format: Int, type: Int, pixels: Buffer): Void;
	public static function glDisable(cap: Int): Void;
	public static function glDepthFunc(func: Int): Void;
	public static function glDepthMask(flag: Bool): Void;
	public static function glCullFace(mode: Int): Void;

	public static function glStencilFunc(func: Int, ref: Int,  mask: Int): Void;
	public static function glStencilOp(fail: Int, zfail: Int, zpass: Int): Void;
	public static function glStencilMask(mask: Int) : Void;
	public static function glClearStencil(s: Int) : Void;

	public static function glGenRenderbuffers(n : Int, buffers: NativeArray<Int>, offset : Int) : Void;
	public static function glBindRenderbuffer(target: Int, renderBuffer: Int): Void;
	public static function glRenderbufferStorage(target: Int, internalFormat: Int, width: Int, height: Int): Void;
	public static function glFramebufferRenderbuffer(target: Int, attachment: Int, renderBufferTarget: Int, renderBuffer: Int): Void;
	public static function glCheckFramebufferStatus(target: Int): Int;
	public static function glDeleteRenderbuffers(n: Int, renderBuffers: NativeArray<Int>, offset: Int): Void;

	public static function glColorMask(red: Bool, green: Bool, blue: Bool, alpha: Bool): Void;
	
	public static function glGetActiveUniform(program: Int, index: Int, bufsize: Int, length: NativeArray<Int>, lengthOffset: Int, size: NativeArray<Int>, sizeOffset: Int, type: NativeArray<Int>, typeOffset: Int, name: NativeArray<Int8>, nameOffset: Int): Void;
}
