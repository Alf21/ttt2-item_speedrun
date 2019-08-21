if SERVER then
	AddCSLuaFile()

	resource.AddFile("materials/vgui/ttt/icon_speedrun.vmt")
	resource.AddFile("materials/vgui/ttt/perks/hud_speedrun.png")
end

ITEM.hud = Material("vgui/ttt/perks/hud_speedrun.png")
ITEM.EquipMenuData = {
	type = "item_passive",
	name = "Speedrun",
	desc = "You are 50% faster!"
}
ITEM.material = "vgui/ttt/icon_speedrun"
ITEM.CanBuy = {ROLE_TRAITOR, ROLE_DETECTIVE}

if SERVER then
	hook.Add("TTTPlayerSpeedModifier", "SpeedrunModifySpeed", function(ply, _, _, noLag)
		if IsValid(ply) and ply:HasEquipmentItem("item_ttt_speedrun") then
			noLag[1] = noLag[1] * 1.5 * (ply.speedrun_mul or 1)
		end
	end)
end
