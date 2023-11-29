Shader "Custom/NewSurfaceShader"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Factor ("Color Factor", Range(0, 2)) = 2
        _RedMultiplier ("Red Multiplier", Range(0, 3)) = 2.0
        _GreenMultiplier ("Green Multiplier", Range(0, 3)) = 2.0
        _BlueMultiplier ("Blue Multiplier", Range(0, 3)) = 2.0
        //_Rect1 ("Rect 1", Vector) = (0.1, 0.1, 0.4, 0.4)
        //_Rect2 ("Rect 2", Vector) = (0.6, 0.1, 0.9, 0.4)
    }
    SubShader
    {
       

        Tags { "Queue"="Transparent" }
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            struct appdata_t
            {
                float4 vertex : POSITION;
                float2 texcoord : TEXCOORD0;
            };

            struct v2f
            {
                float2 texcoord : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float _Factor;
            float _RedMultiplier;
            float _GreenMultiplier;
            float _BlueMultiplier;
            //float4 _Rect1;
            //float4 _Rect2;

            v2f vert(appdata_t v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.texcoord = v.texcoord;
                return o;
            }

            half4 frag(v2f i) : COLOR
            {    
                half4 color = tex2D(_MainTex, i.texcoord);
                //col.rgb *= _Factor; // Color transformation here
      
                //if (i.texcoord.x > _Rect1.x && i.texcoord.x < _Rect1.z && i.texcoord.y > _Rect1.y && i.texcoord.y < _Rect1.w)
                //{
                //    color.r *= 0;
                //    color.g *= _Factor;
                //    color.b *= 2;
                //}
    
                //if (i.texcoord.x > _Rect2.x && i.texcoord.x < _Rect2.z && i.texcoord.y > _Rect2.y && i.texcoord.y < _Rect2.w)
                //{
                //    color.r *= 0;
                //    color.g *= _Factor;
                //    color.b *= 2;
                //}
    
                #if UNITY_DEBUG_MACRO
                    UNITY_DebugOutput("heererer");
                #endif
    
                color.r *= 0;
                color.g *= _Factor;
                color.b *= 2;
                return color;
            }
            ENDCG
         }
    }
    //FallBack "Diffuse"
}
