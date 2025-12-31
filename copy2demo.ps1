$DemoPath = "$HOME\Desktop\patch\content"
$SourceText = "workspace\result"
Copy-Item -Force $SourceText\ch1\lang_en.json $DemoPath\en_name\lang_en_ch1.json
Copy-Item -Force $SourceText\ch1\lang_en_names.json $DemoPath\cn_name\lang_en_ch1.json
Copy-Item -Force $SourceText\ch1\lang_en_names_recruitable.json $DemoPath\cn_name_only_recruitable\lang_en_ch1.json
Copy-Item -Force $SourceText\ch2\lang_en.json $DemoPath\en_name\lang_en.json
Copy-Item -Force $SourceText\ch2\lang_en_names.json $DemoPath\cn_name\lang_en.json
Copy-Item -Force $SourceText\ch2\lang_en_names_recruitable.json $DemoPath\cn_name_only_recruitable\lang_en.json