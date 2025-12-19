var offset = scr_is_switch_os() ? 0.015 : 0;
text_list = [new scr_video_caption(stringsetloc("It's now time for our feature presentation", "obj_ch3_couch_video_slash_Create_0_gml_4_0"), 0.02 + offset, 0.13 + offset), new scr_video_caption(stringsetloc("Coming straight from your house", "obj_ch3_couch_video_slash_Create_0_gml_6_0"), 0.22 + offset, 0.27 + offset), new scr_video_caption(stringsetloc("Coming straight from YOUR house", "obj_ch3_couch_video_slash_Create_0_gml_7_0"), 0.28 + offset, 0.32 + offset), new scr_video_caption(stringsetloc("He's the One", "obj_ch3_couch_video_slash_Create_0_gml_8_0"), 0.34 + offset, 0.39 + offset), new scr_video_caption(stringsetloc("He's GROOVY and NEVER glooby!", "obj_ch3_couch_video_slash_Create_0_gml_9_0"), 0.44 + offset, 0.51 + offset), new scr_video_caption(stringsetloc("You can't get this from an EGG!", "obj_ch3_couch_video_slash_Create_0_gml_10_0"), 0.52 + offset, 0.57 + offset), new scr_video_caption(stringsetloc("The sensation of your screen", "obj_ch3_couch_video_slash_Create_0_gml_11_0"), 0.58 + offset, 0.62 + offset), new scr_video_caption(stringsetloc("The show that makes you scream", "obj_ch3_couch_video_slash_Create_0_gml_12_0"), 0.63 + offset, 0.67 + offset), new scr_video_caption(stringsetloc("Say it with him, folks!", "obj_ch3_couch_video_slash_Create_0_gml_13_0"), 0.68 + offset, 0.73 + offset)];

if (global.lang == "ja")
{
    array_insert(text_list, 1, new scr_video_caption("はぢまるヨ！", 0.17 + offset, 0.21 + offset));
    array_insert(text_list, 5, new scr_video_caption("ユイーツ ムニの", 0.4 + offset, 0.43 + offset));
}

text_index = 0;
house_index = (global.lang == "ja") ? 3 : 2;
// var file_name = (global.lang == "ja") ? "tennaIntroJPf1_compressed_28" : "tennaIntroF1_compressed_28";
var file_name = (global.names == 2) ? "tennaIntroF1_zhname_compressed_28" : "tennaIntroF1_compressed_28";
video_open("vid/" + file_name + ".mp4");
video_enable_loop(false);

if (!global.is_console)
    video_set_volume(0.3);

videochromasampler = -4;
var _format = video_get_format();

if (_format == 1)
    videochromasampler = shader_get_sampler_index(shd_video_yuv, "v_chroma");

target_duration = 0;

if (scr_is_switch_os())
    target_duration = 1224;

video_position = 0;
