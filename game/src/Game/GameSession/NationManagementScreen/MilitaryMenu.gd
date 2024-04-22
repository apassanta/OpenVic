extends GUINode

var _active : bool = false

const _screen : NationManagement.Screen = NationManagement.Screen.MILITARY

var _military_screen_panel : Panel

#MAIN
var _mobilize_button : Button
var _mobilize_progress : GFXSpriteTexture
var _mobilize_percentage : Label
var _mobilize_number : Label
var _mobilize_production_impact : Label

#LEADERS WINDOW
var _leaders_generals_number : Label
var _leaders_admirals_number : Label
var _leaders_sort_prestige_button : Button
var _leaders_sort_prestige_gfx : GFXSpriteTexture
var _leaders_sort_type : Button
var _leaders_sort_name : Button
var _leaders_sort_army : Button
var _leaders_new_general : Button
var _leaders_new_admiral : Button
var _leaders_auto_create : CheckBox
var _leaders_auto_assign : CheckBox
var _leaders_list : ListBox

var _stats_war_exhaustion : Label
var _stats_supply_consumption : Label
var _stats_org_regain : Label
var _stats_army_org : Label
var _stats_navy_org : Label
var _stats_unit_experience : Label
var _stats_recruit_time : Label
var _stats_combat_width : Label
var _stats_digin_cap : Label
var _stats_tactics_level : Label

#ARMY/NAVY
var _army_current_count : Label
var _army_under_construction : Label
var _army_cut_down_to_size : GFXSpriteTexture
var _army_sort_name : Button
var _army_sort_strength : Button
var _army_build_new : Button
var _army_listbox : ListBox

var _navy_current_count : Label
var _navy_under_construction : Label
var _navy_cut_down_to_size : GFXSpriteTexture
var _navy_sort_name : Button
var _navy_sort_strength : Button
var _navy_build_new : Button
var _navy_listbox : ListBox

class ListBoxItem:


class Unit extends ListBoxItem: 
	var button : Button
	var progress : GFXSpriteTexture
	var leader : GFXSpriteTexture
	var strip : GFXSpriteTexture
	var name : Label
	var location : Label
	var eta : Label
	var cancel : Button
	var regiments : Label
	var men : Label
	var organization : GFXSpriteTexture
	var strength : GFXSpriteTexture
	var moving : GFXSpriteTexture
	var digin : GFXSpriteTexture
	var combat : GFXSpriteTexture

class Leader extends ListBoxItem: 
	var background : GFXSpriteTexture
	var prestige_bar : GFXSpriteTexture
	var portrait : GFXSpriteTexture
	var name : Label
	var background : Label
	var personality : Label
	var use_leader : CheckBox
	var unit : Label
	var location : Label

class ListBox:
	var list : Array[ListBoxItem]


func _ready() -> void:
	GameSingleton.gamestate_updated.connect(_update_info)
	MenuSingleton.military_menu_stats_updated.connect(_setup_main)
	MenuSingleton.military_menu_leaders_updated.connect(_setup_leaders)
	MenuSingleton.military_menu_army_updated.connect(_setup_army)
	MenuSingleton.military_menu_navy_updated.connect(_setup_navy)

	Events.NationManagementScreens.update_active_nation_management_screen.connect(_on_update_active_nation_management_screen)

	add_gui_element("country_military", "country_military")

	var close_button : Button = get_button_from_nodepath(^"./country_military/close_button")
	if close_button:
		close_button.pressed.connect(Events.NationManagementScreens.close_nation_management_screen.bind(_screen))

	_military_screen_panel = get_panel_from_nodepath(^"./country_military")

	setup_main()
	setup_leaders()
	setup_army()
	setup_navy()

	_update_info()

func _notification(what : int) -> void:
	match what:
		NOTIFICATION_TRANSLATION_CHANGED:
			_update_info()

func _on_update_active_nation_management_screen(active_screen : NationManagement.Screen) -> void:
	_active = active_screen == _screen
	_update_info()

func _update_info() -> void:
	if _active:
		# TODO - update UI state
		show()
	else:
		hide()

func _setup_main() -> void:

func _setup_leaders() -> void:

func _setup_army() -> void:

func _setup_navy() -> void:
