local Target = 'LocalPlayer'
local SavedTools = Instance.new('Folder',game:GetService('ReplicatedStorage'))
SavedTools.Name = 'SavedToolsForGodModeLel'
function PreventDieing(TargetPlayer)
	while wait() do
		if game:GetService('Players')[TargetPlayer].Character and game:GetService('Players')[TargetPlayer].Character.Humanoid.Health < 100 then 
			local lastPos = game:GetService('Players')[TargetPlayer].Character:FindFirstChild('HumanoidRootPart').Position
			local plr = game:GetService('Players')[TargetPlayer].Name
			local gayevent = game:GetService('Workspace').Remote.loadchar
			if game:GetService('ReplicatedStorage'):FindFirstChild('SavedToolsForGodModeLel') then
				for i,v in pairs(game:GetService('Players')[TargetPlayer].Backpack:GetChildren()) do
					if v then
						v.Parent = SavedTools
					end
				end
				for i,v in pairs(game:GetService('Players')[TargetPlayer].Character:GetChildren()) do
					if v:IsA('Tool') then
						v.Parent = SavedTools
					end
				end
				gayevent:InvokeServer(plr,game:GetService('Players')[TargetPlayer].TeamColor.Name)
				game:GetService('Players')[TargetPlayer].Character.HumanoidRootPart.CFrame = CFrame.new(lastPos)
				for i,v in pairs(SavedTools:GetChildren()) do
					if v then
						v.Parent = game:GetService('Players')[TargetPlayer].Backpack
					end
				end
				SavedTools:ClearAllChildren()
			else
				local SavedTools = Instance.new('Folder',game:GetService('ReplicatedStorage'))
				SavedTools.Name = 'SavedToolsForGodModeLel'
				for i,v in pairs(game:GetService('Players')[TargetPlayer].Backpack:GetChildren()) do
					if v then
						v.Parent = SavedTools
					end
				end
				for i,v in pairs(game:GetService('Players')[TargetPlayer].Character:GetChildren()) do
					if v:IsA('Tool') then
						v.Parent = SavedTools
					end
				end
				gayevent:InvokeServer(plr,game:GetService('Players')[TargetPlayer].TeamColor.Name)
				game:GetService('Players')[TargetPlayer].Character.HumanoidRootPart.CFrame = CFrame.new(lastPos)
				for i,v in pairs(SavedTools:GetChildren()) do
					if v then
						v.Parent = game:GetService('Players')[TargetPlayer].Backpack
					end
				end
				SavedTools:ClearAllChildren()
			end
		end
	end
end

wait()

if game:GetService('Players')[Target].Character and game:GetService('Players')[Target].Character:FindFirstChild('Humanoid') then
	game:GetService('Players')[Target].Character.Humanoid:GetPropertyChangedSignal('Health'):Connect(function()
		PreventDieing(Target)
	end)
else
	repeat wait() until game:GetService('Players')[Target].Character and game:GetService('Players')[Target].Character:FindFirstChild('Humanoid')
	game:GetService('Players')[Target].Character.Humanoid:GetPropertyChangedSignal('Health'):Connect(function()
		PreventDieing(Target)
	end)
end

game:GetService('Players').PlayerAdded:Connect(function()
	PreventDieing(Target)
end)
