shader "custom/lambert"
{
    Properties
    {
    _MainColor("Albedo", Color) = (1, 1, 1, 1)
    _FallOffDiffuse ("Falloff Diffuse", Range (0.0, 0.5)) = 0.5
    }

    SubShader
    {
        tags 
        {
            "RenderType" = "Opaque"
            "Queue" = "Geometry"
        }
        CGPROGRAM
        #pragma surface surf Lambert

        half4 LightinDiffuse(SurfaceOutput s, half3 lightDir, half atten)
        {
        half4 c = half4(0,0,0,0) ; 
        half Ndot = dot(s.Normal, lightDir);
        c.rgb = s.Albedo * _LightColor0.rgb * Ndot * atten;
        c.a = s.Albedo;
        return c;
        }

        fixed4 _MainColor; 

        struct Input
        {
            fixed3 color;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _MainColor.rgb;
        }


        ENDCG
    }
}