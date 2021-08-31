include("shared.lua")
local size = -950 / 2

function math.inrange(val, min, max)
    return val <= max and val >= min
end

local arrow_icon = Material("materials/shared/arrow.png")
local cglogo_icon = Material("materials/shared/cglogo.png")
local replogo_icon = Material("materials/shared/replogo.png")

surface.CreateFont("FORMATION:Main", {
    font = "Roboto",
    size = 50
})

surface.CreateFont("FORMATION:Title", {
    font = "Roboto",
    size = 80
})

function ENT:Initialize()
    self.x = 0
    self.lx = 0
    self.t = 0
    self.min = 0
    self.max = 0
    self.tpage = self:GetPage()
    self:Work()
end

function ENT:Work()
    self.t = not self.t

    if self.t then
        self.x = self.min
    else
        self.x = self.max
    end

    timer.Simple(1, function()
        if not IsValid(self) then return end
        self:Work()
    end)
end

function ENT:OnPage()
    if self.tpage == 4 then
        self.x = -25
        self.lx = -25

        return
    end

    self.x = 0
    self.lx = 0
end

function ENT:Think()
    if self:GetPage() ~= self.tpage then
        self.tpage = self:GetPage()
        self:OnPage()
    end
end

function ENT:Page(number)
    if number == 1 then
        draw.SimpleText("Colossal Gaming", "FORMATION:Title", 0, size + 50, self.htextcolor, 1, 1)
        draw.SimpleText("CG Sub Factions", "FORMATION:Heading", -0, -325, self.textcolor, 1, 1)
        draw.SimpleText("There are 4 sub factions in total, each", "FORMATION:Main", -0, -250, self.textcolor, 1, 1)
        draw.SimpleText("having 2 regiments in each.", "FORMATION:Main", 0, -200, self.textcolor, 1, 1)
        draw.SimpleText("2 classes in each", "FORMATION:Main", -35, -150, self.textcolor, 1, 1)
        draw.SimpleText("Infantry & Medic", "FORMATION:Main", 0, -100, self.textcolor, 1, 1)
        draw.SimpleText("Classes come with different equipment", "FORMATION:Main", 0, -50, self.textcolor, 1, 1)
        draw.SimpleText("that can be used in everyday roleplay.", "FORMATION:Main", 0, -0, self.textcolor, 1, 1)
        draw.SimpleText("Press E [USE] On Arrows to change page", "FORMATION:Main", 0, 350, self.hinttext, 1, 1)
    end

    if number == 2 then
        draw.SimpleText("Colossal Gaming", "FORMATION:Title", 0, size + 50, self.htextcolor, 1, 1)
        draw.SimpleText("People's Liberation Army", "FORMATION:Heading", 0, -335, self.placolor, 1, 1)
        draw.SimpleText("Emperors", "FORMATION:Main", 0, -275, self.textcolor, 1, 1)
        draw.SimpleText("Ground Force", "FORMATION:Main", 0, -225, self.textcolor, 1, 1)
        draw.SimpleText("Beijing SF", "FORMATION:Main", 0, -175, self.textcolor, 1, 1)
        draw.SimpleText("Equipment", "FORMATION:Heading", 0, -85, self.placolor, 1, 1)
        draw.SimpleText("RPG", "FORMATION:Main", 0, -25, self.textcolor, 1, 1)
        draw.SimpleText("Artillery Strike", "FORMATION:Main", 0, 25, self.textcolor, 1, 1)
        draw.SimpleText("MP970", "FORMATION:Main", 0, 75, self.textcolor, 1, 1)
        draw.SimpleText("Flash Grenade", "FORMATION:Main", 0, 125, self.textcolor, 1, 1)
        draw.SimpleText("QBS 09 Shotgun", "FORMATION:Main", 0, 175, self.textcolor, 1, 1)
        draw.SimpleText("MK48 Machine Gun", "FORMATION:Main", 0, 225, self.textcolor, 1, 1)
        draw.SimpleText("Chicom", "FORMATION:Main", 0, 275, self.textcolor, 1, 1)
        draw.SimpleText("", "FORMATION:Main", 0, 275, self.textcolor, 1, 1)
    end

    if number == 3 then
        draw.SimpleText("Colossal Gaming", "FORMATION:Title", 0, size + 50, self.htextcolor, 1, 1)
        draw.SimpleText("The Australian Army", "FORMATION:Heading", 0, -335, self.auscolor, 1, 1)
        draw.SimpleText("Chief Of Defence", "FORMATION:Main", 0, -275, self.textcolor, 1, 1)
        draw.SimpleText("AUS Defence Force", "FORMATION:Main", 0, -225, self.textcolor, 1, 1)
        draw.SimpleText("2nd Commandos", "FORMATION:Main", 0, -175, self.textcolor, 1, 1)
        draw.SimpleText("Equipment", "FORMATION:Heading", 0, -85, self.auscolor, 1, 1)
        draw.SimpleText("M60 Machine Gun", "FORMATION:Main", 0, -25, self.textcolor, 1, 1)
        draw.SimpleText("Sprint SWEP", "FORMATION:Main", 0, 25, self.textcolor, 1, 1)
        draw.SimpleText("Frag Grenade", "FORMATION:Main", 0, 75, self.textcolor, 1, 1)
        draw.SimpleText("AUG A3", "FORMATION:Main", 0, 125, self.textcolor, 1, 1)
        draw.SimpleText("MTAR", "FORMATION:Main", 0, 175, self.textcolor, 1, 1)
        draw.SimpleText("SMR", "FORMATION:Main", 0, 225, self.textcolor, 1, 1)
        draw.SimpleText("", "FORMATION:Main", 0, 275, self.textcolor, 1, 1)
    end
    if number == 4 then
        draw.SimpleText("Colossal Gaming", "FORMATION:Title", 0, size + 50, self.htextcolor, 1, 1)
        draw.SimpleText("Russian Army", "FORMATION:Heading", 0, -335, self.rucolor, 1, 1)
        draw.SimpleText("Minister Of Defence", "FORMATION:Main", 0, -275, self.textcolor, 1, 1)
        draw.SimpleText("45th Spetsnaz", "FORMATION:Main", 0, -225, self.textcolor, 1, 1)
        draw.SimpleText("VKS Airborne", "FORMATION:Main", 0, -175, self.textcolor, 1, 1)
        draw.SimpleText("Equipment", "FORMATION:Heading", 0, -85, self.rucolor, 1, 1)
        draw.SimpleText("AJM 9", "FORMATION:Main", 0, -25, self.textcolor, 1, 1)
        draw.SimpleText("SR 07", "FORMATION:Main", 0, 25, self.textcolor, 1, 1)
        draw.SimpleText("Smoke Grenade", "FORMATION:Main", 0, 75, self.textcolor, 1, 1)
        draw.SimpleText("QBB LSW", "FORMATION:Main", 0, 125, self.textcolor, 1, 1)
        draw.SimpleText("Parachute", "FORMATION:Main", 0, 175, self.textcolor, 1, 1)
        draw.SimpleText("Krokodil Attack Heli", "FORMATION:Main", 0, 225, self.textcolor, 1, 1)
        draw.SimpleText("Milhip Transport Heli", "FORMATION:Main", 0, 275, self.textcolor, 1, 1)
        draw.SimpleText("", "FORMATION:Main", 0, 275, self.textcolor, 1, 1)
    end
    if number == 5 then
        draw.SimpleText("Colossal Gaming", "FORMATION:Title", 0, size + 50, self.htextcolor, 1, 1)
        draw.SimpleText("United Nations", "FORMATION:Heading", 0, -335, self.uncolor, 1, 1)
        draw.SimpleText("Security Council", "FORMATION:Main", 0, -275, self.textcolor, 1, 1)
        draw.SimpleText("Peace Keepers", "FORMATION:Main", 0, -225, self.textcolor, 1, 1)
        draw.SimpleText("Security Force", "FORMATION:Main", 0, -175, self.textcolor, 1, 1)
        draw.SimpleText("Equipment", "FORMATION:Heading", 0, -85, self.uncolor, 1, 1)
        draw.SimpleText("Riot Shield", "FORMATION:Main", 0, -25, self.textcolor, 1, 1)
        draw.SimpleText("Armour Kit ", "FORMATION:Main", 0, 25, self.textcolor, 1, 1)
        draw.SimpleText("Frag Grenade", "FORMATION:Main", 0, 75, self.textcolor, 1, 1)
        draw.SimpleText("LSAT", "FORMATION:Main", 0, 125, self.textcolor, 1, 1)
        draw.SimpleText("Tec 9", "FORMATION:Main", 0, 175, self.textcolor, 1, 1)
        draw.SimpleText("MSBS", "FORMATION:Main", 0, 225, self.textcolor, 1, 1)
        draw.SimpleText("Stun Stick", "FORMATION:Main", 0, 275, self.textcolor, 1, 1)
        draw.SimpleText("", "FORMATION:Main", 0, 275, self.textcolor, 1, 1)
    end
end

function ENT:Draw()
    self:DrawModel()
    local trace = LocalPlayer():GetEyeTrace()
    if not trace.Entity == self then return end
    local cursor = self:WorldToLocal(trace.HitPos) * Vector(10, 10, 10)
    local pos = self:LocalToWorld(Vector(0, 0, 2.5))
    local ang = self:LocalToWorldAngles(Angle(0, 90, 0))
    --[[Change the distance at which clients will render the panel]]
    --
    if LocalPlayer():GetPos():Distance(self:GetPos()) >= 500 then return end
    cam.Start3D2D(pos, ang, 0.1)
    draw.RoundedBox(0, -950 / 2, -950 / 2, 950, 100, self.comcolor)
    draw.RoundedBox(0, -950 / 2, -770 / 2, 950, 860, self.bcolor)

    --[[---------------------------------------------------------
			Name: Arrows
		-----------------------------------------------------------]]
    if math.inrange(cursor.y, -size - 64 - 64, -size) and math.inrange(cursor.x, -size - 64 - 64, -size) then
        surface.SetDrawColor(self.pcolor)
    else
        surface.SetDrawColor(Color(255, 255, 255))
    end

    surface.SetMaterial(arrow_icon)
    surface.DrawTexturedRectRotated(-size - 64, -size - 64, 64, 64, 180)

    if math.inrange(cursor.y, size, size + 64 + 64) and math.inrange(cursor.x, -size - 64 - 64, -size) then
        surface.SetDrawColor(self.pcolor)
    else
        surface.SetDrawColor(Color(255, 255, 255))
    end

    surface.SetMaterial(arrow_icon)
    surface.DrawTexturedRectRotated(size + 64, -size - 64, 64, 64, 0)
    draw.SimpleText("Page " .. self:GetPage() .. " of " .. self:GetMax(), "FORMATION:Main", 0, -size - 64, self.pagenum, 1, 1)
    self:Page(self:GetPage())
    cam.End3D2D()
    cam.Start3D2D(pos, ang, 0.1)

    if self.era == true then
        surface.SetDrawColor(Color(255, 255, 255))
        surface.SetMaterial(cglogo_icon)
        surface.DrawTexturedRectRotated(size + 60, -size - 905, 85, 85, 0)
    elseif self.era == false then
        surface.SetDrawColor(Color(255, 255, 255))
        surface.SetMaterial(implogo_icon)
        surface.DrawTexturedRectRotated(size + 60, -size - 905, 85, 85, 0)
    end

    cam.End3D2D()
end