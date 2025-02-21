//
//  Donut.metal
//  Donut
//
//  Created by Alex Grad <alex@grad.dev> (https://grad.dev) on 21.02.2025.
//

                  #include <metal_stdlib>
              using namespace metal; constant
          uint p[13]={0,0x40000,0xc0000, 0x810200
       ,0x41038104, 0x28000, 0x3428000, 0x1428500,//
     0x5c000, 0x141c500, 0xb9cee73a, 0xc2afea86, /////
    0xf55b305f}; float G(float3 p,float time){ float s=
   sin(time), c=cos(time), n=1.-c, o=.7, k=o*o;float3 D=
  float3x3(float3(n*k+c,n*k,o*s), float3(n*k,n*k+c,-o*s),
 float3(-o*s, o*s, c))*(        p+float3(0, 0, -4));return
 length( float2(length(          D.xz) -1., D.y)) - .4;}[[
stitchable]]half4 don(            float2 I,half4 _,float4 R
,float t){float2 u = (            I.xy-float2((R.z-R.w)*.5,
 0))/R.w*45.; float3 d=          normalize(float3(floor(u)
 /45.-.5,1)),C=float3(0)        ;for(int i=0;i<15;++i){C+=
  d*G(C,t);}float D=max(dot(normalize((float3(G(C+float3(
   .1,0,0),t),G(C+float3(0,.1,0),t),G(C+float3(0,0,.1),t
    ))-G(C,t))/.1),normalize(-C)),.0);int2 b=int2(floor
     (fract(u) * 7.8)) - int2(1,0);return half4(half3(
       length(C)<9. && b.x>=0&&b.x<=4&&b.y>=0&&b.y<=
           6&&(p[int(D*13.)]&1<<int(b.x*7+(6-b.y
              )-1))>0?D:0.),1);}/*grad.dev*/
