if (timer == 0)
{
    snd_free_all();
    song0 = snd_init("ch2_credits.ogg");
    song1 = mus_play(song0);
    line[0] = stringsetloc("DELTARUNE", "obj_credits_slash_Step_0_gml_21_0");
    line[1] = stringsetloc("Chapter 2", "obj_credits_slash_Step_0_gml_22_0");
    line[2] = stringset(" ");
    line[3] = stringsetloc("by Toby Fox", "obj_credits_slash_Step_0_gml_24_0");
}

timer++;

if (timer == 100)
{
    line[0] = stringsetloc("-Main Artist-", "obj_credits_2_slash_Step_0_gml_27_0");
    line[1] = stringsetloc("-Main Animator-", "obj_credits_2_slash_Step_0_gml_28_0");
    line[2] = stringset("Temmie Chang");
    line[3] = stringset(" ");
    line[4] = stringset(" ");
    line[5] = stringset(" ");
    line[6] = stringset(" ");
    line[7] = stringset(" ");
    linecolor[0] = menugray;
    linecolor[1] = menugray;
    linecolor[2] = c_white;
}

if (timer == 201)
{
    line[0] = stringsetloc("-Main Team-", "obj_credits_2_slash_Step_0_gml_42_0");
    line[1] = stringset("Sarah O'Donnell");
    line[2] = stringset("Juju (Taxiderby)");
    line[3] = stringset("Fred Wood");
    line[4] = stringset("Jean Canellas");
    line[5] = stringset("Xan Wetherall");
    line[6] = stringset(" ");
    line[7] = stringset(" ");
    linecolor[0] = menugray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
    linecolor[3] = c_white;
    linecolor[4] = c_white;
    linecolor[5] = c_white;
    linecolor[6] = c_white;
    linecolor[7] = c_white;
}

if (timer == 302)
{
    creditalpha = 1;
    line[0] = stringsetloc("-BG Concept Art-", "obj_credits_2_slash_Step_0_gml_68_0");
    line[1] = stringsetloc("(Cyber Field, City, Mansion)", "obj_credits_2_slash_Step_0_gml_69_0");
    line[2] = stringset("Gigi DG");
    line[3] = stringset(" ");
    line[4] = stringsetloc("-Dark World Costume Design-", "obj_credits_2_slash_Step_0_gml_72_0");
    line[5] = stringsetloc("Gigi DG [Kris, Susie]", "obj_credits_2_slash_Step_0_gml_73_0");
    line[6] = stringsetloc("Tcheska Lynn B (chess) [Berdly]", "obj_credits_2_slash_Step_0_gml_74_0");
    line[7] = stringset(" ");
    linecolor[0] = menugray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
    linecolor[3] = c_white;
    linecolor[4] = menugray;
    linecolor[5] = c_white;
    linecolor[6] = c_white;
    linecolor[7] = c_white;
}

if (timer == 403)
{
    line[0] = stringsetloc("-Guest Character Design-", "obj_credits_2_slash_Step_0_gml_88_0");
    line[1] = stringsetloc("(Lancer, Rudinn, Hathy)", "obj_credits_2_slash_Step_0_gml_89_0");
    line[2] = stringsetloc("(Clover, King, Jevil)", "obj_credits_2_slash_Step_0_gml_90_0");
    line[3] = stringset("Kanotynes");
    line[4] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_92_0");
    line[5] = stringsetloc("-Singing This Song-", "obj_credits_2_slash_Step_0_gml_93_0");
    line[6] = stringset("Laura Shigihara");
    line[7] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_95_0");
    linecolor[0] = menugray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
    linecolor[3] = c_white;
    linecolor[4] = c_white;
    linecolor[5] = menugray;
    linecolor[6] = c_white;
    linecolor[7] = c_white;
}

if (timer == 503)
{
    textalpha = 1;
    line[0] = stringsetloc("-Guest Character Design-", "obj_credits_2_slash_Step_0_gml_109_0");
    line[1] = stringsetloc("(Poppup, Ambyu-Lance, Hacker, etc.)", "obj_credits_2_slash_Step_0_gml_110_0");
    line[2] = stringset("Samanthuel Gillson (splendidland)");
    line[3] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_112_0");
    line[4] = stringsetloc("-Guest Character Design-", "obj_credits_2_slash_Step_0_gml_113_0");
    line[5] = stringsetloc("(Sweet, Cap'n, K_K)", "obj_credits_2_slash_Step_0_gml_114_0");
    line[6] = stringsetloc("(Tasque Manager)", "obj_credits_2_slash_Step_0_gml_115_0");
    line[7] = stringset("NELNAL");
    linecolor[0] = menugray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
    linecolor[3] = c_white;
    linecolor[4] = menugray;
    linecolor[5] = c_white;
    linecolor[6] = c_white;
    linecolor[7] = c_white;
}

if (timer == 604)
{
    creditalpha = 1;
    line[0] = stringsetloc("-Pixel Art Assistance-", "obj_credits_2_slash_Step_0_gml_131_0");
    line[1] = stringset("Shawn (puppiesandanime)");
    line[2] = stringset("Kenju");
    line[3] = stringset("Tcheska Lynn B (chess)");
    line[4] = stringset("Satoshi Maruyama");
    line[5] = stringset(" ");
    line[6] = stringsetloc("-Development Tools (Cool)-", "obj_credits_2_slash_Step_0_gml_137_0");
    line[7] = stringset("Juju Adams");
    linecolor[0] = menugray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
    linecolor[3] = c_white;
    linecolor[4] = c_white;
    linecolor[5] = c_white;
    linecolor[6] = menugray;
    linecolor[7] = c_white;
}

if (timer == 705)
{
    line[0] = stringsetloc("-Programming Assistance-", "obj_credits_2_slash_Step_0_gml_151_0");
    line[1] = stringset("Sara Spalding");
    line[2] = stringset("Lars Korendijk");
    line[3] = stringset(" ");
    line[4] = stringsetloc("-Cutscene Assistance-", "obj_credits_2_slash_Step_0_gml_155_0");
    line[5] = stringsetloc("Tcheska Lynn B (chess)", "obj_credits_2_slash_Step_0_gml_156_0");
    line[6] = stringsetloc("Chelsea Saunders (pixelatedcrown)", "obj_credits_2_slash_Step_0_gml_157_0");
    line[7] = stringset(" ");
    linecolor[0] = menugray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
    linecolor[3] = c_white;
    linecolor[4] = menugray;
    linecolor[5] = c_white;
    linecolor[6] = c_white;
    linecolor[7] = c_white;
}

if (timer == 805)
{
    creditalpha = 1;
    line[0] = stringsetloc("-Music Assistance-", "obj_credits_2_slash_Step_0_gml_171_0");
    line[1] = stringset("Lena Raine");
    line[2] = stringset("Marcy Nabors");
    line[3] = stringset(" ");
    line[4] = stringsetloc("-UT Character Design-", "obj_credits_2_slash_Step_0_gml_175_0");
    line[5] = stringsetloc("Betty Kwong (Temmie)", "obj_credits_2_slash_Step_0_gml_176_0");
    
    if (global.lang == "en")
    {
        line[6] = stringset("Magnolia Porter (Snowdrake, Monster Kid)");
        line[7] = stringset(" ");
    }
    else
    {
        line[6] = stringset("Magnolia Porter");
        line[7] = stringsetloc("(オワライチョウ／モンスターの子)", "obj_credits_2_slash_Step_0_gml_177_0");
    }
    
    linecolor[0] = menugray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
    linecolor[3] = c_white;
    linecolor[4] = menugray;
    linecolor[5] = c_white;
    linecolor[6] = c_white;
    linecolor[7] = c_white;
}

if (timer == 906)
{
    line[0] = stringsetloc("-Japanese Localization-", "obj_credits_2_slash_Step_0_gml_191_0");
    line[1] = stringsetloc("8-4 Ltd.", "obj_credits_2_slash_Step_0_gml_192_0");
    line[2] = stringset(" ");
    line[3] = stringsetloc("-Translator-", "obj_credits_2_slash_Step_0_gml_194_0");
    line[4] = stringset("夕葵，米粒(enderesting)，单衫_石宇砖");
    line[5] = stringset("无辣味wdw，Neubulae[Almona]，JH");
    line[6] = stringset("鲟鱼子，瑶玲，^1瓶洋酒[Unsub]");
    line[7] = stringset("以太[EtherKo]，Coco，Buttons");
    line[7] = stringset("TNN_Endymion，wiike，田澄，iNTb");
    linecolor[0] = menugray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
    linecolor[3] = menugray;
    linecolor[4] = c_white;
    linecolor[5] = c_white;
    linecolor[6] = c_white;
    linecolor[7] = c_white;
    linecolor[8] = c_white;
}

if (timer == 1007)
{
    line[0] = stringsetloc("-Localization Producers-", "obj_credits_2_slash_Step_0_gml_211_0");
    line[1] = stringset("旋风SELF，FH丶CY，单衫_石宇砖");
    line[2] = stringset("Uni，Cupcake～，鼠球，鸥皇不欧，JH");
    line[3] = stringset("w1n1n1t351，丢丢hamburger，onomi");
    line[4] = stringset("Neubulae[Almona]，凝雨白沙，黎小明");
    line[5] = stringsetloc("-Localization Support-", "obj_credits_2_slash_Step_0_gml_215_0");
    line[6] = stringset("夕葵，JH，瑶玲，米粒(enderesting)");
    line[7] = stringset("Buttons，空闲，单衫_石宇砖");
    linecolor[0] = menugray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
    linecolor[3] = c_white;
    linecolor[4] = c_white;
    linecolor[5] = menugray;
    linecolor[6] = c_white;
    linecolor[7] = c_white;
}

if (timer == 1108)
{
    line[0] = stringsetloc("-Platform Programming-", "obj_credits_2_slash_Step_0_gml_231_0");
    line[1] = stringset("Sarah O'Donnell");
    line[2] = stringset("Henri Beeres (Enjl)");
    line[3] = stringsetloc("-Programming Support-", "obj_credits_2_slash_Step_0_gml_234_0");
    line[4] = stringset("Gregg Tavares");
    line[5] = stringset(" ");
    line[6] = stringsetloc("-Japanese Graphics-", "obj_credits_2_slash_Step_0_gml_236_0");
    line[7] = stringset("256graph");
    linecolor[0] = menugray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
    linecolor[3] = menugray;
    linecolor[4] = c_white;
    linecolor[5] = c_white;
    linecolor[6] = menugray;
    linecolor[7] = c_white;
}

if (timer == 1208)
{
    line[0] = stringsetloc("-QA-", "obj_credits_2_slash_Step_0_gml_251_0");
    line[1] = stringsetloc("DIGITAL HEARTS Co., Ltd.", "obj_credits_2_slash_Step_0_gml_252_0");
    line[2] = stringsetloc("Tomohiro Nakai [QA Project Manager]", "obj_credits_2_slash_Step_0_gml_253_0");
    line[3] = stringsetloc("Tomoyoshi Yamashita [QA Lead]", "obj_credits_2_slash_Step_0_gml_254_0");
    line[4] = stringsetloc("Ryohei Kishimoto [QA Assistant Lead]", "obj_credits_2_slash_Step_0_gml_255_0");
    line[5] = stringsetloc("Shinji Yasue [Sales Dept]", "obj_credits_2_slash_Step_0_gml_256_0");
    line[6] = stringset(" ");
    line[7] = stringset(" ");
    linecolor[0] = menugray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
    linecolor[3] = c_white;
    linecolor[4] = c_white;
    linecolor[5] = c_white;
    linecolor[6] = c_white;
    linecolor[7] = c_white;
}

if (timer == 1309)
{
    line[0] = stringsetloc("-Super Testers-", "obj_credits_2_slash_Step_0_gml_271_0");
    line[1] = stringset("AlexMdle");
    line[2] = stringset("PureQuestion");
    line[3] = stringset(" ");
    line[4] = stringsetloc("-Website-", "obj_credits_2_slash_Step_0_gml_275_0");
    line[5] = stringset("Brian Coia");
    line[6] = stringset(" ");
    line[7] = stringset(" ");
    linecolor[0] = menugray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
    linecolor[3] = c_white;
    linecolor[4] = menugray;
    linecolor[5] = c_white;
    linecolor[6] = c_white;
    linecolor[7] = c_white;
}

if (timer == 1410)
{
    line[0] = stringset(" ");
    line[1] = stringset(" ");
    line[2] = stringset(" ");
    line[3] = stringset(" ");
    line[4] = stringset(" ");
    line[5] = stringset(" ");
    line[6] = stringset(" ");
    line[7] = stringset(" ");
    linecolor[0] = c_white;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
    linecolor[3] = c_white;
    linecolor[4] = c_white;
    linecolor[5] = c_white;
    linecolor[6] = c_white;
    linecolor[7] = c_white;
    drawtesters = true;
}

if (timer == 1511)
{
    drawtesters = false;
    line[0] = stringsetloc("-Special Thanks-", "obj_credits_2_slash_Step_0_gml_314_0");
    line[1] = stringset("Hiroko Minamoto");
    line[2] = stringset("Fontworks Inc.");
    line[3] = stringset("Yutaka Sato (Happy Ruika)");
    line[4] = stringsetloc("All 8-4 & Fangamer Staff", "obj_credits_2_slash_Step_0_gml_318_0");
    line[5] = stringset("Claire & Andrew");
    line[6] = stringset("Brian Lee");
    line[7] = stringset("YoYo Games");
    linecolor[0] = menugray;
    linecolor[1] = c_white;
    linecolor[2] = c_white;
    linecolor[3] = c_white;
    linecolor[4] = c_white;
    linecolor[5] = c_white;
    linecolor[6] = c_white;
    linecolor[7] = c_white;
}

if (timer == 1611)
{
    creditalpha = 0;
    line[0] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_339_0");
    line[1] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_340_0");
    line[2] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_341_0");
    line[3] = stringsetloc("To be continued", "obj_credits_slash_Step_0_gml_191_0");
    line[4] = " ";
    line[5] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_344_0");
    line[6] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_345_0");
    line[7] = stringsetloc(" ", "obj_credits_2_slash_Step_0_gml_346_0");
    linecolor[0] = c_white;
    linecolor[1] = c_white;
    textalpha -= 0.01;
}

if (timer > 1641 && timer < 1711)
{
    if (creditalpha != 1)
        creditalpha += 0.02;
}

if (timer >= 1801)
{
    creditalpha -= 0.05;
    
    if (creditalpha < -0.1)
        room_goto(room_chapter_continue);
}

if (timer > 1744 && timer < 1910)
    creditalpha += 0.02;

if (timer > 1910)
    creditalpha -= 0.02;
