$folders = @(
"lib/app/routes",
"lib/app/theme",
"lib/app/widgets",

"lib/modules/home/bindings",
"lib/modules/home/controllers",
"lib/modules/home/views",

"lib/modules/pest_detection/bindings",
"lib/modules/pest_detection/controllers",
"lib/modules/pest_detection/views",

"lib/modules/ai_chat/bindings",
"lib/modules/ai_chat/controllers",
"lib/modules/ai_chat/views",

"lib/modules/alerts/bindings",
"lib/modules/alerts/controllers",
"lib/modules/alerts/views",

"lib/modules/plants/bindings",
"lib/modules/plants/controllers",
"lib/modules/plants/views",

"lib/modules/settings/bindings",
"lib/modules/settings/controllers",
"lib/modules/settings/views",

"lib/widgets",

"assets/images"
)

$files = @(

# MAIN
"lib/main.dart",

# ROUTES
"lib/app/routes/app_pages.dart",
"lib/app/routes/app_routes.dart",

# THEME
"lib/app/theme/app_colors.dart",

# APP WIDGETS
"lib/app/widgets/custom_app_bar.dart",

# HOME
"lib/modules/home/bindings/home_binding.dart",
"lib/modules/home/controllers/home_controller.dart",
"lib/modules/home/views/home_view.dart",

# PEST DETECTION
"lib/modules/pest_detection/bindings/pest_detection_binding.dart",
"lib/modules/pest_detection/controllers/pest_detection_controller.dart",
"lib/modules/pest_detection/views/pest_detection_view.dart",

# AI CHAT
"lib/modules/ai_chat/bindings/ai_chat_binding.dart",
"lib/modules/ai_chat/controllers/ai_chat_controller.dart",
"lib/modules/ai_chat/views/ai_chat_view.dart",

# ALERTS
"lib/modules/alerts/bindings/alerts_binding.dart",
"lib/modules/alerts/controllers/alerts_controller.dart",
"lib/modules/alerts/views/alerts_view.dart",

# PLANTS
"lib/modules/plants/bindings/plants_binding.dart",
"lib/modules/plants/controllers/plants_controller.dart",
"lib/modules/plants/views/plants_view.dart",

# SETTINGS
"lib/modules/settings/bindings/settings_binding.dart",
"lib/modules/settings/controllers/settings_controller.dart",
"lib/modules/settings/views/settings_view.dart",

# GLOBAL WIDGETS
"lib/widgets/bottom_nav.dart",
"lib/widgets/plant_card.dart",
"lib/widgets/market_price_item.dart",
"lib/widgets/ai_recommendation_card.dart"
)

foreach ($folder in $folders) {
    New-Item -ItemType Directory -Force -Path $folder
}

foreach ($file in $files) {
    New-Item -ItemType File -Force -Path $file
}

Write-Host "✅ Struktur Flutter GetX berhasil dibuat!"