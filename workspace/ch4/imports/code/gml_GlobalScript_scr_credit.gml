function scr_credit(arg0, arg1, arg2 = 1) constructor
{
    header = arg0;
    text_line = arg1;
    columns = arg2;
}

function generate_credits()
{
    var credits = [];
    credits[0] = [new scr_credit([stringsetloc("-Main Artist-", "scr_credit_slash_scr_credit_gml_18_0"), stringsetloc("-Main Animator-", "scr_credit_slash_scr_credit_gml_19_0")], [stringset("Temmie Chang")])];
    credits[1] = [new scr_credit([stringsetloc("-Main Team-", "scr_credit_slash_scr_credit_gml_29_0")], [stringset("Sarah O'Donnell"), stringset("Juju (Taxiderby)"), stringset("Fred Wood"), stringset("Jean Canellas"), stringset("AlexMdle"), stringset("PureQuestion")])];
    credits[2] = [new scr_credit([stringsetloc("-Main Team-", "scr_credit_slash_scr_credit_gml_44_0_b")], [stringset("Henri Beeres (Enjl)"), stringset("Joost (waddle)"), stringset("Sara Spalding (SaraJS)"), stringset("Robert Sephazon (Producer)")]), new scr_credit([stringsetloc("Mike Maker (PC ver.)", "scr_credit_slash_scr_credit_gml_54_0_b")], [stringset("Andy Brophy")])];
    credits[3] = [new scr_credit([stringset("-背景, 服饰, 泰坦概念艺术-")], [stringset("Gigi DG")]), new scr_credit([stringsetloc("-Old Man's Theme Arrangement-", "scr_credit_slash_scr_credit_gml_71_0")], [stringset("Alex Rosetti")]), new scr_credit([stringset("-人声演唱 (圣域, 职员表)-")], [stringset("Itoki Hana")])];
    
    if (global.lang == "ja")
    {
        credits[3][0].header = [stringset("-コンセプト アート-"), stringset("(背景／コスチューム／タイタン)")];
        credits[3][2].header = [stringset("-歌-"), stringset("(サンクチュアリ／クレジット)")];
    }
    
    credits[4] = [new scr_credit([stringsetloc("-Live Piano Editing-", "scr_credit_slash_scr_credit_gml_88_0")], [stringset("Lena Raine")]), new scr_credit([stringset("-泰坦之手, Kris弹钢琴动画-")], [stringset("Smallbu Animation")]), new scr_credit([stringsetloc("-Pixel Art Assistance-", "scr_credit_slash_scr_credit_gml_102_0")], [stringset("Clairevoire"), stringset("Satoshi Maruyama")])];
    
    if (global.lang == "ja")
        credits[4][1].header = [stringset("-アニメーション-"), stringset("（タイタンの手／クリスのピアノ）")];
    
    if (global.names == 2)
        credits[4][1].header = [stringset("Smallbu Animation"), stringset("-泰坦之手, 克里斯弹钢琴动画-")];
    
    credits[5] = [new scr_credit([stringsetloc("-Additional FX-", "scr_credit_slash_scr_credit_gml_113_0")], [stringset("James Begg")]), new scr_credit([stringsetloc("-Additional Animation Assistance-", "scr_credit_slash_scr_credit_gml_120_0_b")], [stringset("Mariel Kinuko Cartwright")])];
    credits[6] = [new scr_credit([stringsetloc("-Guest Character Design-", "scr_credit_slash_scr_credit_gml_64_0")], [stringsetloc("(Lancer, Rudinn, Hathy)", "scr_credit_slash_scr_credit_gml_67_0"), stringsetloc("(Clover, King, Jevil)", "scr_credit_slash_scr_credit_gml_68_0"), stringset("Kanotynes")]), new scr_credit([stringsetloc("-Ch. 2&3 Guest Character Design-", "scr_credit_slash_scr_credit_gml_146_0")], [stringset("Samanthuel Gillson (splendidland)"), stringset("NELNAL")])];
    credits[7] = [new scr_credit([stringsetloc("-3D Assets, Anim, Posing-", "scr_credit_slash_scr_credit_gml_129_0")], [stringset("Chelsea Saunders (pixelatedcrown)")]), new scr_credit([stringsetloc("-Development Tools (Cool)-", "scr_credit_slash_scr_credit_gml_164_0")], [stringset("Juju Adams")]), new scr_credit([stringsetloc("-UT Character Design-", "scr_credit_slash_scr_credit_gml_171_0")], [stringset("Betty Kwong (Temmie)"), stringset("Magnolia Porter (Snowdrake, Monster Kid)")])];
    credits[8] = [new scr_credit([stringsetloc("-Japanese Localization-", "scr_credit_slash_scr_credit_gml_170_0")], [stringsetloc("8-4, Ltd.", "scr_credit_slash_scr_credit_gml_173_0")]), new scr_credit([stringsetloc("-Translator-", "scr_credit_slash_scr_credit_gml_177_0")], [stringset("yzdnn，单衫_石宇砖，夕葵，Buttons \n 便利贴不翘边，晓晓_Akatsuki(特殊字体)")])];
    credits[9] = [new scr_credit([stringsetloc("-Localization Producers-", "scr_credit_slash_scr_credit_gml_187_0")], [stringset("单衫_石宇砖，鸥皇不欧，凤凰山芭蕉^1  \n OceanBear，Felixeffe.，FH丶CY \n 瑶玲，yzdnn，就是菜刀，AX暗星233 \n Uni，瓦斯霓特·洋芋，米粒(enderesting) \n w1n1n1t351，夕葵，鼠球，Mercurypie \n 一瓶洋酒，Cupcake~，Lucas·曹·CKC \n 旋风SELF，凝雨白沙，Neubulae[Almona] \n JH，黎小明，CoCo水君(Toast)，无辣味wdw \n\n\n  云凝沙，Shine晓光，Mr_H2T"), stringset("")]), new scr_credit([stringsetloc("-Localization Support-", "scr_credit_slash_scr_credit_gml_195_0")], [stringset(""), stringset(""), stringset(""), stringset(""), stringset("")])];
    credits[10] = [new scr_credit([stringsetloc("-Platform Programming-", "scr_credit_slash_scr_credit_gml_207_0")], [stringset("Sarah O'Donnell"), stringset("Henri Beeres (Enjl)")]), new scr_credit([stringsetloc("-Programming Support-", "scr_credit_slash_scr_credit_gml_214_0")], [stringset("Gregg Tavares")]), new scr_credit([stringsetloc("-Japanese Graphics-", "scr_credit_slash_scr_credit_gml_221_0")], [stringset("256graph"), stringset("Satoshi Maruyama")])];
    credits[11] = [new scr_credit([stringsetloc("-QA-", "scr_credit_slash_scr_credit_gml_231_0"), stringsetloc("DIGITAL HEARTS Co., Ltd.", "scr_credit_slash_scr_credit_gml_234_0")], [stringset("Yoshikazu Hironaka"), stringset("Riku Shimizu"), stringset("Akira Ishiki"), stringset("Hidemi Miyauchi"), stringset("Kazutaka Kawahara"), stringset("Yuta Nishimura"), stringset("Daisuke Nakaie"), stringset("Shinji Yasue"), stringset("Taishi Mukaigawara"), stringset("Hiromasa Tokida"), stringset("Yuki Takeuchi"), stringset("Yu Takamori"), stringset("Yuta Doi"), stringset("Yuki Wada"), stringset("Satoru Watanuki"), stringset("Monami Katayama")], 2)];
    credits[12] = [new scr_credit([stringsetloc("-Super Testers-", "scr_credit_slash_scr_credit_gml_245_0")], [stringset("Esteban Criado (DruidVorse)")]), new scr_credit([stringsetloc("-Website-", "scr_credit_slash_scr_credit_gml_253_0")], [stringset("Brian Coia")])];
    credits[13] = [new scr_credit([stringsetloc("-Fangamer Testing-", "scr_credit_slash_scr_credit_gml_263_0")], [stringset("Chris Warriner"), stringset("Ryan Alyea"), stringset("Alexandro Arvizu"), stringset("Dan Moore"), stringset("Jack Murphy"), stringset("heavenchai"), stringset("Charlie Verdin"), stringset("Steven Thompson")], 2), new scr_credit([stringsetloc("-Trailers & All Video Editing-", "scr_credit_slash_scr_credit_gml_277_0")], [stringset("Everdraed")])];
    credits[14] = [new scr_credit([stringsetloc("-Special Thanks-", "scr_credit_slash_scr_credit_gml_287_0")], [stringset("Hiroko Minamoto"), stringset("Graeme Howard"), stringset("Yutaka Sato (Happy Ruika)"), stringsetloc("All 8-4 & Fangamer Staff", "scr_credit_slash_scr_credit_gml_293_0"), stringset("Claire & Andrew"), stringset("Brian Lee"), stringset("YoYo Games")])];
    return credits;
}
