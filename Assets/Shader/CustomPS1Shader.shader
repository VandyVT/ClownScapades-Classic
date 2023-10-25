Shader "Custom/PS1Shader" {
	Properties {
		[Toggle] _Unlit ("Unlit", Float) = 0
		_Color ("Color", Vector) = (1,1,1,1)
		_MainTex ("Texture", 2D) = "white" {}
		_NormalMap ("Normal Map", 2D) = "bump" {}
		_SpecularMap ("Specular Map", 2D) = "white" {}
		_Specular ("Specular Amount", Float) = 0
		_MetalMap ("Metal Map", 2D) = "white" {}
		_Metallic ("Metallic Amount", Range(0, 1)) = 0
		_Smoothness ("Smoothness Amount", Range(0, 1)) = 0.5
		_Emission ("Emission Map", 2D) = "white" {}
		_EmissionAmt ("Emission Amount", Float) = 0
		_Cube ("Cubemap", Cube) = "" {}
		[HideInInspector] _SrcBlend ("__src", Float) = 1
		[HideInInspector] _DstBlend ("__dst", Float) = 0
		[HideInInspector] _ZWrite ("__zw", Float) = 1
		[HideInInspector] _Cul ("__cul", Float) = 0
	}
	SubShader {
		LOD 100
		Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
		Pass {
			LOD 100
			Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
			Blend Zero Zero, Zero Zero
			Cull Off
			Offset 0, 1
			Lighting On
			GpuProgramID 4478
			Program "vp" {
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_5_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat26 = u_xlat1.z / _ProjectionParams.y;
					    u_xlat26 = (-u_xlat26) + 1.0;
					    u_xlat26 = u_xlat26 * _ProjectionParams.z;
					    u_xlat26 = max(u_xlat26, 0.0);
					    u_xlat26 = u_xlat26 * unity_FogParams.x;
					    u_xlat26 = u_xlat26 * (-u_xlat26);
					    vs_TEXCOORD11 = exp2(u_xlat26);
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "LIGHTPROBE_SH" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_5_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat26 = u_xlat1.z / _ProjectionParams.y;
					    u_xlat26 = (-u_xlat26) + 1.0;
					    u_xlat26 = u_xlat26 * _ProjectionParams.z;
					    u_xlat26 = max(u_xlat26, 0.0);
					    u_xlat26 = u_xlat26 * unity_FogParams.x;
					    u_xlat26 = u_xlat26 * (-u_xlat26);
					    vs_TEXCOORD11 = exp2(u_xlat26);
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "SHADOWS_SCREEN" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD11 = u_xlat1.z;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD11 = u_xlat1.z;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_5_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat26 = u_xlat1.z / _ProjectionParams.y;
					    u_xlat26 = (-u_xlat26) + 1.0;
					    u_xlat26 = u_xlat26 * _ProjectionParams.z;
					    u_xlat26 = max(u_xlat26, 0.0);
					    u_xlat26 = u_xlat26 * unity_FogParams.x;
					    u_xlat26 = u_xlat26 * (-u_xlat26);
					    vs_TEXCOORD11 = exp2(u_xlat26);
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_5_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat26 = u_xlat1.z / _ProjectionParams.y;
					    u_xlat26 = (-u_xlat26) + 1.0;
					    u_xlat26 = u_xlat26 * _ProjectionParams.z;
					    u_xlat26 = max(u_xlat26, 0.0);
					    u_xlat26 = u_xlat26 * unity_FogParams.x;
					    u_xlat26 = u_xlat26 * (-u_xlat26);
					    vs_TEXCOORD11 = exp2(u_xlat26);
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD11 = u_xlat1.z;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD11 = u_xlat1.z;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "LIGHTPROBE_SH" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "SHADOWS_SCREEN" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "FOG_EXP2" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_5_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat26 = u_xlat1.z / _ProjectionParams.y;
					    u_xlat26 = (-u_xlat26) + 1.0;
					    u_xlat26 = u_xlat26 * _ProjectionParams.z;
					    u_xlat26 = max(u_xlat26, 0.0);
					    u_xlat26 = u_xlat26 * unity_FogParams.x;
					    u_xlat26 = u_xlat26 * (-u_xlat26);
					    vs_TEXCOORD11 = exp2(u_xlat26);
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "FOG_EXP2" "LIGHTPROBE_SH" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_5_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat26 = u_xlat1.z / _ProjectionParams.y;
					    u_xlat26 = (-u_xlat26) + 1.0;
					    u_xlat26 = u_xlat26 * _ProjectionParams.z;
					    u_xlat26 = max(u_xlat26, 0.0);
					    u_xlat26 = u_xlat26 * unity_FogParams.x;
					    u_xlat26 = u_xlat26 * (-u_xlat26);
					    vs_TEXCOORD11 = exp2(u_xlat26);
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "FOG_EXP2" "SHADOWS_SCREEN" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD11 = u_xlat1.z;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "FOG_EXP2" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD11 = u_xlat1.z;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "FOG_EXP2" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_5_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat26 = u_xlat1.z / _ProjectionParams.y;
					    u_xlat26 = (-u_xlat26) + 1.0;
					    u_xlat26 = u_xlat26 * _ProjectionParams.z;
					    u_xlat26 = max(u_xlat26, 0.0);
					    u_xlat26 = u_xlat26 * unity_FogParams.x;
					    u_xlat26 = u_xlat26 * (-u_xlat26);
					    vs_TEXCOORD11 = exp2(u_xlat26);
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "FOG_EXP2" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_5_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat26 = u_xlat1.z / _ProjectionParams.y;
					    u_xlat26 = (-u_xlat26) + 1.0;
					    u_xlat26 = u_xlat26 * _ProjectionParams.z;
					    u_xlat26 = max(u_xlat26, 0.0);
					    u_xlat26 = u_xlat26 * unity_FogParams.x;
					    u_xlat26 = u_xlat26 * (-u_xlat26);
					    vs_TEXCOORD11 = exp2(u_xlat26);
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "FOG_EXP2" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD11 = u_xlat1.z;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "FOG_EXP2" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD11 = u_xlat1.z;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "TRANSPARENT" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "TRANSPARENT" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "TRANSPARENT" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "TRANSPARENT" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "TRANSPARENT" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "TRANSPARENT" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "TRANSPARENT" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "TRANSPARENT" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "TRANSPARENT" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_5_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat26 = u_xlat1.z / _ProjectionParams.y;
					    u_xlat26 = (-u_xlat26) + 1.0;
					    u_xlat26 = u_xlat26 * _ProjectionParams.z;
					    u_xlat26 = max(u_xlat26, 0.0);
					    u_xlat26 = u_xlat26 * unity_FogParams.x;
					    u_xlat26 = u_xlat26 * (-u_xlat26);
					    vs_TEXCOORD11 = exp2(u_xlat26);
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "LIGHTPROBE_SH" "TRANSPARENT" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_5_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat26 = u_xlat1.z / _ProjectionParams.y;
					    u_xlat26 = (-u_xlat26) + 1.0;
					    u_xlat26 = u_xlat26 * _ProjectionParams.z;
					    u_xlat26 = max(u_xlat26, 0.0);
					    u_xlat26 = u_xlat26 * unity_FogParams.x;
					    u_xlat26 = u_xlat26 * (-u_xlat26);
					    vs_TEXCOORD11 = exp2(u_xlat26);
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "SHADOWS_SCREEN" "TRANSPARENT" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD11 = u_xlat1.z;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "TRANSPARENT" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD11 = u_xlat1.z;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "TRANSPARENT" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_5_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat26 = u_xlat1.z / _ProjectionParams.y;
					    u_xlat26 = (-u_xlat26) + 1.0;
					    u_xlat26 = u_xlat26 * _ProjectionParams.z;
					    u_xlat26 = max(u_xlat26, 0.0);
					    u_xlat26 = u_xlat26 * unity_FogParams.x;
					    u_xlat26 = u_xlat26 * (-u_xlat26);
					    vs_TEXCOORD11 = exp2(u_xlat26);
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "LIGHTPROBE_SH" "TRANSPARENT" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_5_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat26 = u_xlat1.z / _ProjectionParams.y;
					    u_xlat26 = (-u_xlat26) + 1.0;
					    u_xlat26 = u_xlat26 * _ProjectionParams.z;
					    u_xlat26 = max(u_xlat26, 0.0);
					    u_xlat26 = u_xlat26 * unity_FogParams.x;
					    u_xlat26 = u_xlat26 * (-u_xlat26);
					    vs_TEXCOORD11 = exp2(u_xlat26);
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "SHADOWS_SCREEN" "TRANSPARENT" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD11 = u_xlat1.z;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "TRANSPARENT" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD11 = u_xlat1.z;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "TRANSPARENT" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "LIGHTPROBE_SH" "TRANSPARENT" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "SHADOWS_SCREEN" "TRANSPARENT" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "TRANSPARENT" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "TRANSPARENT" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "LIGHTPROBE_SH" "TRANSPARENT" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "SHADOWS_SCREEN" "TRANSPARENT" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "TRANSPARENT" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "FOG_EXP2" "TRANSPARENT" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_5_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat26 = u_xlat1.z / _ProjectionParams.y;
					    u_xlat26 = (-u_xlat26) + 1.0;
					    u_xlat26 = u_xlat26 * _ProjectionParams.z;
					    u_xlat26 = max(u_xlat26, 0.0);
					    u_xlat26 = u_xlat26 * unity_FogParams.x;
					    u_xlat26 = u_xlat26 * (-u_xlat26);
					    vs_TEXCOORD11 = exp2(u_xlat26);
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "FOG_EXP2" "LIGHTPROBE_SH" "TRANSPARENT" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_5_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat26 = u_xlat1.z / _ProjectionParams.y;
					    u_xlat26 = (-u_xlat26) + 1.0;
					    u_xlat26 = u_xlat26 * _ProjectionParams.z;
					    u_xlat26 = max(u_xlat26, 0.0);
					    u_xlat26 = u_xlat26 * unity_FogParams.x;
					    u_xlat26 = u_xlat26 * (-u_xlat26);
					    vs_TEXCOORD11 = exp2(u_xlat26);
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "FOG_EXP2" "SHADOWS_SCREEN" "TRANSPARENT" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD11 = u_xlat1.z;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "FOG_EXP2" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "TRANSPARENT" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD11 = u_xlat1.z;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "FOG_EXP2" "TRANSPARENT" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_5_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat26 = u_xlat1.z / _ProjectionParams.y;
					    u_xlat26 = (-u_xlat26) + 1.0;
					    u_xlat26 = u_xlat26 * _ProjectionParams.z;
					    u_xlat26 = max(u_xlat26, 0.0);
					    u_xlat26 = u_xlat26 * unity_FogParams.x;
					    u_xlat26 = u_xlat26 * (-u_xlat26);
					    vs_TEXCOORD11 = exp2(u_xlat26);
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "FOG_EXP2" "LIGHTPROBE_SH" "TRANSPARENT" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_5_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat24);
					    u_xlat1.xy = roundEven(u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat1.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat26 = u_xlat1.z / _ProjectionParams.y;
					    u_xlat26 = (-u_xlat26) + 1.0;
					    u_xlat26 = u_xlat26 * _ProjectionParams.z;
					    u_xlat26 = max(u_xlat26, 0.0);
					    u_xlat26 = u_xlat26 * unity_FogParams.x;
					    u_xlat26 = u_xlat26 * (-u_xlat26);
					    vs_TEXCOORD11 = exp2(u_xlat26);
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "FOG_EXP2" "SHADOWS_SCREEN" "TRANSPARENT" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD11 = u_xlat1.z;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "FOG_EXP2" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "TRANSPARENT" "VERTEXLIGHT_ON" }
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0;
						float _VertexSnappingDetail;
						float _DrawDistance;
						vec4 _Color;
						float _SkyboxLighting;
						vec4 unused_0_5[3];
						vec4 _LightColor0;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_7[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_15[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_4_1[4];
						mat4x4 glstate_matrix_projection;
						vec4 unused_4_3[8];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_5[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					in  vec3 in_TANGENT0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD11;
					out vec4 vs_COLOR0;
					out vec4 vs_COLOR1;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COORDINATE0;
					out vec3 vs_NORMAL0;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					out vec4 vs_TEXCOORD10;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb11;
					vec2 u_xlat18;
					float u_xlat24;
					float u_xlat26;
					int u_xlati26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					float u_xlat28;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat1 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat2.xy = _ScreenParams.xy * vec2(0.75, 0.75);
					    u_xlat24 = _VertexSnappingDetail * 0.125;
					    u_xlat18.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat18.xy = u_xlat2.xy * u_xlat18.xy;
					    u_xlat18.xy = u_xlat18.xy / vec2(u_xlat24);
					    u_xlat18.xy = roundEven(u_xlat18.xy);
					    u_xlat18.xy = vec2(u_xlat24) * u_xlat18.xy;
					    u_xlat2.xy = u_xlat18.xy / u_xlat2.xy;
					    u_xlat1.xy = u_xlat1.ww * u_xlat2.xy;
					    u_xlat24 = u_xlat1.y * glstate_matrix_projection[1].z;
					    u_xlat24 = glstate_matrix_projection[0].z * u_xlat1.x + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[2].z * u_xlat1.z + u_xlat24;
					    u_xlat24 = glstate_matrix_projection[3].z * u_xlat1.w + u_xlat24;
					    vs_TEXCOORD2.xy = vec2(u_xlat24) * in_TEXCOORD0.xy;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat26 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat2.xyz = vec3(u_xlat26) * u_xlat2.xyz;
					    u_xlat3.x = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlatb11 = _SkyboxLighting==1.0;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat26 = u_xlat2.y * u_xlat2.y;
					    u_xlat26 = u_xlat2.x * u_xlat2.x + (-u_xlat26);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat26) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz + u_xlat4.xyz;
					    u_xlat3.xzw = u_xlat3.xxx * _LightColor0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat3.xyz = (bool(u_xlatb11)) ? u_xlat4.xyz : u_xlat3.xzw;
					    u_xlat4.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
					    u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat26 = sqrt(u_xlat26);
					    u_xlatb26 = _DrawDistance<u_xlat26;
					    u_xlatb27 = 0.0<_DrawDistance;
					    u_xlatb26 = u_xlatb26 && u_xlatb27;
					    vs_COLOR1.w = (u_xlatb26) ? 0.0 : 1.0;
					    u_xlat5.xyz = in_COLOR0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat6.x = dot(unity_4LightPosX0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.y = dot(unity_4LightPosY0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.z = dot(unity_4LightPosZ0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat27 = dot(u_xlat6.xyz, u_xlat6.xyz);
					        u_xlat28 = inversesqrt(u_xlat27);
					        u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
					        u_xlat28 = dot(unity_4LightAtten0, ImmCB_0_0_0[u_xlati_loop_1]);
					        u_xlat27 = u_xlat28 * u_xlat27 + 1.0;
					        u_xlat27 = float(1.0) / u_xlat27;
					        u_xlat7.xyz = vec3(u_xlat27) * unity_LightColor[u_xlati_loop_1].xyz;
					        u_xlat7.xyz = u_xlat7.xyz * _Color.xyz;
					        u_xlat27 = dot(u_xlat2.xyz, u_xlat6.xyz);
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat5.xyz = u_xlat7.xyz * vec3(u_xlat27) + u_xlat5.xyz;
					    }
					    vs_COLOR0.xyz = u_xlat5.xyz;
					    vs_COLOR1.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceLightPos0.xyz);
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat0.xyz = in_NORMAL0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    u_xlat3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
					    u_xlat3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat3.xyz);
					    u_xlat5.xyz = (-u_xlat3.yyy) * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyw = unity_ObjectToWorld[0].xyz * (-u_xlat3.xxx) + u_xlat5.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * (-u_xlat3.zzz) + u_xlat3.xyw;
					    u_xlat26 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat26);
					    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat26 = inversesqrt(u_xlat26);
					    vs_TEXCOORD7.xyz = vec3(u_xlat26) * u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
					    u_xlat3.w = u_xlat3.y * _ProjectionParams.x;
					    vs_TEXCOORD10.xy = u_xlat3.zz + u_xlat3.xw;
					    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
					    vs_TEXCOORD11 = u_xlat1.z;
					    vs_COLOR0.w = in_COLOR0.w;
					    gl_Position = u_xlat1;
					    vs_COORDINATE0 = in_POSITION0;
					    vs_TEXCOORD10.zw = u_xlat1.zw;
					    vs_TEXCOORD1.xyz = vec3(1.0, 1.0, 1.0);
					    vs_TEXCOORD2.z = u_xlat24;
					    vs_NORMAL0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz;
					    vs_TEXCOORD8.xyz = u_xlat0.xyz;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_2_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_2_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb0 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_2_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_2_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb0 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_2_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_2_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					in  vec4 vs_TEXCOORD10;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat16.xy = vs_TEXCOORD10.xy / vs_TEXCOORD10.ww;
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat16.xy);
					    u_xlat1 = u_xlat1 * u_xlat2.xxxx;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb0 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_2_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_2_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					in  vec4 vs_TEXCOORD10;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat16.xy = vs_TEXCOORD10.xy / vs_TEXCOORD10.ww;
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat16.xy);
					    u_xlat1 = u_xlat1 * u_xlat2.xxxx;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb0 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_2_1;
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_3_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_3_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD11;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					bool u_xlatb24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb24 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb24) * int(0xffffffffu)))!=0){discard;}
					    u_xlat24 = vs_TEXCOORD11;
					    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.xyz = vec3(u_xlat24) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "LIGHTPROBE_SH" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_2_1;
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_3_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_3_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD11;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					bool u_xlatb24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb24 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb24) * int(0xffffffffu)))!=0){discard;}
					    u_xlat24 = vs_TEXCOORD11;
					    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.xyz = vec3(u_xlat24) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "SHADOWS_SCREEN" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_9[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unity_FogParams;
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_4_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_4_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD11;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					in  vec4 vs_TEXCOORD10;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					bool u_xlatb24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat16.xy = vs_TEXCOORD10.xy / vs_TEXCOORD10.ww;
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat16.xy);
					    u_xlat1 = u_xlat1 * u_xlat2.xxxx;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb24 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb24) * int(0xffffffffu)))!=0){discard;}
					    u_xlat24 = vs_TEXCOORD11 / _ProjectionParams.y;
					    u_xlat24 = (-u_xlat24) + 1.0;
					    u_xlat24 = u_xlat24 * _ProjectionParams.z;
					    u_xlat24 = max(u_xlat24, 0.0);
					    u_xlat24 = u_xlat24 * unity_FogParams.x;
					    u_xlat24 = u_xlat24 * (-u_xlat24);
					    u_xlat24 = exp2(u_xlat24);
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.xyz = vec3(u_xlat24) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_9[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unity_FogParams;
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_4_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_4_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD11;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					in  vec4 vs_TEXCOORD10;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					bool u_xlatb24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat16.xy = vs_TEXCOORD10.xy / vs_TEXCOORD10.ww;
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat16.xy);
					    u_xlat1 = u_xlat1 * u_xlat2.xxxx;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb24 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb24) * int(0xffffffffu)))!=0){discard;}
					    u_xlat24 = vs_TEXCOORD11 / _ProjectionParams.y;
					    u_xlat24 = (-u_xlat24) + 1.0;
					    u_xlat24 = u_xlat24 * _ProjectionParams.z;
					    u_xlat24 = max(u_xlat24, 0.0);
					    u_xlat24 = u_xlat24 * unity_FogParams.x;
					    u_xlat24 = u_xlat24 * (-u_xlat24);
					    u_xlat24 = exp2(u_xlat24);
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.xyz = vec3(u_xlat24) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_2_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_2_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb0 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "LIGHTPROBE_SH" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_2_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_2_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb0 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "SHADOWS_SCREEN" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_2_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_2_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					in  vec4 vs_TEXCOORD10;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat16.xy = vs_TEXCOORD10.xy / vs_TEXCOORD10.ww;
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat16.xy);
					    u_xlat1 = u_xlat1 * u_xlat2.xxxx;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb0 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_2_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_2_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					in  vec4 vs_TEXCOORD10;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat16.xy = vs_TEXCOORD10.xy / vs_TEXCOORD10.ww;
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat16.xy);
					    u_xlat1 = u_xlat1 * u_xlat2.xxxx;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb0 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "FOG_EXP2" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_2_1;
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_3_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_3_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD11;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					bool u_xlatb24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb24 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb24) * int(0xffffffffu)))!=0){discard;}
					    u_xlat24 = vs_TEXCOORD11;
					    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.xyz = vec3(u_xlat24) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "FOG_EXP2" "LIGHTPROBE_SH" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_2_1;
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_3_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_3_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD11;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					bool u_xlatb24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb24 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb24) * int(0xffffffffu)))!=0){discard;}
					    u_xlat24 = vs_TEXCOORD11;
					    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.xyz = vec3(u_xlat24) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "FOG_EXP2" "SHADOWS_SCREEN" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_9[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unity_FogParams;
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_4_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_4_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD11;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					in  vec4 vs_TEXCOORD10;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					bool u_xlatb24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat16.xy = vs_TEXCOORD10.xy / vs_TEXCOORD10.ww;
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat16.xy);
					    u_xlat1 = u_xlat1 * u_xlat2.xxxx;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb24 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb24) * int(0xffffffffu)))!=0){discard;}
					    u_xlat24 = vs_TEXCOORD11 / _ProjectionParams.y;
					    u_xlat24 = (-u_xlat24) + 1.0;
					    u_xlat24 = u_xlat24 * _ProjectionParams.z;
					    u_xlat24 = max(u_xlat24, 0.0);
					    u_xlat24 = u_xlat24 * unity_FogParams.x;
					    u_xlat24 = u_xlat24 * (-u_xlat24);
					    u_xlat24 = exp2(u_xlat24);
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.xyz = vec3(u_xlat24) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "FOG_EXP2" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_9[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unity_FogParams;
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_4_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_4_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD11;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					in  vec4 vs_TEXCOORD10;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					bool u_xlatb24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat16.xy = vs_TEXCOORD10.xy / vs_TEXCOORD10.ww;
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat16.xy);
					    u_xlat1 = u_xlat1 * u_xlat2.xxxx;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb24 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb24) * int(0xffffffffu)))!=0){discard;}
					    u_xlat24 = vs_TEXCOORD11 / _ProjectionParams.y;
					    u_xlat24 = (-u_xlat24) + 1.0;
					    u_xlat24 = u_xlat24 * _ProjectionParams.z;
					    u_xlat24 = max(u_xlat24, 0.0);
					    u_xlat24 = u_xlat24 * unity_FogParams.x;
					    u_xlat24 = u_xlat24 * (-u_xlat24);
					    u_xlat24 = exp2(u_xlat24);
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.xyz = vec3(u_xlat24) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "TRANSPARENT" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_2_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_2_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb0 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "TRANSPARENT" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_2_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_2_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb0 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "TRANSPARENT" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_2_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_2_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					in  vec4 vs_TEXCOORD10;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat16.xy = vs_TEXCOORD10.xy / vs_TEXCOORD10.ww;
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat16.xy);
					    u_xlat1 = u_xlat1 * u_xlat2.xxxx;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb0 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "TRANSPARENT" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_2_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_2_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					in  vec4 vs_TEXCOORD10;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat16.xy = vs_TEXCOORD10.xy / vs_TEXCOORD10.ww;
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat16.xy);
					    u_xlat1 = u_xlat1 * u_xlat2.xxxx;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb0 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "TRANSPARENT" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_2_1;
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_3_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_3_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD11;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					bool u_xlatb24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb24 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb24) * int(0xffffffffu)))!=0){discard;}
					    u_xlat24 = vs_TEXCOORD11;
					    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.xyz = vec3(u_xlat24) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "LIGHTPROBE_SH" "TRANSPARENT" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_2_1;
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_3_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_3_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD11;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					bool u_xlatb24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb24 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb24) * int(0xffffffffu)))!=0){discard;}
					    u_xlat24 = vs_TEXCOORD11;
					    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.xyz = vec3(u_xlat24) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "SHADOWS_SCREEN" "TRANSPARENT" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_9[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unity_FogParams;
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_4_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_4_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD11;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					in  vec4 vs_TEXCOORD10;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					bool u_xlatb24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat16.xy = vs_TEXCOORD10.xy / vs_TEXCOORD10.ww;
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat16.xy);
					    u_xlat1 = u_xlat1 * u_xlat2.xxxx;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb24 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb24) * int(0xffffffffu)))!=0){discard;}
					    u_xlat24 = vs_TEXCOORD11 / _ProjectionParams.y;
					    u_xlat24 = (-u_xlat24) + 1.0;
					    u_xlat24 = u_xlat24 * _ProjectionParams.z;
					    u_xlat24 = max(u_xlat24, 0.0);
					    u_xlat24 = u_xlat24 * unity_FogParams.x;
					    u_xlat24 = u_xlat24 * (-u_xlat24);
					    u_xlat24 = exp2(u_xlat24);
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.xyz = vec3(u_xlat24) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_EXP2" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "TRANSPARENT" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_9[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unity_FogParams;
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_4_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_4_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD11;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					in  vec4 vs_TEXCOORD10;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					bool u_xlatb24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat16.xy = vs_TEXCOORD10.xy / vs_TEXCOORD10.ww;
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat16.xy);
					    u_xlat1 = u_xlat1 * u_xlat2.xxxx;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb24 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb24) * int(0xffffffffu)))!=0){discard;}
					    u_xlat24 = vs_TEXCOORD11 / _ProjectionParams.y;
					    u_xlat24 = (-u_xlat24) + 1.0;
					    u_xlat24 = u_xlat24 * _ProjectionParams.z;
					    u_xlat24 = max(u_xlat24, 0.0);
					    u_xlat24 = u_xlat24 * unity_FogParams.x;
					    u_xlat24 = u_xlat24 * (-u_xlat24);
					    u_xlat24 = exp2(u_xlat24);
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.xyz = vec3(u_xlat24) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "TRANSPARENT" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_2_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_2_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb0 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "LIGHTPROBE_SH" "TRANSPARENT" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_2_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_2_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb0 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "SHADOWS_SCREEN" "TRANSPARENT" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_2_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_2_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					in  vec4 vs_TEXCOORD10;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat16.xy = vs_TEXCOORD10.xy / vs_TEXCOORD10.ww;
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat16.xy);
					    u_xlat1 = u_xlat1 * u_xlat2.xxxx;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb0 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "TRANSPARENT" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_2_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_2_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					in  vec4 vs_TEXCOORD10;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat16.xy = vs_TEXCOORD10.xy / vs_TEXCOORD10.ww;
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat16.xy);
					    u_xlat1 = u_xlat1 * u_xlat2.xxxx;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb0 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "FOG_EXP2" "TRANSPARENT" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_2_1;
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_3_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_3_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD11;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					bool u_xlatb24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb24 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb24) * int(0xffffffffu)))!=0){discard;}
					    u_xlat24 = vs_TEXCOORD11;
					    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.xyz = vec3(u_xlat24) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "FOG_EXP2" "LIGHTPROBE_SH" "TRANSPARENT" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_1_9[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_2_1;
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_3_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_3_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD11;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					bool u_xlatb24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb24 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb24) * int(0xffffffffu)))!=0){discard;}
					    u_xlat24 = vs_TEXCOORD11;
					    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.xyz = vec3(u_xlat24) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "FOG_EXP2" "SHADOWS_SCREEN" "TRANSPARENT" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_9[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unity_FogParams;
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_4_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_4_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD11;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					in  vec4 vs_TEXCOORD10;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					bool u_xlatb24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat16.xy = vs_TEXCOORD10.xy / vs_TEXCOORD10.ww;
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat16.xy);
					    u_xlat1 = u_xlat1 * u_xlat2.xxxx;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb24 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb24) * int(0xffffffffu)))!=0){discard;}
					    u_xlat24 = vs_TEXCOORD11 / _ProjectionParams.y;
					    u_xlat24 = (-u_xlat24) + 1.0;
					    u_xlat24 = u_xlat24 * _ProjectionParams.z;
					    u_xlat24 = max(u_xlat24, 0.0);
					    u_xlat24 = u_xlat24 * unity_FogParams.x;
					    u_xlat24 = u_xlat24 * (-u_xlat24);
					    u_xlat24 = exp2(u_xlat24);
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.xyz = vec3(u_xlat24) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "BFC" "DIRECTIONAL" "FOG_EXP2" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "TRANSPARENT" }
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
						vec4 _MainTex_ST;
						float _AffineMapping;
						float _Specular;
						vec4 _Color;
						float _DarkMax;
						float _Unlit;
						float _SkyboxLighting;
						float _EmissionAmt;
						float _Metallic;
						vec4 unused_0_9[4];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
						vec4 unused_2_9[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unity_FogParams;
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unused_4_0[3];
						vec4 unity_SpecCube0_HDR;
						vec4 unused_4_2[4];
					};
					uniform  sampler2D _NormalMap;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SpecularMap;
					uniform  sampler2D _MetalMap;
					uniform  samplerCube _Cube;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2D _Emission;
					uniform  samplerCube unity_SpecCube0;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD11;
					in  vec4 vs_COLOR0;
					in  vec4 vs_COLOR1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_NORMAL0;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD7;
					in  vec3 vs_TEXCOORD8;
					in  vec4 vs_TEXCOORD10;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat12;
					vec2 u_xlat16;
					bool u_xlatb16;
					float u_xlat24;
					bool u_xlatb24;
					float u_xlat25;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
					    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.zz;
					    u_xlat16.xy = u_xlat16.xy + _MainTex_ST.zw;
					    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + (-u_xlat0.xy);
					    u_xlat0.xy = vec2(vec2(_AffineMapping, _AffineMapping)) * u_xlat16.xy + u_xlat0.xy;
					    u_xlat1 = texture(_NormalMap, u_xlat0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD6.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat3.xyz = u_xlat16.xxx * vs_TEXCOORD7.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD8.xyz, vs_TEXCOORD8.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD8.xyz;
					    u_xlat3.xyz = u_xlat1.yyy * u_xlat3.xyz;
					    u_xlat1.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat16.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat16.x = inversesqrt(u_xlat16.x);
					    u_xlat2.xyz = u_xlat16.xxx * vs_TEXCOORD3.xyz;
					    u_xlat16.x = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
					    u_xlat16.x = u_xlat16.x + u_xlat16.x;
					    u_xlat2.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + vs_TEXCOORD4.xyz;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16.x = max(u_xlat16.x, 0.0);
					    u_xlat24 = (-_Unlit) + 1.0;
					    u_xlatb26 = _SkyboxLighting==1.0;
					    u_xlat1.w = 1.0;
					    u_xlat25 = dot(unity_SHAr, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat4);
					    u_xlat12.x = u_xlat1.y * u_xlat1.y;
					    u_xlat12.x = u_xlat1.x * u_xlat1.x + (-u_xlat12.x);
					    u_xlat4.x = unity_SHC.x * u_xlat12.x + u_xlat4.x;
					    u_xlat25 = u_xlat25 + u_xlat4.x;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = log2(u_xlat25);
					    u_xlat25 = u_xlat25 * 0.416666657;
					    u_xlat25 = exp2(u_xlat25);
					    u_xlat25 = u_xlat25 * 1.05499995 + -0.0549999997;
					    u_xlat25 = max(u_xlat25, 0.0);
					    u_xlat25 = u_xlat16.x * u_xlat24 + u_xlat25;
					    u_xlat16.x = u_xlat16.x * u_xlat24 + 0.5;
					    u_xlat16.x = (u_xlatb26) ? u_xlat25 : u_xlat16.x;
					    u_xlat3.xyz = u_xlat16.xxx * u_xlat3.xyz;
					    u_xlatb16 = 0.0<u_xlat3.x;
					    if(u_xlatb16){
					        u_xlat16.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD5.xyz;
					        u_xlat16.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					        u_xlat16.x = u_xlat16.x + u_xlat16.x;
					        u_xlat1.xyz = u_xlat1.xyz * (-u_xlat16.xxx) + u_xlat4.xyz;
					        u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					        u_xlat16.x = inversesqrt(u_xlat16.x);
					        u_xlat4.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
					        u_xlat16.x = dot(u_xlat1.xyz, (-u_xlat4.xyz));
					        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat16.x = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat16.x * u_xlat16.x;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat16.x = u_xlat24 * u_xlat16.x;
					        u_xlat1 = texture(_SpecularMap, u_xlat0.xy);
					        u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Specular, _Specular, _Specular));
					        u_xlat1.xyz = u_xlat16.xxx * u_xlat1.xyz;
					    } else {
					        u_xlat1.x = float(0.0);
					        u_xlat1.y = float(0.0);
					        u_xlat1.z = float(0.0);
					    }
					    u_xlat4 = texture(_MetalMap, u_xlat0.xy);
					    u_xlat5.xyz = vs_NORMAL0.xyz;
					    u_xlat5.w = 1.0;
					    u_xlat6.x = dot(unity_SHAr, u_xlat5);
					    u_xlat6.y = dot(unity_SHAg, u_xlat5);
					    u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    u_xlat5 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
					    u_xlat7.x = dot(unity_SHBr, u_xlat5);
					    u_xlat7.y = dot(unity_SHBg, u_xlat5);
					    u_xlat7.z = dot(unity_SHBb, u_xlat5);
					    u_xlat16.x = vs_NORMAL0.y * vs_NORMAL0.y;
					    u_xlat16.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat16.x);
					    u_xlat5.xyz = unity_SHC.xyz * u_xlat16.xxx + u_xlat7.xyz;
					    u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16.x = (-u_xlat4.w) + 1.0;
					    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_NORMAL0.xyz);
					    u_xlat24 = u_xlat24 + u_xlat24;
					    u_xlat12.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat24)) + vs_TEXCOORD4.xyz;
					    u_xlat16.x = u_xlat16.x * 6.0;
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat12.xyz, u_xlat16.x);
					    u_xlat16.x = u_xlat6.w + -1.0;
					    u_xlat16.x = unity_SpecCube0_HDR.w * u_xlat16.x + 1.0;
					    u_xlat16.x = u_xlat16.x * unity_SpecCube0_HDR.x;
					    u_xlat12.xyz = u_xlat16.xxx * u_xlat6.xyz + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat12.xyz * vec3(vec3(_Metallic, _Metallic, _Metallic));
					    u_xlat4.xyz = u_xlat4.xxx * u_xlat12.xyz;
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz;
					    u_xlat16.x = (-_Metallic) + 1.0;
					    u_xlat4.w = u_xlat3.w;
					    u_xlat3 = u_xlat3 * u_xlat16.xxxx + u_xlat4;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat2 = texture(_Cube, u_xlat2.xyz);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz + vec3(-0.25, -0.25, -0.25);
					    u_xlat1 = u_xlat3 * vs_COLOR0;
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat16.xy = vs_TEXCOORD10.xy / vs_TEXCOORD10.ww;
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat16.xy);
					    u_xlat1 = u_xlat1 * u_xlat2.xxxx;
					    u_xlat2.xyz = (-vs_COLOR1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = (-u_xlat2.xyz) * vec3(_DarkMax) + u_xlat1.xyz;
					    u_xlat0 = texture(_Emission, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_EmissionAmt) + u_xlat1.xyz;
					    u_xlatb24 = vs_COLOR1.w==0.0;
					    if(((int(u_xlatb24) * int(0xffffffffu)))!=0){discard;}
					    u_xlat24 = vs_TEXCOORD11 / _ProjectionParams.y;
					    u_xlat24 = (-u_xlat24) + 1.0;
					    u_xlat24 = u_xlat24 * _ProjectionParams.z;
					    u_xlat24 = max(u_xlat24, 0.0);
					    u_xlat24 = u_xlat24 * unity_FogParams.x;
					    u_xlat24 = u_xlat24 * (-u_xlat24);
					    u_xlat24 = exp2(u_xlat24);
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.xyz = vec3(u_xlat24) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
			}
		}
	}
	Fallback "VertexLit"
	CustomEditor "PS1ShaderEditor"
}