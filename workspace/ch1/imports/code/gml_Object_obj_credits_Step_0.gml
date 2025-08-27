timer += 1;

if (timer == 1)
{
    song0 = snd_init("dontforget.ogg");
    song1 = mus_play(song0);
}

if (timer == 60)
    lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_13_0");

if (timer == 108)
{
    lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_19_0");
    line[0] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_21_0");
    line[1] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_22_0");
    line[2] = " ";
    line[3] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_24_0");
}

if (timer == 180)
{
    if (global.lang == "en")
        lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_33_0");
}

if (timer == 201)
{
    line[0] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_38_0");
    line[1] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_39_0");
    line[2] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_40_0");
    line[3] = " ";
    line[4] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_42_0");
    linecolor[0] = c_ltgray;
    linecolor[1] = c_ltgray;
    linecolor[2] = c_ltgray;
    linecolor[4] = c_white;
    
    if (global.lang == "ja")
        lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_33_0");
}

if (timer == 278)
{
    if (global.lang == "en")
        lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_54_0");
}

if (timer == 298)
{
    line[0] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_59_0");
    line[1] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_60_0");
    line[2] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_61_0");
    linecolor[2] = c_ltgray;
    line[3] = " ";
    line[4] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_64_0");
    
    if (global.lang == "ja")
        lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_54_0");
}

if (timer == 366)
{
    if (global.lang == "en")
        lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_70_0");
}

if (timer == 390)
{
    line[0] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_95_0");
    line[1] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_96_0");
    line[2] = " ";
    line[3] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_98_0");
    line[4] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_99_0");
    linecolor[0] = c_ltgray;
    linecolor[1] = c_white;
    linecolor[3] = c_ltgray;
    linecolor[4] = c_white;
    
    if (global.lang == "ja")
        lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_70_0");
}

if (timer >= 480 && timer <= 520)
{
    creditalpha -= 0.025;
    textalpha -= 0.025;
}

if (timer == 526)
{
    textalpha = 1;
    lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_89_0");
}

if (timer == 573)
{
    creditalpha = 1;
    line[0] = "汉化校对[2025]";
    line[1] = "鲟鱼子，旋风SELF，单衫_石宇砖";
    line[2] = "鸥皇不欧，FH丶CY，yzdnn，JH";
    line[3] = "丢丢hamburger，ax暗星233，鼠球";
    line[4] = "杜若(santizhizi)，CoCo水君(Toast)";
    line[5] = "Cupcake～，w1n1n1t351，onomi";
    line[6] = "汉化美工";
    line[7] = "JH，米粒，闻笛，yzdnn";
    linecolor[0] = c_ltgray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
    linecolor[3] = c_white;
    linecolor[4] = c_white;
    linecolor[5] = c_white;
    linecolor[6] = c_ltgray;
    linecolor[7] = c_white;
    
    if (global.lang == "ja")
    {
        line[0] = "ローカライズプロデューサー";
        line[3] = "追加プログラミング";
        line[4] = "Gregg Tavares (PC版)";
        line[5] = "Sarah O'Donnell (コンシューマー版)";
        line[6] = "Fred Wood";
        line[7] = "Henri Beeres (Enjl)";
    }
    
    lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_108_0");
}

if (timer == 645)
{
    if (global.lang == "en")
        lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_113_0");
}

if (timer == 668)
{
    line[0] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_119_0");
    line[1] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_120_0");
    line[2] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_121_0");
    line[3] = "Snowdrake & Monster Kid 设计";
    line[4] = "Magnolia Porter";
    line[5] = "";
    line[6] = "";
    line[7] = "";
    linecolor[0] = c_ltgray;
    linecolor[1] = c_ltgray;
    linecolor[2] = c_white;
    linecolor[3] = c_ltgray;
    linecolor[4] = c_white;
    
    if (global.lang == "ja")
        line[3] = "ライちゃん／モンスターの子　デザイン";
    
    if (global.lang == "ja")
        lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_113_0");
}

if (timer == 735)
    lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_131_0");

if (timer == 765)
{
    line[0] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_152_0");
    line[1] = "Gigi DG (服饰＆配色协助)";
    line[2] = "Betty Kwong (Temmie设计)";
    line[3] = "256graph (日语本地化绘图)";
    line[4] = "Ryan Alyea (网站)";
    line[5] = "Brian Coia (网站)";
    linecolor[0] = c_ltgray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
    linecolor[3] = c_white;
    linecolor[4] = c_white;
    linecolor[5] = c_white;
    
    if (global.lang == "ja")
    {
        line[1] = "Gigi DG (カラーアシタンス)";
        line[2] = "Betty Kwong (テミー・デザイン)";
        line[3] = "256graph (日本語グラフィック)";
        line[4] = "Ryan Alyea (ウェブサイト)";
        line[5] = "Brian Coia (ウェブサイト)";
    }
}

if (timer == 798)
    lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_147_0");

if (timer == 870)
{
    line[0] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_152_0");
    line[1] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_153_0");
    line[2] = "Fontworks Inc.";
    line[3] = "Yutaka Sato (Happy Ruika)";
    line[4] = "Hiroko Minamoto";
    line[5] = "8-4 & Fangamer全体员工";
    linecolor[1] = c_white;
}

if (timer >= 960 && timer <= 1030)
{
    creditalpha -= 0.02;
    textalpha -= 0.02;
}

if (timer == 1033)
{
    textalpha = 1;
    lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_174_0");
}

if (timer == 1086)
    lyric = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_180_0");

if (timer >= 1300)
{
    if (timer <= 1560 && creditalpha < 1)
        creditalpha += 0.01;
    
    if (timer >= 1560 && creditalpha > 0)
        creditalpha -= 0.01;
    
    line[0] = scr_84_get_lang_string("obj_credits_slash_Step_0_gml_187_0");
    line[1] = " ";
    linecolor[0] = c_white;
    linecolor[1] = c_white;
    line[2] = " ";
    line[3] = " ";
    line[4] = " ";
    line[5] = " ";
    textalpha -= 0.01;
}

if (timer == 1660)
    snd_free(song0);

if (timer == 1680)
    room_goto(room_chapter_continue);
