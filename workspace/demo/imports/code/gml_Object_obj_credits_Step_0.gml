timer += 1;

if (timer == 1)
{
    snd_free_all();
    song0 = snd_init("ch2_credits.ogg");
    song1 = mus_play(song0);
    line[0] = stringsetloc("DELTARUNE", "obj_credits_slash_Step_0_gml_21_0");
    line[1] = stringsetloc("Chapter 2", "obj_credits_slash_Step_0_gml_22_0");
    line[2] = stringset(" ");
    line[3] = stringsetloc("by Toby Fox", "obj_credits_slash_Step_0_gml_24_0");
}

if (timer == 100)
{
    line[0] = stringsetloc("Main Artist, Animator, & Cleanup", "obj_credits_slash_Step_0_gml_38_0");
    line[1] = stringsetloc("(BG, Overworld, Battle)", "obj_credits_slash_Step_0_gml_39_0");
    line[2] = stringsetloc("(Sepia and Menu Art)", "obj_credits_slash_Step_0_gml_40_0");
    line[3] = stringset(" ");
    line[4] = stringset("Temmie Chang");
    linecolor[0] = c_ltgray;
    linecolor[1] = c_ltgray;
    linecolor[2] = c_ltgray;
    linecolor[4] = c_white;
}

if (timer == 200)
{
    line[0] = stringsetloc("Main Team", "obj_credits_slash_Step_0_gml_52_0");
    line[1] = stringset("Sarah O'Donnell");
    line[2] = stringset("Juju (taxiderby)");
    line[3] = stringset("Fred Wood");
    line[4] = stringset("Jean Canellas");
    linecolor[0] = c_ltgray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
    linecolor[3] = c_white;
    linecolor[4] = c_white;
}

if (timer == 300)
{
    line[0] = stringsetloc("Lancer, Rudinn, Hathy", "obj_credits_slash_Step_0_gml_59_0");
    line[1] = stringsetloc("Clover, King, Jevil", "obj_credits_slash_Step_0_gml_60_0");
    line[2] = stringsetloc("Original Character Designs", "obj_credits_slash_Step_0_gml_61_0");
    linecolor[2] = c_ltgray;
    line[3] = stringset(" ");
    line[4] = stringset("Kanotynes");
}

if (timer == 400)
{
    line[0] = stringsetloc("Area Concept Art", "obj_credits_slash_Step_0_gml_80_0");
    line[1] = stringsetloc("Dark World Costume Design", "obj_credits_slash_Step_0_gml_81_0");
    line[2] = stringset(" ");
    line[3] = stringset("Gigi DG");
    linecolor[0] = c_ltgray;
    linecolor[1] = c_ltgray;
    linecolor[3] = c_white;
}

if (timer == 500)
{
    textalpha = 1;
    line[0] = stringsetloc("Programming Help", "obj_credits_slash_Step_0_gml_103_0");
    line[1] = stringset("Shaun Spalding");
    line[2] = stringset(" ");
    line[3] = stringsetloc("Character Design Assistance", "obj_credits_slash_Step_0_gml_106_0");
    line[4] = stringset("Samanthuel Gillson (splendidland)");
    linecolor[0] = c_ltgray;
    linecolor[1] = c_white;
    linecolor[3] = c_ltgray;
    linecolor[4] = c_white;
}

if (timer == 600)
{
    creditalpha = 1;
    line[0] = stringsetloc("Cutscene Assistance", "obj_credits_slash_Step_0_gml_119_0_b");
    line[1] = stringset("Chess");
    line[2] = stringset("PixelatedCrown");
    line[3] = stringset(" ");
    line[4] = stringsetloc("Shop and BG Pixel Assistance", "obj_credits_slash_Step_0_gml_123_0_b");
    line[5] = stringset("Shawn (puppiesandanime)");
    line[6] = stringset("Kenju");
    linecolor[0] = c_ltgray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
    linecolor[4] = c_ltgray;
    linecolor[5] = c_white;
    linecolor[6] = c_white;
}

if (timer == 700)
{
    line[0] = stringsetloc("Music Assistance", "obj_credits_slash_Step_0_gml_142_0");
    line[1] = stringset("Lena Raine");
    line[2] = stringset("Marcy Nabors");
    line[3] = stringset(" ");
    line[4] = stringsetloc("Fireworks Effect", "obj_credits_slash_Step_0_gml_146_0");
    line[5] = stringset("Lars Korendijk");
    line[6] = stringset(" ");
    linecolor[0] = c_ltgray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
    linecolor[4] = c_ltgray;
    linecolor[5] = c_white;
}

if (timer == 800)
{
    line[0] = "汉化校对[2025]";
    line[1] = "鲟鱼子，旋风SELF，单衫_石宇砖，鸥皇不欧，FH丶CY，yzdnn，JH";
    line[2] = "丢丢hamburger，ax暗星233，鼠球，杜若(santizhizi)，CoCo水君(Toast)";
    line[3] = "Cupcake～，w1n1n1t351，onomi";
    line[4] = "汉化美工";
    line[5] = "JH，米粒，闻笛，yzdnn";
    linecolor[0] = c_ltgray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
    linecolor[3] = c_white;
    linecolor[4] = c_ltgray;
    linecolor[5] = c_white;
}

if (timer == 900)
{
    line[0] = stringsetloc("Testers", "obj_credits_slash_Step_0_gml_177_0");
    line[1] = stringset("Tester A");
    line[2] = stringset("Tester B");
    line[3] = stringset(" ");
    line[4] = stringset(" ");
    line[5] = stringset(" ");
    linecolor[0] = c_ltgray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
}

if (timer == 1000)
{
    line[0] = stringsetloc("Website", "obj_credits_slash_Step_0_gml_192_0_b");
    line[1] = stringset("Ryan");
    line[2] = stringset("Brian");
    linecolor[0] = c_ltgray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
}

if (timer == 1100)
{
    line[0] = stringsetloc("Special Thanks", "obj_credits_slash_Step_0_gml_152_0");
    line[1] = stringsetloc("Fangamer", "obj_credits_slash_Step_0_gml_153_0");
    line[2] = stringset(" ");
    line[3] = stringsetloc("\"Temmie\" Character Design", "obj_credits_slash_Step_0_gml_155_0");
    line[4] = stringsetloc("Betty Kwong", "obj_credits_slash_Step_0_gml_156_0");
    linecolor[1] = c_white;
    linecolor[3] = c_ltgray;
    linecolor[4] = c_white;
}

if (timer >= 1150 && timer <= 1200)
{
    creditalpha -= 0.02;
    textalpha -= 0.02;
}

if (timer >= 1400)
{
    if (timer <= 1560 && creditalpha < 1)
        creditalpha += 0.01;
    
    if (timer >= 1560 && creditalpha > 0)
        creditalpha -= 0.01;
    
    line[0] = stringsetloc("To be continued", "obj_credits_slash_Step_0_gml_191_0");
    line[1] = stringsetloc("in Chapter 3", "obj_credits_slash_Step_0_gml_192_0");
    linecolor[0] = c_white;
    linecolor[1] = c_white;
    line[2] = stringset(" ");
    line[3] = stringset(" ");
    line[4] = stringset(" ");
    textalpha -= 0.01;
}

if (timer == 1860)
    snd_free(song0);

if (timer == 1880)
{
    global.chapter_return = -1;
    game_restart_true();
}
