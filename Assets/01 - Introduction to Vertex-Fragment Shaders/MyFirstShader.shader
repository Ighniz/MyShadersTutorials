Shader "MyShadersTutorials/01/MyFirstShader"
{
    Properties
    {
        _MainColor("Main Color", Color) = (0, 0, 0, 1)
        _SecondaryColor("Secondary Color", Color) = (1, 1, 1, 1)
    }

    SubShader
    {
        Pass
        {
            Blend SrcAlpha OneMinusSrcAlpha
        
            CGPROGRAM

            #pragma vertex VertexFunction
            #pragma fragment FragmentFunction

            float4 _MainColor;
            float4 _SecondaryColor;

            struct VertexData
            {
                float4 vertexPosition : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct FragmentData
            {
                float4 vertexPosition : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            FragmentData VertexFunction(VertexData input)
            {
                FragmentData output;
                output.vertexPosition = UnityObjectToClipPos(input.vertexPosition);
                output.uv = input.uv;
                float4 f = mul(unity_ObjectToWorld, input.vertexPosition);
                return output;
            }

            float4 FragmentFunction(FragmentData input) : SV_TARGET
            {
                float4 finalColor;
                if(input.uv.x < 0.5 && input.uv.y < 0.5)
                {
                    finalColor = _MainColor;
                }else
                {
                    finalColor = _SecondaryColor;
                }
                
                return finalColor;
            }

            ENDCG
        }
    }
}