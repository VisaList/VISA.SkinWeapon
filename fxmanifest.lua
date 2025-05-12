fx_version("cerulean")

games({ "gta5" })

author("SSS");

version("1.0");

description("SSS");


shared_script({
    "shared/config.general.lua",
})

server_scripts({
    "@oxmysql/lib/MySQL.lua",
})

client_scripts({
    "client/*.lua"
})

ui_page("html/html.html")
files({
    "html/*",
    "html/**/*"
})
