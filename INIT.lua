-- Компоненты кастомизации
local CastomisationFolder = game:GetService("Workspace")["Кастомизация"]
-- Загрузка компонентов первой нации
local Nation1Folder = CastomisationFolder["Первая нация"]
local Nation1Name = Nation1Folder["Имя нации"]
local Nation1Texture = Nation1Folder["Текстура флага"] --Текстура флага, которая используется когда пункт захвачен.
local Nation1Color = Nation1Folder["Цвет нации"]
local Nat1Color3 = Nation1Folder["ИнтерфейсЦвет"]
-- Загрузка компонентов второй нации
local Nation2Folder = CastomisationFolder["Вторая нация"]
local Nation2Name = Nation2Folder["Имя нации"]
local Nation2Texture = Nation2Folder["Текстура флага"] --Текстура флага, которая используется когда пункт захвачен.
local Nation2Color = Nation2Folder["Цвет нации"]
local Nat2Color3 = Nation2Folder["ИнтерфейсЦвет"]
-- Компоненты самого флага
local team = script.Parent 
local flag = script.Parent.Parent.Flag
local pole = script.Parent.Parent.Pole
local texta = script.Parent.Parent.Title.BillboardGui.TextLabel
local handle = script.Parent.Parent.Pole.Handles
local space = ""
-- Интерфейс компоненты (НЕ РЕКОМЕНДУЮ ИЗМЕНЯТЬ ОБЕ ФУНКЦИИ)
local haventcapturedearly = true
local v = game.ReplicatedStorage.Capturemsg:Clone()
local players = game.Players
function transpar()
	for i = 1, 25 do
		v.TextTransparency -= 0.05
		wait(0.01)
	end
end
function untrapsar()
	for i = 1, 25 do
		v.TextTransparency += 0.05
		wait(0.01)
	end
end

function onTouch(hit) 
	local user = game.Players:GetPlayerFromCharacter(hit.Parent)
	if user ~= nil then 

-- Изменение флага при его захвате первой нацией.

		if user.TeamColor == Nation1Color.Value and user.TeamColor ~= script.Parent.Parent.Captured.Value and haventcapturedearly == true then

			haventcapturedearly = false -- Не удалять, иначе вторая нация сможет захватывать сразу-же после захвата.

			game.Workspace.Bum:Play() -- Производит звук оповещения когда флаг захвачен, можно удалить, но круче будет с ним.

			script.Parent.Parent.Title2.BillboardGui.TextLabel.Visible = true
			flag.Decal.Texture = Nation1Texture.Texture
			texta.TextColor3 = Nat1Color3.Value
			script.Parent.Parent.Captured.Value = user.TeamColor
			game.ReplicatedStorage.Points.NAT1.Value += 1  --Добавляет количество очков захвата для нации в секунду.
			game.ReplicatedStorage.Points.NAT2.Value -= 1  --Уберает количество очков захвата для нации в секунду. 
			handle.Color3 = Nat1Color3.Value

			v.Text = "Госсударство " .. Nation1Name.Value .." Захватило точку " .. texta.Text

			for index, player in pairs(players:GetChildren()) do -- Интерфейс оповещения.
				v.TextColor3 = Nat1Color3.Value
				v.Parent = player.PlayerGui.ScreenGui
				transpar()

				wait(10)
				untrapsar()

				
         end

			haventcapturedearly = true -- Разрешает захватить флаг после кулдауна.

			script.Parent.Parent.Title2.BillboardGui.TextLabel.Visible = false -- Уберает текст с кулдауном.

			-- Аллемания
		elseif user.TeamColor == Nation2Color.Value and  user.TeamColor ~= script.Parent.Parent.Captured.Value then

			haventcapturedearly = false -- Не удалять, иначе вторая нация сможет захватывать сразу-же после захвата.

			game.Workspace.Bum:Play() -- Производит звук оповещения когда флаг захвачен, можно удалить, но круче будет с ним.

			script.Parent.Parent.Title2.BillboardGui.TextLabel.Visible = true
			flag.Decal.Texture = Nation2Texture.Texture
			texta.TextColor3 = Nat2Color3.Value
			script.Parent.Parent.Captured.Value = user.TeamColor
			game.ReplicatedStorage.Points.NAT1.Value -= 1  --Уберает количество очков захвата для нации в секунду. 
			game.ReplicatedStorage.Points.NAT2.Value += 1  --Добавляет количество очков захвата для нации в секунду. 
			handle.Color3 = Nat2Color3.Value

			v.Text = "Госсударство " .. Nation2Name.Value .." Захватило точку " .. texta.Text

			for index, player in pairs(players:GetChildren()) do -- Интерфейс оповещения.
				v.TextColor3 = Nat2Color3.Value
				v.Parent = player.PlayerGui.ScreenGui
				transpar()

				wait(10)
				untrapsar()


			end

			haventcapturedearly = true -- Разрешает захватить флаг после кулдауна.

			script.Parent.Parent.Title2.BillboardGui.TextLabel.Visible = false -- Уберает текст с кулдауном.

			end 
		end 
	wait(10)
	end

script.Parent.Touched:connect(onTouch) 
