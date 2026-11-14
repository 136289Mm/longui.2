local P,R,U,T,CG = game:GetService("Players"),game:GetService("RunService"),game:GetService("UserInputService"),game:GetService("TweenService"),game:GetService("CoreGui")
local LP, Cam = P.LocalPlayer, workspace.CurrentCamera

if getgenv().KillESP then pcall(getgenv().KillESP) end
if CG:FindFirstChild("SonicESP") then CG.SonicESP:Destroy() end

local Gui = Instance.new("ScreenGui", CG)
Gui.Name = "SonicESP"; Gui.ResetOnSpawn = false; Gui.IgnoreGuiInset = true; Gui.DisplayOrder = 999999

local MB, MM = "", ""
pcall(function() 
    if not isfile("b.png") then writefile("b.png", game:HttpGet("https://i.ibb.co/78h6vQZ/Image-1794661424267-411.png")) end
    MB = getcustomasset("b.png")
    if not isfile("m.jpg") then writefile("m.jpg", game:HttpGet("https://i.ibb.co/v66wjmJ5/Image-1794149551205-70.jpg")) end
    MM = getcustomasset("m.jpg") 
end)

local Cfg = {B=true, H=true, T=true, C=true, M=true, Rad=true, TC=true, Color=Color3.fromRGB(0,122,255), Chams=Color3.fromRGB(255,69,58)}
local Cache = {P={}, D={}}

-- 主框架
local M = Instance.new("Frame", Gui)
M.Size = UDim2.new(0,400,0,300); M.Position = UDim2.new(0.5,-200,0.1,0)
M.BackgroundColor3 = Color3.fromRGB(25,25,30); M.BackgroundTransparency = 0.1; M.ClipsDescendants = true
Instance.new("UICorner", M).CornerRadius = UDim.new(0,12)

local Top = Instance.new("Frame", M)
Top.Size = UDim2.new(1,0,0,40); Top.BackgroundColor3 = Color3.fromRGB(30,30,35)
Instance.new("UICorner", Top).CornerRadius = UDim.new(0,12)

local Ti = Instance.new("TextLabel", Top)
Ti.Size = UDim2.new(1,-80,1,0); Ti.Position = UDim2.new(0,15,0,0); Ti.BackgroundTransparency = 1
Ti.Text = "索尼克透视"; Ti.Font = Enum.Font.GothamBold; Ti.TextSize = 16; Ti.TextColor3 = Color3.new(1,1,1); Ti.TextXAlignment = Enum.TextXAlignment.Left

local Cb = Instance.new("TextButton", Top)
Cb.Size = UDim2.new(0,20,0,20); Cb.Position = UDim2.new(1,-30,0.5,-10)
Cb.BackgroundColor3 = Color3.fromRGB(255,60,60); Cb.Text = "X"; Cb.Font = Enum.Font.GothamBold
Instance.new("UICorner", Cb).CornerRadius = UDim.new(1,0)

-- 左侧导航
local Nav = Instance.new("Frame", M)
Nav.Size = UDim2.new(0,80,1,-40); Nav.Position = UDim2.new(0,0,0,40); Nav.BackgroundTransparency = 1
local NL = Instance.new("UIListLayout", Nav)
NL.Padding = UDim.new(0,6); NL.HorizontalAlignment = Enum.HorizontalAlignment.Center

local Pages = {}
local function Sw(n,b) 
    for _,v in pairs(Pages) do v.Visible = false end
    Pages[n].Visible = true
    for _,c in pairs(Nav:GetChildren()) do if c:IsA("TextButton") then c.BackgroundColor3 = Color3.fromRGB(40,40,45) end end
    b.BackgroundColor3 = Color3.fromRGB(60,60,70) 
end
local function CT(n,o) 
    local b = Instance.new("TextButton", Nav)
    b.Size = UDim2.new(0,70,0,30); b.BackgroundColor3 = Color3.fromRGB(40,40,45); b.Text = n
    b.Font = Enum.Font.GothamMedium; b.TextSize = 12; b.TextColor3 = Color3.new(1,1,1); b.LayoutOrder = o
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,6)
    b.MouseButton1Click:Connect(function() Sw(n,b) end)
    return b 
end
local TN = CT("公告",1); local TP = CT("功能",2)
local Ct = Instance.new("Frame", M)
Ct.Size = UDim2.new(1,-90,1,-50); Ct.Position = UDim2.new(0,85,0,45); Ct.BackgroundTransparency = 1

-- 公告页
local PN = Instance.new("Frame", Ct)
PN.Size = UDim2.new(1,0,1,0); PN.BackgroundTransparency = 1; PN.Visible = false; Pages["公告"] = PN
local Av = Instance.new("ImageLabel", PN)
Av.Size = UDim2.new(0,50,0,50); Av.BackgroundColor3 = Color3.fromRGB(40,40,45); Av.Image = MM; Av.ScaleType = Enum.ScaleType.Crop
Instance.new("UICorner", Av).CornerRadius = UDim.new(1,0)
local Nm = Instance.new("TextLabel", PN)
Nm.Size = UDim2.new(1,-60,0,20); Nm.Position = UDim2.new(0,60,0,5); Nm.BackgroundTransparency = 1
Nm.Text = "墨墨"; Nm.Font = Enum.Font.GothamBold; Nm.TextSize = 15; Nm.TextColor3 = Color3.new(1,1,1); Nm.TextXAlignment = Enum.TextXAlignment.Left
local Tg = Instance.new("TextLabel", PN)
Tg.Size = UDim2.new(1,-60,0,15); Tg.Position = UDim2.new(0,60,0,28); Tg.BackgroundTransparency = 1
Tg.Text = "万古独尊 · 绝代无双"; Tg.Font = Enum.Font.GothamMedium; Tg.TextSize = 11; Tg.TextColor3 = Cfg.Color; Tg.TextXAlignment = Enum.TextXAlignment.Left
local Nt = Instance.new("TextLabel", PN)
Nt.Size = UDim2.new(1,0,0,150); Nt.Position = UDim2.new(0,0,0,70); Nt.BackgroundTransparency = 1
Nt.Text = "「这天地间的规矩，若是不公，踏碎便是。」\n\n管你什么上界天骄，什么圣地神子。\n收起多余的仁慈，看清这世间的虚妄。\n杀伐果断，方能证道！\n\n—— 墨墨"
Nt.Font = Enum.Font.GothamMedium; Nt.TextSize = 12; Nt.TextWrapped = true; Nt.TextXAlignment = Enum.TextXAlignment.Left; Nt.TextYAlignment = Enum.TextYAlignment.Top; Nt.TextColor3 = Color3.fromRGB(200,200,210)

-- 功能页框架
local PP = Instance.new("ScrollingFrame", Ct)
PP.Size = UDim2.new(1,0,1,0); PP.BackgroundTransparency = 1; PP.BorderSizePixel = 0; PP.CanvasSize = UDim2.new(0,0,0,0); PP.ScrollBarThickness = 0
local PL = Instance.new("UIListLayout", PP)
PL.Padding = UDim.new(0,6); PL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() PP.CanvasSize = UDim2.new(0,0,0,PL.AbsoluteContentSize.Y+5) end)
Pages["功能"] = PP-- 生成功能开关
local function Mk(N,K,D) 
    local R = Instance.new("Frame", PP)
    R.Size = UDim2.new(1,-5,0,36); R.BackgroundColor3 = Color3.fromRGB(40,40,45)
    Instance.new("UICorner", R).CornerRadius = UDim.new(0,8)
    local L = Instance.new("TextLabel", R)
    L.Size = UDim2.new(0.7,0,1,0); L.Position = UDim2.new(0,10,0,0); L.BackgroundTransparency = 1
    L.Text = N; L.Font = Enum.Font.GothamMedium; L.TextSize = 13; L.TextColor3 = Color3.new(1,1,1); L.TextXAlignment = Enum.TextXAlignment.Left
    
    local B = Instance.new("Frame", R)
    B.Size = UDim2.new(0,36,0,20); B.Position = UDim2.new(1,-45,0.5,-10)
    B.BackgroundColor3 = D and Cfg.Color or Color3.fromRGB(80,80,85)
    Instance.new("UICorner", B).CornerRadius = UDim.new(1,0)
    
    local Dt = Instance.new("Frame", B)
    Dt.Size = UDim2.new(0,16,0,16); Dt.Position = D and UDim2.new(1,-18,0.5,-8) or UDim2.new(0,2,0.5,-8)
    Dt.BackgroundColor3 = Color3.new(1,1,1); Instance.new("UICorner", Dt).CornerRadius = UDim.new(1,0)
    
    local St = D
    local C = Instance.new("TextButton", R)
    C.Size = UDim2.new(1,0,1,0); C.BackgroundTransparency = 1; C.Text = ""
    C.MouseButton1Click:Connect(function() 
        St = not St; Cfg[K] = St
        B.BackgroundColor3 = St and Cfg.Color or Color3.fromRGB(80,80,85)
        Dt.Position = St and UDim2.new(1,-18,0.5,-8) or UDim2.new(0,2,0.5,-8) 
    end) 
end

Mk("玩家方框","B",true); Mk("动态血条","H",true); Mk("高亮透视","C",true)
Mk("左侧镜像骨骼","M",true); Mk("战术雷达","Rad",true); Mk("过滤队友","TC",true)
Sw("公告",TN)

-- 雷达 UI
local RUI = Instance.new("Frame", Gui)
RUI.Size = UDim2.new(0,140,0,140); RUI.Position = UDim2.new(0,15,1,-160)
RUI.BackgroundColor3 = Color3.fromRGB(20,20,25); RUI.BackgroundTransparency = 0.2
Instance.new("UICorner", RUI).CornerRadius = UDim.new(1,0)
Instance.new("UIStroke", RUI).Color = Color3.new(1,1,1)

local CX = Instance.new("Frame", RUI)
CX.Size = UDim2.new(1,0,0,1); CX.Position = UDim2.new(0,0,0.5,0); CX.BackgroundColor3 = Color3.fromRGB(100,100,110)
local CY = Instance.new("Frame", RUI)
CY.Size = UDim2.new(0,1,1,0); CY.Position = UDim2.new(0.5,0,0,0); CY.BackgroundColor3 = Color3.fromRGB(100,100,110)
local PA = Instance.new("Frame", RUI)
PA.Size = UDim2.new(0,6,0,6); PA.Position = UDim2.new(0.5,-3,0.5,-3)
PA.BackgroundColor3 = Color3.fromRGB(50,255,100); Instance.new("UICorner", PA).CornerRadius = UDim.new(1,0)

-- 核心清理函数（彻底删除线条与高亮）
getgenv().KillESP = function() 
    for P, Obj in pairs(Cache.P) do 
        for _,o in pairs(Obj) do 
            if typeof(o) == "Instance" then pcall(function() o:Destroy() end) 
            elseif type(o) == "table" then for _,l in pairs(o) do pcall(function() l:Remove() end) end 
            else pcall(function() o:Remove() end) end 
        end 
    end
    for _,d in pairs(Cache.D) do pcall(function() d:Remove() end) end
    if RUI then RUI:Destroy() end
    Gui:Destroy() 
end
Cb.MouseButton1Click:Connect(getgenv().KillESP)R.RenderStepped:Connect(function() 
    pcall(function() 
        local MyC = LP.Character
        local MyH = MyC and MyC:FindFirstChild("HumanoidRootPart")
        if not MyH then return end
        local cnt = 0
        
        for _, Pl in pairs(P:GetPlayers()) do 
            local isT = (Pl.Team and LP.Team and Pl.Team == LP.Team)
            if Pl ~= LP and not (Cfg.TC and isT) and Pl.Character then 
                local C = Pl.Character
                local H = C:FindFirstChild("HumanoidRootPart")
                local Hu = C:FindFirstChild("Humanoid")
                local Hd = C:FindFirstChild("Head")
                
                if H and Hu and Hu.Health > 0 and Hd then 
                    local hp, ho = Cam:WorldToViewportPoint(Hd.Position + Vector3.new(0,0.5,0))
                    local fp, fo = Cam:WorldToViewportPoint(H.Position - Vector3.new(0,2.8,0))
                    
                    if ho and fo and hp.Z > 0 then 
                        if not Cache.P[Pl] then 
                            Cache.P[Pl] = {Bx = Drawing.new("Square"), HB = Drawing.new("Line"), HF = Drawing.new("Line"), Tx = Drawing.new("Text"), Ml = {}}
                            for i = 1, 6 do Cache.P[Pl].Ml[i] = Drawing.new("Line") end 
                        end
                        
                        local o = Cache.P[Pl]
                        local Ht = math.abs(fp.Y - hp.Y)
                        local W = Ht * 0.55
                        if Ht < 25 then Ht = 25; W = 13.75 end
                        local X = hp.X - (W / 2)
                        local Y = hp.Y
                        
                        -- 方框
                        if Cfg.B then 
                            o.Bx.Size = Vector2.new(W, Ht); o.Bx.Position = Vector2.new(X, Y)
                            o.Bx.Color = Cfg.Color; o.Bx.Thickness = 1; o.Bx.Visible = true 
                        else o.Bx.Visible = false end
                        
                        -- 血条
                        if Cfg.H then 
                            local HR = math.clamp(Hu.Health / Hu.MaxHealth, 0, 1)
                            o.HB.From = Vector2.new(X - 4, Y); o.HB.To = Vector2.new(X - 4, Y + Ht)
                            o.HB.Color = Color3.fromRGB(50,50,50); o.HB.Thickness = 2; o.HB.Visible = true
                            o.HF.From = Vector2.new(X - 4, Y + Ht - (Ht * HR)); o.HF.To = Vector2.new(X - 4, Y + Ht)
                            o.HF.Color = Color3.fromRGB(50,255,100); o.HF.Thickness = 2; o.HF.Visible = true 
                        else o.HB.Visible = false; o.HF.Visible = false end
                        
                        -- 名字距离
                        if Cfg.T then 
                            o.Tx.Text = tostring(math.floor((MyH.Position - H.Position).Magnitude)) .. "m"
                            o.Tx.Position = Vector2.new(hp.X, Y - 18); o.Tx.Size = 12; o.Tx.Center = true; o.Tx.Outline = true
                            o.Tx.Color = Color3.new(1,1,1); o.Tx.Visible = true 
                        else o.Tx.Visible = false end
                        
                        -- 高亮
                        if Cfg.C then 
                            if not o.Ch or not o.Ch.Parent then 
                                o.Ch = Instance.new("Highlight", C)
                                o.Ch.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop 
                            end
                            o.Ch.FillColor = Cfg.Chams; o.Ch.OutlineColor = Color3.new(1,1,1); o.Ch.Enabled = true 
                        elseif o.Ch then o.Ch.Enabled = false end
                        
                        -- 左侧镜像骨骼
                        if Cfg.M then 
                            local lh = C:FindFirstChild("LeftHand") or C:FindFirstChild("Left Arm")
                            local rh = C:FindFirstChild("RightHand") or C:FindFirstChild("Right Arm")
                            local lf = C:FindFirstChild("LeftFoot") or C:FindFirstChild("Left Leg")
                            local rf = C:FindFirstChild("RightFoot") or C:FindFirstChild("Right Leg")
                            
                            if lh and rh and lf and rf then 
                                local hP = Cam:WorldToViewportPoint(Hd.Position)
                                local lhP = Cam:WorldToViewportPoint(lh.Position)
                                local rhP = Cam:WorldToViewportPoint(rh.Position)
                                local lfP = Cam:WorldToViewportPoint(lf.Position)
                                local rfP = Cam:WorldToViewportPoint(rf.Position)
                                
                                local mX = X - W - 12
                                local mY = Y
                                local sc = 0.7
                                
                                local function GM(p) return Vector2.new(mX + (p.X - hP.X) * sc, mY + (p.Y - hP.Y) * sc) end
                                
                                local mH = Vector2.new(mX, mY)
                                local mLH = GM(lhP); local mRH = GM(rhP)
                                local mLF = GM(lfP); local mRF = GM(rfP)
                                local mN = Vector2.new(mX, mY + Ht * 0.15 * sc)
                                local mP = Vector2.new(mX, mY + Ht * 0.55 * sc)
                                
                                o.Ml[1].From = mH; o.Ml[1].To = mN
                                o.Ml[2].From = mN; o.Ml[2].To = mP
                                o.Ml[3].From = mN; o.Ml[3].To = mLH
                                o.Ml[4].From = mN; o.Ml[4].To = mRH
                                o.Ml[5].From = mP; o.Ml[5].To = mLF
                                o.Ml[6].From = mP; o.Ml[6].To = mRF
                                
                                for i = 1, 6 do 
                                    o.Ml[i].Color = Cfg.Color; o.Ml[i].Thickness = 1; o.Ml[i].Visible = true 
                                end
                            end
                        else 
                            for i = 1, 6 do o.Ml[i].Visible = false end 
                        end
                    else 
                        for _, ob in pairs(Cache.P[Pl]) do 
                            if typeof(ob) == "Instance" then ob.Enabled = false 
                            elseif type(ob) == "table" then for _, l in pairs(ob) do l.Visible = false end 
                            else ob.Visible = false end 
                        end 
                    end
                    
                    -- 雷达红点
                    if Cfg.Rad then 
                        local RX = H.Position.X - MyH.Position.X
                        local RZ = H.Position.Z - MyH.Position.Z
                        local rD = math.sqrt(RX^2 + RZ^2)
                        if rD <= 250 then 
                            cnt = cnt + 1
                            if not Cache.D[cnt] then 
                                Cache.D[cnt] = Drawing.new("Circle")
                                Cache.D[cnt].Radius = 3; Cache.D[cnt].Filled = true; Cache.D[cnt].Color = Color3.fromRGB(255,69,58) 
                            end
                            local MS = 70 / 250
                            Cache.D[cnt].Position = Vector2.new(RUI.AbsolutePosition.X + 70 + (RX * MS), RUI.AbsolutePosition.Y + 70 + (RZ * MS))
                            Cache.D[cnt].Visible = true 
                        end 
                    end
                end 
            end 
        end
        
        if Cfg.Rad then 
            RUI.Visible = true
            if Cache.D then for i = cnt + 1, #Cache.D do Cache.D[i].Visible = false end end 
        else RUI.Visible = false end
    end) 
end)
