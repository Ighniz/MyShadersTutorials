Shader "MyShadersTutorials/01/MyFirstShader"
{
    Properties
    {
        
    }

    SubShader
    {
        Pass
        {
            CGPROGRAM

            #pragma vertex VertexFunction
            #pragma fragment FragmentFunction

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
                    finalColor = float4(0, 0, 0, 1);
                }else
                {
                    finalColor = float4(1, 1, 1, 1);
                }
                
                return finalColor;
            }

            ENDCG
        }
    }
}