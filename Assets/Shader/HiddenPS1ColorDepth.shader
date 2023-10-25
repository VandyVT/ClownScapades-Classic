Shader "Hidden/PS1ColorDepth" {
	Properties {
		_MainTex ("Texture", 2D) = "white" {}
		_DitherTex ("", 2D) = "black" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 50843
			Program "vp" {
				SubProgram "d3d11 " {
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						float _ColorDepth;
						float _Scanlines;
						float _ScanlineIntensity;
						float _Dithering;
						float _DitherThreshold;
						float _DitherIntensity;
						float _SubtractFade;
						float _FavorRed;
						float _SLDirection;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[6];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _DitherTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					bvec4 u_xlatb1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					float u_xlat6;
					float u_xlat9;
					bool u_xlatb9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _ScreenParams.xy;
					    u_xlat1 = u_xlat0.xxyy + u_xlat0.xxyy;
					    u_xlatb1 = greaterThanEqual(u_xlat1, (-u_xlat1.yyww));
					    u_xlat1.x = (u_xlatb1.x) ? float(2.0) : float(-2.0);
					    u_xlat1.y = (u_xlatb1.y) ? float(0.5) : float(-0.5);
					    u_xlat1.z = (u_xlatb1.z) ? float(2.0) : float(-2.0);
					    u_xlat1.w = (u_xlatb1.w) ? float(0.5) : float(-0.5);
					    u_xlat0.xy = u_xlat0.xy * u_xlat1.yw;
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy * u_xlat1.xz;
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat6 = (-_SLDirection) + 1.0;
					    u_xlat3.x = u_xlat6 * u_xlat0.y;
					    u_xlat0.x = u_xlat0.x * _SLDirection + u_xlat3.x;
					    u_xlat0.x = u_xlat0.x * _Scanlines;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.xyz = u_xlat1.xyz * vec3(_ColorDepth);
					    SV_Target0.w = u_xlat1.w;
					    u_xlat3.xyz = floor(u_xlat3.xyz);
					    u_xlat3.xyz = u_xlat3.xyz / vec3(_ColorDepth);
					    u_xlat0.xyz = u_xlat0.xxx * vec3(vec3(_ScanlineIntensity, _ScanlineIntensity, _ScanlineIntensity)) + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
					    u_xlat2.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
					    u_xlat1.x = _ScreenParams.x * 0.166666672;
					    u_xlat1.xy = u_xlat1.xx * vs_TEXCOORD0.xy;
					    u_xlat1 = texture(_DitherTex, u_xlat1.xy);
					    u_xlat1.x = u_xlat1.w / _DitherThreshold;
					    u_xlatb9 = u_xlat9<u_xlat1.x;
					    u_xlat9 = u_xlatb9 ? _DitherIntensity : float(0.0);
					    u_xlat0.xyz = vec3(u_xlat9) * vec3(vec3(_Dithering, _Dithering, _Dithering)) + u_xlat0.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + vec3(3.0, 3.0, 3.0);
					    u_xlat0.xyz = (-u_xlat1.xyz) * vec3(vec3(_SubtractFade, _SubtractFade, _SubtractFade)) + u_xlat0.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.25, 0.25, 0.25);
					    u_xlat0.xyz = (-vec3(vec3(_FavorRed, _FavorRed, _FavorRed))) * u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat9 = (-u_xlat0.x) + 0.5;
					    u_xlat9 = u_xlat9 * 0.100000001;
					    SV_Target0.x = _FavorRed * u_xlat9 + u_xlat0.x;
					    SV_Target0.yz = u_xlat0.yz;
					    return;
					}"
				}
			}
		}
	}
}