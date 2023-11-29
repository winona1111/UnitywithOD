Shader "Custom/NewSurfaceShader"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Factor("Color Factor", Range(0, 2)) = 2
        _RedMultiplier("Red Multiplier", Range(0, 3)) = 2.0
        _GreenMultiplier("Green Multiplier", Range(0, 3)) = 2.0
        _BlueMultiplier("Blue Multiplier", Range(0, 3)) = 2.0
        _Rect1("_Rect1", Vector) = (0, 0, 0, 0)
        _Rect2("_Rect2", Vector) = (0, 0, 0, 0)
    }
    SubShader
    {
    

        Tags { "Queue"="Transparent" }
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma target 4.0
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
            float4 _Rect1;
            float4 _Rect2;

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

                //if ((i.texcoord.x * 640) > 407-65 && (i.texcoord.x * 640) < 407+65 &&
                //    (i.texcoord.y * 480) > 103-101 && (i.texcoord.y * 480) < 103+101)
                //{
                //    //  Rect1 跋办ず秈︽肅︹跑传
                //    color.r *= _RedMultiplier;
                //    color.g *= _GreenMultiplier;
                //    color.b *= _BlueMultiplier;
                //}
                if ((i.texcoord.x * 640) > _Rect1.x && (i.texcoord.x * 640) < _Rect1.z &&
                    (i.texcoord.y * 480) > _Rect1.y && (i.texcoord.y * 480) < _Rect1.w)
                {
                    //  Rect1 跋办ず秈︽肅︹跑传
                    color.r *= _RedMultiplier;
                    color.g *= _GreenMultiplier;
                    color.b *= _BlueMultiplier;
                }

                if ((i.texcoord.x * 640) > _Rect2.x && (i.texcoord.x * 640) < _Rect2.z &&
                    (i.texcoord.y * 480) > _Rect2.y && (i.texcoord.y * 480) < _Rect2.w)
                {
                    //  Rect2 跋办ず秈︽肅︹跑传
                    color.r *= _RedMultiplier;
                    color.g *= _GreenMultiplier;
                    color.b *= _BlueMultiplier;
                }

                /*f (i.texcoord.x > _Rect1.x && i.texcoord.x < _Rect1.z && i.texcoord.y > _Rect1.y && i.texcoord.y < _Rect1.w)
                {
                    color.r *= _RedMultiplier;
                    color.g *= _GreenMultiplier;
                    color.b *= _BlueMultiplier;
                }
                if (i.texcoord.x > _Rect2.x && i.texcoord.x < _Rect2.z && i.texcoord.y > _Rect2.y && i.texcoord.y < _Rect2.w)
                {
                    color.r *= _RedMultiplier;
                    color.g *= _GreenMultiplier;
                    color.b *= _BlueMultiplier;
                }*/

                /*color.r *= _RedMultiplier;
                color.g *= _GreenMultiplier;
                color.b *= _BlueMultiplier;*/
                return color;
            }
            ENDCG
         }
    }
    //FallBack "Diffuse"
}
