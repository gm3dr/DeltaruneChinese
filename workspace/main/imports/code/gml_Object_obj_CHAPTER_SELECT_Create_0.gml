global.debug = 0;
global.is_console = scr_is_switch_os() || os_type == os_ps4 || os_type == os_ps5;

if (!variable_global_exists("bgm") || !audio_exists(global.bgm))
    global.bgm = -4;

scr_init();
_current_state = UnknownEnum.Value_0;
_chapter_in_progress = 0;
_chapter_completed = 0;
_target_chapter = -1;
_restart_room = false;
_launch_data = scr_init_launch_parameters();
_pending_titles = [];
_pending_title = -4;
_load_type = UnknownEnum.Value_0;

init = function()
{
    var max_chapter = UnknownEnum.Value_7;
    var max_available_chapter = UnknownEnum.Value_4;
    _current_state = UnknownEnum.Value_1;
    
    for (var i = 0; i < max_available_chapter; i++)
    {
        var chapter = i + 1;
        
        if (scr_chapter_save_file_exists(chapter) && !scr_completed_chapter_any_slot(chapter))
            _chapter_in_progress = chapter;
    }
    
    if (_chapter_in_progress > 0)
        _current_state = UnknownEnum.Value_2;
    
    for (var i = 0; i < max_available_chapter; i++)
    {
        var chapter = i + 1;
        
        if (scr_completed_chapter_any_slot(chapter))
            _chapter_completed = chapter;
    }
    
    if (_chapter_completed > 0)
    {
        _current_state = UnknownEnum.Value_3;
        
        if (_chapter_completed >= max_available_chapter)
            _current_state = UnknownEnum.Value_4;
    }
    
    if (!is_original_launcher(_launch_data))
        _current_state = UnknownEnum.Value_4;
    
    change_state(_current_state);
};

change_state = function(arg0, arg1)
{
    _current_state = arg0;
    
    switch (_current_state)
    {
        case UnknownEnum.Value_4:
            with (obj_screen_start)
                clean_up();
            
            start_bgm();
            create_select_screen();
            break;
        
        case UnknownEnum.Value_1:
            stop_bgm();
            create_start_screen();
            break;
        
        case UnknownEnum.Value_2:
            stop_bgm();
            create_continue_screen();
            break;
        
        case UnknownEnum.Value_3:
            stop_bgm();
            create_start_next_screen();
            break;
        
        case UnknownEnum.Value_5:
            with (obj_screen_start)
                clean_up();
            
            _pending_titles = arg1;
            
            if (scr_is_switch_os())
            {
                if (array_length(_pending_titles) > 1)
                    _load_type = UnknownEnum.Value_1;
            }
            
            if (_load_type == UnknownEnum.Value_0)
            {
                _pending_title = _pending_titles[0];
                var adjusted_list = [];
                
                for (var i = 0; i < array_length(_pending_titles); i++)
                {
                    if (_pending_titles[i] == _pending_title)
                        continue;
                    
                    adjusted_list[array_length(adjusted_list)] = _pending_titles[i];
                }
                
                _pending_titles = adjusted_list;
                create_load_prompt_screen(_pending_title.title);
            }
            else
            {
                create_load_prompt_multiple_screen(_pending_titles);
            }
            
            break;
        
        case UnknownEnum.Value_6:
            with (obj_screen_start)
                clean_up();
            
            create_load_deny_confirm_screen();
            break;
        
        case UnknownEnum.Value_0:
            with (obj_screen_start)
                clean_up();
            
            break;
    }
};

create_start_screen = function()
{
    var start_text = (global.lang == "en") ? "你想从第1章开始玩吗？" : "Chapter 1から始めますか？";
    var yes_text = (global.lang == "en") ? "是" : "はい";
    var no_text = (global.lang == "en") ? "否" : "いいえ";
    var choices = [new create_choice(yes_text, UnknownEnum.Value_0), new create_choice(no_text, UnknownEnum.Value_1)];
    var choice_offset = (global.lang == "ja") ? -20 : 0;
    var start_screen = instance_create(0, 0, obj_screen_start);
    start_screen.init(id, start_text, choices, choice_offset);
    start_screen.fade_in();
};

create_continue_screen = function()
{
    var continue_text = "你想继续玩第" + string(_chapter_in_progress) + "章吗？";
    
    if (global.lang == "ja")
        continue_text = "Chapter " + string(_chapter_in_progress) + "から続けますか？";
    
    var yes_text = (global.lang == "en") ? "是" : "はい";
    var no_text = (global.lang == "en") ? "否" : "いいえ";
    var choices = [new create_choice(yes_text, UnknownEnum.Value_0), new create_choice(no_text, UnknownEnum.Value_1)];
    var choice_offset = (global.lang == "ja") ? -20 : 0;
    var start_screen = instance_create(0, 0, obj_screen_start);
    start_screen.init(id, continue_text, choices, choice_offset);
    start_screen.fade_in();
};

create_start_next_screen = function()
{
    var continue_text = "已通关第" + string(_chapter_completed) + "章。";
    
    if (global.lang == "ja")
        continue_text = "Chapter " + string(_chapter_completed) + "はクリア済みです。";
    
    var play_next_text = "继续玩第" + string(_chapter_completed + 1) + "章";
    
    if (global.lang == "ja")
        play_next_text = "Chapter " + string(_chapter_completed + 1) + "をプレイ";
    
    var chapter_select_text = (global.lang == "en") ? "选择章节" : "チャプター選択";
    var choices = [new create_choice(play_next_text, UnknownEnum.Value_0), new create_choice(chapter_select_text, UnknownEnum.Value_1)];
    var start_screen = instance_create(0, 0, obj_screen_start);
    var choice_offset = (global.lang == "en") ? -70 : -100;
    start_screen.init(id, continue_text, choices, choice_offset);
    start_screen.fade_in();
};

create_select_screen = function()
{
    var select_screen = instance_create(0, 0, obj_screen_select);
    select_screen.init(id);
    select_screen.fade_in();
};

create_load_prompt_screen = function(arg0)
{
    var load_text = scr_get_app_title(arg0) + "已发现存档文件，是否导入游戏？\n（之后将不再询问）";
    
    if (global.lang == "ja")
        load_text = scr_get_app_title(arg0) + "セーブデータを検出しました。\nこのセーブデータを取り込みますか？\n（この確認は一度しか行いません）";
    
    var yes_text = (global.lang == "en") ? "是" : "はい";
    var no_text = (global.lang == "en") ? "否" : "いいえ";
    var choices = [new create_choice(yes_text, UnknownEnum.Value_0), new create_choice(no_text, UnknownEnum.Value_1)];
    var choice_offset = (global.lang == "ja") ? -20 : 0;
    var start_screen = instance_create(0, 0, obj_screen_start);
    start_screen.init(id, load_text, choices, choice_offset);
    start_screen.fade_in();
};

create_load_prompt_multiple_screen = function(arg0)
{
    var load_text = "发现多个DELTARUNE存档文件。\n你想选一个存档导入游戏吗？\n（以后不再询问）\n \n ";
    
    if (global.lang == "ja")
        load_text = "複数の『DELTARUNE』セーブデータが存在します。\nどれか1つを取り込みますか？\n（この確認は一度しか行いません）\n \n ";
    
    var choices = [];
    
    for (var i = 0; i < array_length(arg0); i++)
    {
        var prev_title = arg0[i];
        var title_choice = scr_get_app_title_choice_text(prev_title.title);
        var new_choice = new create_choice(title_choice, prev_title);
        choices[array_length(choices)] = new_choice;
    }
    
    var do_not_text = (global.lang == "en") ? "不导入" : "取り込まない";
    choices[array_length(choices)] = new create_choice(do_not_text, UnknownEnum.Value_1);
    var start_screen = instance_create(0, 0, obj_screen_start);
    start_screen.init(id, load_text, choices, 0, -32);
    start_screen.fade_in();
};

create_load_deny_confirm_screen = function()
{
    var deny_text = (global.lang == "en") ? "确定不导入存档，直接游玩吗？" : "取り込まずに進めますか？";
    var yes_text = (global.lang == "en") ? "不导入" : "はい";
    var no_text = (global.lang == "en") ? "导入" : "いいえ";
    var choices = [new create_choice(yes_text, UnknownEnum.Value_0), new create_choice(no_text, UnknownEnum.Value_1)];
    var choice_offset = (global.lang == "ja") ? -20 : 0;
    var start_screen = instance_create(0, 0, obj_screen_start);
    start_screen.init(id, deny_text, choices, choice_offset);
    start_screen.fade_in();
};

trigger_event = function(arg0, arg1)
{
    var event_name = arg0;
    var event_value = arg1;
    
    switch (_current_state)
    {
        case UnknownEnum.Value_0:
            if (arg0 == "init_complete")
                init();
            else if (arg0 == "load_prompt")
                change_state(UnknownEnum.Value_5, arg1);
            
            break;
        
        case UnknownEnum.Value_5:
            if (event_value == UnknownEnum.Value_0)
            {
                global.savedata = _pending_title.save_data;
                _restart_room = true;
                change_state(UnknownEnum.Value_0);
                
                with (obj_init_console)
                    convert_loaded_file();
            }
            else if (event_value == UnknownEnum.Value_1)
            {
                if (_load_type == UnknownEnum.Value_0)
                {
                    if (array_length(_pending_titles) > 0)
                    {
                        change_state(UnknownEnum.Value_0);
                        trigger_event("load_prompt", _pending_titles);
                    }
                    else
                    {
                        change_state(UnknownEnum.Value_6);
                    }
                }
                else
                {
                    change_state(UnknownEnum.Value_6);
                }
            }
            else
            {
                _pending_title = event_value;
                global.savedata = _pending_title.save_data;
                _restart_room = true;
                change_state(UnknownEnum.Value_0);
                
                with (obj_init_console)
                    convert_loaded_file();
            }
            
            break;
        
        case UnknownEnum.Value_6:
            if (event_value == UnknownEnum.Value_0)
            {
                _restart_room = true;
                change_state(UnknownEnum.Value_0);
                
                with (obj_init_console)
                    create_new_save_file();
            }
            else
            {
                room_restart();
            }
            
            break;
        
        case UnknownEnum.Value_1:
            if (event_value == UnknownEnum.Value_0)
            {
                _target_chapter = UnknownEnum.Value_1;
                show_transition();
            }
            else
            {
                change_state(UnknownEnum.Value_4);
            }
            
            break;
        
        case UnknownEnum.Value_2:
            if (event_value == UnknownEnum.Value_0)
            {
                _target_chapter = _chapter_in_progress;
                show_transition();
            }
            else
            {
                change_state(UnknownEnum.Value_4);
            }
            
            break;
        
        case UnknownEnum.Value_3:
            if (event_value == UnknownEnum.Value_0)
            {
                _target_chapter = _chapter_completed + 1;
                show_transition();
            }
            else
            {
                change_state(UnknownEnum.Value_4);
            }
            
            break;
        
        case UnknownEnum.Value_4:
            if (event_name == "launch_game")
            {
                _target_chapter = event_value;
                show_transition();
            }
            else if (event_value == UnknownEnum.Value_4)
            {
                quit();
            }
            else if (event_value == UnknownEnum.Value_5)
            {
                toggle_language();
            }
            
            break;
    }
};

show_transition = function()
{
    if (instance_exists(obj_screen_transition))
        exit;
    
    if (global.bgm != -4)
        audio_sound_gain(global.bgm, 0, 500);
    
    var sound_file = get_chapter_confirm_sound(_target_chapter);
    var volume = 1;
    
    if (_target_chapter == 3)
        volume = 0.7;
    
    audio_play_sound(sound_file, 50, 0, volume);
    var delay = round(audio_sound_length(sound_file) * room_speed);
    var transition = instance_create(0, 0, obj_screen_transition);
    transition.init(id, _target_chapter, delay);
    transition.start(launch_game);
};

launch_game = function(arg0)
{
    audio_stop_all();
    var chapstring = string(_target_chapter);
    var parameters = get_chapter_switch_parameters();
    
    if (scr_is_switch_os())
    {
        game_change("rom:/chapter" + chapstring + "_switch/", parameters);
    }
    else
    {
        switch (os_type)
        {
            case os_windows:
                game_change("/chapter" + chapstring + "_windows", "-game data.win" + parameters);
                break;
            
            case os_ps4:
                game_change("", "-game /app0/games/chapter" + chapstring + "_ps4/game.win" + parameters);
                break;
            
            case os_ps5:
                game_change("", "-game /app0/games/chapter" + chapstring + "_ps5/game.win" + parameters);
                break;
            
            case os_macosx:
                game_change("chapter" + chapstring + "_mac", parameters);
                break;
        }
    }
};

quit = function()
{
    game_end();
};

toggle_language = function()
{
    if (_restart_room)
        exit;
    
    _restart_room = true;
    var target_lang = (global.lang == "en") ? "ja" : "en";
    global.lang = target_lang;
    ossafe_ini_open("true_config.ini");
    ini_write_string("LANG", "LANG", global.lang);
    ossafe_ini_close();
    ossafe_savedata_save();
    
    if (!global.is_console)
        room_restart();
};

start_bgm = function()
{
    if (global.bgm == -4 || !audio_is_playing(global.bgm))
        global.bgm = audio_play_sound(AUDIO_DRONE, 15, 1);
};

stop_bgm = function()
{
    if (global.bgm != -4)
    {
        audio_stop_sound(global.bgm);
        global.bgm = -4;
    }
};

if (global.is_console)
{
    var console_init = instance_create(0, 0, obj_init_console);
    console_init.init(id, _launch_data);
}
else
{
    var pc_init = instance_create(0, 0, obj_init_pc);
    pc_init.init(id, _launch_data);
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7
}
