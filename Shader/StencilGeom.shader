// learn from [Impossible Geometry with Stencil Shaders in Unity URP - YouTube](https://www.youtube.com/watch?v=EzM8LGzMjmc)
Shader "Unlit/StencilGeom"
{
    Properties
    {
        [IntRange] _StencilID ("Stencil ID", Range(0, 255)) = 0
    }
    SubShader
    {
        Tags 
        {
            "RenderType"="Opaque"
            "RenderPipeline"="UniversalPipeline"
            "Queue"="Geometry"
        }
        Pass
        {
            Blend Zero One
            Zwrite Off
            Stencil
            {
                Ref[_StencilID]
                Comp Always
                Pass Replace
                Fail Keep
            }
        }
    }
}
