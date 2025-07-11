// 頂点シェーダーへの入力
struct VSInput
{
    float4 pos : POSITION;
    float2 uv  : TEXCOORD;
};

// 頂点シェーダーの出力
struct VSOutput
{
    float4 pos : SV_POSITION;
    float2 uv  : TEXCOORD;
};

sampler g_sampler : register(s0);
Texture2D g_texture : register(t0);

// step-9 頂点シェーダーを実装
VSOutput VSMain(VSInput input)
{
    VSOutput output;
    output.pos = input.pos; // 位置をそのまま出力
    output.uv = input.uv;   // UV座標をそのまま出力
    return output;
}

// step-10 ピクセルシェーダーを実装
float4 PSMain(VSOutput input) : SV_TARGET
{
    // テクスチャから色を取得
    float4 color = g_texture.Sample(g_sampler, input.uv);
    return color; // 取得した色をそのまま出力
}
