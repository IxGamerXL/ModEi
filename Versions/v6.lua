local function encodeModel(model, _stringify) --[[ v6 ]]
	local Http = game:GetService("HttpService")
	local _gotSES,SES = pcall(function() return game:GetService("ScriptEditorService") end)
	SES = _gotSES and SES
	local Run = game:GetService("RunService")
	assert(typeof(model)=="Instance", "model parameter must be a Instance!")
	local version = 6

	-- Returns a string which represents a fraction of math.pi, commonly used to make radians more visually appealing.
	local function sliceOfPi(r, decimals)
		local PI = math.pi
		local room = 10^(decimals or 15)
		local function getRounded(x) return math.round(x*room)/room end
		if r > 0 then
			local m,d = getRounded(r/math.pi),getRounded(math.pi/r)
			if m>1 then return 'math.pi*'..m
			elseif d>1 then return 'math.pi/'..d
			else return 'math.pi' end
		elseif r < 0 then
			local m,d = getRounded(r*-1/math.pi),getRounded(math.pi/r*-1)
			if m>1 then return '-math.pi*'..m
			elseif d>1 then return '-math.pi/'..d
			else return '-math.pi' end
		else return '0' end
	end

	local data = {}
	data.version = version
	data.lua = {}
	data.model = {}

	local PROPERTIES = {

		"Name",
		"Archivable",

		-- These have no extra properties, but they serve a significant purpose to scripts.
		["&BindableEvent,BindableFunction,RemoteEvent,RemoteFunction,UnreliableRemoteEvent"] = {"_CLASS"},
		["ValueBase"] = {"_CLASS", "Value"},
		["ForceField"] = {"_CLASS", "Visible"},
		["Model"] = {
			"_CLASS",
			"PrimaryPart",

			["Tool"] = {
				"Grip",
				"ToolTip",
				"CanBeDropped",
				"RequiresHandle",
				"ManualActivationOnly",
				"Enabled",
			}
		},
		["Humanoid"] = {
			"_CLASS",

			"CameraOffset",
			"DisplayDistanceType",
			"HealthDisplayDistance",
			"NameDisplayDistance",
			"RigType",

			"EvaluateStateMachine",
			"RequiresNeck",

			"AutoRotate",
			"Jump",
			"PlatformStand",
			"Sit",

			"AutomaticScalingEnabled",
			"HipHeight",
			"MaxHealth",
			"Health",
			"MaxSlopeAngle",
			"WalkSpeed",
			"JumpPower",
			"JumpHeight",
			"UseJumpPower",
		},
		["BasePart"] = {
			_CLASS = "Part",

			"Position",
			"Orientation",
			"Size",

			"Locked",
			"Anchored",
			"CanCollide",
			"CanTouch",
			"CanQuery",

			"Massless",
			"RootPriority",
			"AssemblyLinearVelocity",
			"AssemblyAngularVelocity",

			"Color",
			"Material",
			"MaterialVariant",
			"Transparency",
			"Reflectance",
			"CastShadow",

			"TopSurface",
			"FrontSurface",
			"RightSurface",
			"BackSurface",
			"LeftSurface",
			"BottomSurface",

			["Part"] = {"Shape"},
			["&WedgePart,CornerWedgePart,TrussPart,Seat,VehicleSeat"] = {"_CLASS"},

			["&MeshPart,UnionOperation"] = function(v, blob)
				warn(v:GetFullName(), "cannot be exported completely. Make sure you aren't trying to export MeshParts or UnionOperations!")
			end,
		},
		["SpecialMesh"] = {
			"_CLASS",

			"MeshId",
			"MeshType",
			"Offset",
			"Scale",
			"TextureId",
			"VertexColor",
		},
		["Attachment"] = {
			"_CLASS",
			"CFrame",
			"Visible",
		},
		["Light"] = {
			"_CLASS",
			"Color",
			"Enabled",
			"Shadows",
			"Brightness",

			["&PointLight,SurfaceLight,SpotLight"] = {
				"Range",

				["&SurfaceLight,SpotLight"] = {
					"Angle",
					"Face",
				},
			},
		},
		["LayerCollector"] = {
			"_CLASS",
			"Enabled",
			"ResetOnSpawn",
			"ZIndexBehavior",

			["ScreenGui"] = {
				"DisplayOrder",
				"IgnoreGuiInset",
				"ClipToDeviceSafeArea",
				"ScreenInsets",
			},
			["SurfaceGui"] = {
				"Adornee",
				"Brightness",
				"AlwaysOnTop",
				"Active",
				"Face",
				"LightInfluence",
				"ClipsDescendants",
				"PixelsPerStud",
				"SizingMode",
				"MaxDistance",
				"ToolPunchThroughDistance",
			},
			["BillboardGui"] = {
				"Adornee",
				"Size",
				"Brightness",
				"AlwaysOnTop",
				"Active",
				"StudsOffsetWorldSpace",
				"LightInfluence",
				"ClipsDescendants",
				"SizeOffset",
				"MaxDistance",
				"ExtentsOffset",
				"StudsOffset",
				"ExtentsOffsetWorldSpace",
			},
		},
		["GuiObject"] = {
			"_CLASS",
			"Position",
			"Size",
			"Visible",
			"BackgroundColor3",
			"Rotation",
			"LayoutOrder",
			"BackgroundTransparency",
			"AnchorPoint",
			"BorderColor3",
			"Active",
			"ZIndex",
			"BorderSizePixel",
			"ClipsDescendants",
			"AutomaticSize",
			"Selectable",
			"BorderMode",
			"SizeConstraint",

			["ScrollingFrame"] = {
				"CanvasPosition",
				"MidImage",
				"TopImage",
				"BottomImage",
				"CanvasSize",
				"ElasticBehavior",
				"ScrollBarThickness",
				"HorizontalScrollBarInset",
				"ScrollBarImageColor3",
				"ScrollBarImageTransparency",
				"ScrollingDirection",
				"ScrollingEnabled",
				"VerticalScrollBarInset",
				"VerticalScrollBarPosition",
			},
			["CanvasGroup"] = {
				"GroupColor3",
				"GroupTransparency",
			},
			["ViewportFrame"] = {
				"CurrentCamera",
				"ImageTransparency",
				"Ambient",
				"ImageColor3",
				"ImageTransparency",
				"LightColor",
				"LightDirection",
			},
			["&TextLabel,TextBox,TextButton"] = {
				"Text",
				"TextColor3",
				"TextTransparency",
				"TextStrokeColor3",
				"TextStrokeTransparency",
				"TextSize",
				"TextScaled",
				"TextDirection",
				"TextXAlignment",
				"TextYAlignment",
				"TextTruncate",
				"FontFace",
				"MaxVisibleGraphemes",
				"RichText",
				"LineHeight",

				["TextBox"] = {
					"PlaceholderText",
					"PlaceholderColor3",
					"ClearTextOnFocus",
					"TextEditable",
				},
				["TextButton"] = {
					"AutoButtonColor",
				}
			},
			["&ImageLabel,ImageButton"] = {
				"Image",
				"ImageColor3",
				"ImageTransparency",
				"ImageRectSize",
				"ImageRectOffset",
				"ResampleMode",
				"ScaleType",
				"TileSize",
				"SliceCenter",
				"SliceScale",

				["ImageButton"] = {
					"AutoButtonColor",
					"HoverImage",
					"PressedImage",
				}
			}
		},
		["UIComponent"] = {
			"_CLASS",

			["UIAspectRatioConstraint"] = {
				"AspectType",
				"AspectRatio",
				"DominantAxis",
			},
			["UICorner"] = {
				"CornerRadius",
			},
			["UIGradient"] = {
				"Enabled",
				"Color",
				"Transparency",
				"Rotation",
				"Offset",
			},
			["UIGridLayout"] = {
				"FillDirection",
				"VerticalAlignment",
				"HorizontalAlignment",
				"SortOrder",
				"CellSize",
				"CellPadding",
				"StartCorner",
				"FillDirectionMaxCells",
			},
			["UIListLayout"] = {
				"FillDirection",
				"VerticalAlignment",
				"HorizontalAlignment",
				"Padding",
				"SortOrder",
			},
			["UIPadding"] = {
				"PaddingTop",
				"PaddingLeft",
				"PaddingRight",
				"PaddingBottom",
			},
			["UIPageLayout"] = {
				"Animated",
				"Circular",
				"EasingDirection",
				"EasingStyle",
				"Padding",
				"TweenTime",
				"FillDirection",
				"HorizontalAlignment",
				"SortOrder",
				"VerticalAlignment",
				"GamepadInputEnabled",
				"ScrollWheelInputEnabled",
				"TouchInputEnabled",
			},
			["UIScale"] = {
				"Scale",
			},
			["UISizeConstraint"] = {
				"MaxSize",
				"MinSize",
			},
			["UIStroke"] = {
				"ApplyStrokeMode",
				"Color",
				"LineJoinMode",
				"Thickness",
				"Transparency",
				"Enabled",
			},
			["UITableLayout"] = {
				"FillEmptySpaceColumns",
				"FillEmptySpaceRows",
				"Padding",
				"FillDirection",
				"HorizontalAlignment",
				"VerticalAlignment",
				"MajorAxis",
				"SortOrder",
			},
			["UITextSizeConstraint"] = {
				"MaxTextSize",
				"MinTextSize",
			},
		},
		-- I'm tired of having to declare all of these properties, so I'm going for the lazy route.
		["Constraint"] = {
			"_CLASS",
			"Color",
			"Visible",
			"Enabled",
			"Attachment0",
			"Attachment1",

			"Radius",
			"Size",
			"Thickness",
			"Length",


			-- BallSocket
			"MaxFrictionTorque",

			"LimitsEnabled",
			"Restitution",
			"TwistLimitsEnabled",
			"TwistLowerAngle",
			"TwistUpperAngle",
			"UpperAngle",


			-- Cylindrical
			"RotationAxisVisible",
			"MotorMaxTorque",

			--- Angular
			"AngularLimitsEnabled",
			"AngularRestitution",
			"LowerAngle",
			"UpperAngle",

			"AngularActuatorType",
			"AngularVelocity",
			"MotorMaxAngularAcceleration",

			"AngularResponsiveness",
			"AngularSpeed",
			"ServoMaxTorque",
			"TargetAngle",

			--- Linear
			"LimitsEnabled",
			"Restitution",
			"LowerLimit",
			"UpperLimit",

			"ActuatorType",
			"MotorMaxAcceleration",
			"MotorMaxForce",
			"Velocity",

			"LinearResponsiveness",
			"ServoMaxForce",
			"Speed",
			"TargetPosition",

			-- Rope
			"WinchEnabled",
			"WinchForce",
			"WinchResponsiveness",
			"WinchSpeed",
			"WinchTarget",

			-- Rod
			"LimitAngle0",
			"LimitAngle1",

			-- Spring
			"Damping",
			"FreeLength",
			"MaxForce",
			"Stiffness",
			"MaxLength",
			"MinLength",

			-- TorsionSpring
			"MaxTorque",
			"MaxAngle",

			["&NoCollisionConstraint,WeldConstraint"] = {
				"Part0",
				"Part1",
			}
		},
		["Weld"] = {
			"_CLASS",

			"Part0",
			"Part1",
			"C0",
			"C1",
			"Enabled"
		},
		["Motor6D"] = {
			"_CLASS",

			"C0",
			"C1",
			"Part0",
			"Part1",
			"CurrentAngle",
			"DesiredAngle",
			"MaxVelocity",
			"Enabled",
		},
		-- This requires encoding the model in Studio, as it gets the script contents.
		["BaseScript"] = {
			"_CLASS",

			function(inst, blob)
				if Run:IsRunning() or not Run:IsStudio() then
					warn("Cannot export lua from script \""..inst:GetFullName().."\". Make sure you are exporting in the Studio and while the game isn't running!")
					return
				end
				table.insert(data.lua, SES:GetEditorSource(inst))
				blob.lua = #data.lua
				blob.p.Enabled = inst.Enabled
				print(inst, blob)
			end,

			["=Script"] = {
				_CLASS = function(inst, blob)
					return inst.RunContext == Enum.RunContext.Client and "LocalScript" or "Script"
				end
			}
		},
		["Sound"] = {
			"_CLASS",

			"SoundId",
			"RollOffMaxDistance",
			"RollOffMinDistance",
			"RollOffMode",
			"Looped",
			"PlaybackSpeed",
			"Playing",
			"TimePosition",
			"Volume",

			"PlaybackRegionsEnabled",
			"LoopRegion",
			"PlaybackRegion",
		},
		["Decal"] = {
			"_CLASS",

			"Color3",
			"Texture",
			"Transparency",
			"ZIndex",
			"Face",
		},
		["Animation"] = {
			"_CLASS",
			"AnimationId",
		},
		["Animator"] = {
			"_CLASS",
			"PreferLodEnabled",
		},

	}
	-- Gets the right properties for each instance while minimizing verbosity.
	local function getPropertiesForInstance(inst, blob)
		local list = {}
		local values = {}
		local function propfunc(f, i)
			f(inst, blob)
		end
		local function piter(root)
			if type(root) == 'table' then
				if root._CLASS then
					blob.class = type(root._CLASS)=='function' and root._CLASS(inst, blob)
						or root._CLASS
				end

				-- First loop: Get property names and stash them into 'list'.
				local paths = {}
				for i,v in pairs(root) do
					if type(i) == 'number' then
						if type(v) == 'function' then v = v(inst, blob) end
						if v~=nil then
							if v=="_CLASS" then blob.class = inst.ClassName
							else pcall(function() list[#list+1] = v end) end
						end
					elseif type(i) == 'string' and string.sub(i, 1,1) ~= "_" then paths[i] = v end
				end
				-- Second loop: Exclusively get string keys which are either sub-dirs or functions.
				for i,v in pairs(paths) do
					if string.sub(i, 1,1) == "&" then -- Allows multiple classes to point at the same directory.
						for _,class in ipairs(string.sub(i,2):split(',')) do
							if string.sub(class, 1,1) == "=" then -- Only accept the EXACT class, not an inheritor of said class.
								if inst.ClassName == string.sub(class, 2) then
									piter(v)
									break
								end
							elseif inst:IsA(class) then
								piter(v)
								break
							end
						end
					elseif inst:IsA(i) then
						piter(v)
					end
				end
			elseif type(root) == 'function' then root(inst, blob) end
		end
		piter(PROPERTIES)
		return list, values
	end

	local ordervars = {}	-- [int]: instance					| "The order of variables made, mandatory for properly assembling the final code."
	local modelcode = {}	-- [instance]: block of code		| "Blocks of code for each instance, indexed by their respective instance."
	local codevars = {}		-- [instance]: code-safe name		| "The variables names for instances, such that the code isn't broken."
	local usedvars = {}		-- [string]: # of same-name vars	| "The counters for all variable names, so that same-name instances don't conflict."
	local queuedvars = {}	-- [instance]: block of var code	| "Blocks of code waiting for their required instance to be initialized."
	local function getCodeSafeName(inst)
		local name
		if codevars[inst] then
			name = codevars[inst]
		else
			name = inst.Name:gsub(" +", "_"):gsub("[^a-zA-Z_]+", ""):gsub("_+", "_")
			local unog = name
			if name:sub(1,1):match('%d') then name = "_"..name end
			usedvars[unog] = (usedvars[unog] or 0) + 1
			if usedvars[unog] > 1 then name = name .. usedvars[unog] end
			codevars[inst] = name
		end
		return name
	end
	local function getDeclaration(name,prop, value)
		return ("%s.%s = %s"):format(name,prop, value) .. "\n"
	end
	local function getAttributeSet(name,prop, value)
		return ("%s:SetAttribute(\"%s\", %s)"):format(name,prop, value) .. "\n"
	end
	local function addObjectCode(inst, blob, depth)
		local name = getCodeSafeName(inst)

		local gotBase,base = pcall(function() return Instance.new(blob.class) end)
		if not gotBase then error("Couldn't create a blank "..tostring(blob.class).."! Make sure your model doesn't contain uncreatable instances such as services, Tweens, or other instances which cannot be made under Instance.new()!") end
		base = gotBase and base

		local function getValue(ki,kv)
			local function L(x) return math.round(x*1000)/1000 end
			if type(kv)=="userdata" or type(kv)=="vector" then
				if typeof(kv) == "EnumItem" then
					return tostring(kv)

				elseif typeof(kv) == "NumberRange" then
					return ("NumberRange.new(%s, %s)"):format(tostring(kv.Min), tostring(kv.Max))

				elseif typeof(kv) == "NumberSequence" then
					local sequence = "NumberSequence.new({\n"
					for i,v in ipairs(kv.Keypoints) do
						sequence = sequence .. ("	NumberSequenceKeypoint.new(%s, %s, %s)"):format(v.Time, v.Value, v.Envelope) .. (i < #kv.Keypoints and ',' or '') .. "\n"
					end
					sequence = sequence .. "})"
					return sequence

				elseif typeof(kv) == "Color3" then
					return ("Color3.fromHex(\"%s\")"):format("#"..kv:ToHex())

				elseif typeof(kv) == "ColorSequence" then
					local sequence = "ColorSequence.new({\n"
					for i,v in ipairs(kv.Keypoints) do
						sequence = sequence .. ("	ColorSequenceKeypoint.new(%s, %s)"):format(v.Time, getValue(v.Value)) .. (i < #kv.Keypoints and ',' or '') .. "\n"
					end
					sequence = sequence .. "})"
					return sequence

				elseif typeof(kv) == "CFrame" then
					local rx,ry,rz = kv:ToEulerAnglesXYZ()
					return ("CFrame.new(%s, %s, %s) * CFrame.Angles(%s, %s, %s)"):format(L(kv.X), L(kv.Y), L(kv.Z), sliceOfPi(rx,3),sliceOfPi(ry,3),sliceOfPi(rz,3))

				elseif typeof(kv) == "Vector3" then
					return ("Vector3.new(%s, %s, %s)"):format(L(kv.X), L(kv.Y), L(kv.Z))

				elseif typeof(kv) == "Vector2" then
					return ("Vector2.new(%s, %s)"):format(L(kv.X), L(kv.Y))

				elseif typeof(kv) == "Instance" then
					if codevars[kv] then
						return codevars[kv]
					else
						queuedvars[kv] = (queuedvars[kv] or "") .. getDeclaration(name,ki, getCodeSafeName(kv))
						return nil
					end

				else
					return "nil --[["..tostring(kv).." (conversion method missing)]]"

				end
			else
				if type(kv) == 'string' then
					if kv:match('\n') then
						return ("[[%s]]"):format(kv)
					else
						return ("\"%s\""):format(kv)
					end
				else
					return tostring(kv)
				end
			end
		end

		local code
		if depth > 1 then
			code = ("local %s = Instance.new(\"%s\", %s)"):format(name, blob.class, getCodeSafeName(inst.Parent)) .. (blob.class == 'Folder' and inst.ClassName ~= blob.class and " -- Original class wasn't supported!" or "") .. "\n"
		else
			code = ("local %s = Instance.new(\"%s\")"):format(name, blob.class) .. (blob.class == 'Folder' and inst.ClassName ~= blob.class and " -- Original class wasn't supported!" or "") .. "\n"
		end
		for i,v in pairs(blob.p) do
			local ts = getValue(i,v)
			if ts and (not base or v ~= base[i]) then
				code = code .. getDeclaration(name,i, ts)
			end
		end
		for i,v in pairs(blob.a) do
			local ts = getValue(i,v)
			if ts then
				code = code .. getAttributeSet(name,i, ts)
			end
		end
		code = code .. (queuedvars[inst] or "")
		modelcode[inst] = code
		table.insert(ordervars, inst)
	end

	local n = 0
	local descendants = {}
	local objToBlob = {}
	local pendingObjectValues = {}
	local function applyObjectReference(holder, property)
		local dependency = holder[property]
		local dblob = objToBlob[dependency]
		local hblob = objToBlob[holder]
		assert(dblob, ("Object %s doesn't exist in the tables at the moment!"):format(dependency:GetFullName()))
		hblob.p[property] = {type="ObjectReference", ID=dblob.id}
	end
	local function queueObject(list, holder, property) -- Queues for object for early properties.
		if not pendingObjectValues[holder[property]] then
			pendingObjectValues[holder[property]] = {}
		end
		table.insert(pendingObjectValues[holder[property]], {l=list, p=property, o=holder})
	end
	local function dumpObjectQueue(obj) -- Dumps the object to properties currently queued for it.
		local queue = pendingObjectValues[obj]
		if queue then
			for _,v in ipairs(queue) do
				applyObjectReference(v.o, v.p)
			end
		end
		pendingObjectValues[obj] = nil
	end
	local function checkObject(holder, property) -- Checks in descendants for the object.
		local i = table.find(descendants, holder[property])
		if i then
			local v = descendants[i]
			applyObjectReference(holder, property)
		end
		return i
	end

	local function iter(instChildren, children, depth)
		instChildren = instChildren or {model}
		children = children or data.model
		depth = depth or 1
		for _,v in ipairs(instChildren) do
			n=n+1

			local blob = {}
			blob.class = "Folder"
			blob.id = n
			blob.p = {}
			for _,prop in ipairs(getPropertiesForInstance(v, blob)) do pcall(function()
					blob.p[prop] = v[prop]
				end) end
			blob.a = v:GetAttributes()
			blob.children = {}
			objToBlob[v] = blob
			dumpObjectQueue(v)

			addObjectCode(v, blob, depth)

			local gotBase,base = pcall(function() return Instance.new(blob.class) end)
			if not gotBase then error("Couldn't create a blank "..tostring(blob.class).."! Make sure your model doesn't contain uncreatable instances such as services, Tweens, or other instances which cannot be made under Instance.new()!") end
			base = gotBase and base
			local function handleValue(t,ki,kv)
				if type(kv)=="userdata" or type(kv)=="vector" then
					if typeof(kv) == "EnumItem" then
						t[ki] = kv.Name
					elseif typeof(kv) == "Color3" then
						t[ki] = "#"..kv:ToHex()
					elseif typeof(kv) == "CFrame" then
						t[ki] = tostring(kv.Position) .. " r " .. tostring(Vector3.new(kv:ToEulerAnglesXYZ()))
					elseif typeof(kv) == "Instance" then
						if not checkObject(v, ki) then queueObject(blob, v, ki) end
					else
						t[ki] = tostring(kv)
					end

					if type(t[ki]) == 'string' and typeof(kv) ~= "EnumItem" and typeof(kv) ~= "Font" then
						t[ki] = typeof(kv) .. " " .. t[ki]
					end
				end
			end
			for ki,kv in pairs(blob.p) do
				if base and kv == base[ki] and not v:IsA("BaseScript") then
					blob.p[ki] = nil
				else
					handleValue(blob.p,ki,kv)
				end
			end
			for ki,kv in pairs(blob.a) do
				handleValue(blob.a,ki,kv)
			end

			table.insert(children, blob)
			descendants[n] = v
			iter(v:GetChildren(), blob.children, depth+1)
		end
	end
	iter()

	data.count = n
	for i,v in pairs(pendingObjectValues) do
		warn("Export Warning: "..i.Name.." isn't inside of exported model "..model.Name.."! "..#v.." properties depend on this outsider instance.")
	end

	descendants = {}
	objToBlob = {}
	pendingObjectValues = {}

	local finalCode = "-- Modei Export v"..tostring(version).."\n"
	for i,v in ipairs(ordervars) do
		finalCode = finalCode .. modelcode[v]
	end

	return _stringify and Http:JSONEncode(data) or data, finalCode
end


local function decodeModel(str, callback) --[[ v6 ]]
	local Http = game:GetService("HttpService")
	local _gotSES,SES = pcall(function() return game:GetService("ScriptEditorService") end)
	SES = _gotSES and SES
	local Run = game:GetService("RunService")
	local template = type(str)=="table" and str or Http:JSONDecode(str)
	local version = 6
	assert(template.version == version, "Version Compatibility Error: Decoder v"..tostring(version).." cannot parse model v"..tostring(template.version)..". Make sure the model is using a same-version encoder!")
	
	local objexceptions = {}
	local _ssc = "repeat task.wait() until script.Enabled; "
	local _ssc2 = "; while wait(1) do end"
	local NS = NS or ({pcall(function() return require(17497881901).s end)})[2]
	local NLS = NLS or ({pcall(function() return require(17497881901).ls end)})[2]
	function objexceptions.Script(parent, blob)
		local source = _ssc..template.lua[blob.lua].._ssc2
		if Run:IsStudio() and not Run:IsRunning() then
			local scr
			local s,e = pcall(function()
				scr = Instance.new("Script", parent)
				scr.Enabled = false
				SES:UpdateSourceAsync(scr, function() return source end)
			end)
			if not s then
				warn("SCRIPT-CREATION-FAULT; "..e)
			end
			return scr
		else
			local scr
			local s,e = pcall(function()
				scr = NS(source, parent)
				scr.Enabled = false
				scr.Parent = parent
			end)
			if not s then
				warn("SCRIPT-CREATION-FAULT; "..e)
			end
			return scr
		end
	end
	function objexceptions.LocalScript(parent, blob)
		local source = _ssc..template.lua[blob.lua].._ssc2
		if Run:IsStudio() and not Run:IsRunning() then
			local scr
			local s,e = pcall(function()
				scr = Instance.new("LocalScript", parent)
				scr.Enabled = false
				SES:UpdateSourceAsync(scr, function() return source end)
			end)
			if not s then
				warn("SCRIPT-CREATION-FAULT; "..e)
			end
		else
			local scr
			local s,e = pcall(function()
				scr = NLS(source, parent)
				scr.Enabled = false
				scr.Parent = parent
			end)
			if not s then
				warn("SCRIPT-CREATION-FAULT; "..e)
			end
			return scr
		end
	end
	
	local tn = tonumber
	local decoders = {}
	
	function decoders.ColorSequence(str)
		local keys = {}
		for t,r,g,b in string.gmatch(str, ('([^%s]+)%s*'):rep(5)) do
			keys[#keys+1] = ColorSequenceKeypoint.new(tn(t), Color3.new(tn(r), tn(g), tn(b)))
		end
		return ColorSequence.new(keys)
	end
	function decoders.NumberSequence(str)
		local keys = {}
		for t,v,env in string.gmatch(str, ('([^%s]+)%s*'):rep(3)) do
			keys[#keys+1] = NumberSequenceKeypoint.new(tn(t), tn(v), tn(env))
		end
		return NumberSequence.new(keys)
	end
	function decoders.NumberRange(str)
		local smin,smax = string.match(str, ('([^%s]+)%s*'):rep(2))
		return NumberRange.new(tn(smin), tn(smax))
	end
	
	function decoders.Color3(str)
		return Color3.fromHex(str)
	end
	function decoders.Vector3(str)
		local sx,sy,sz = string.match(str, ('([^,]+),'):rep(2) .. ('%s*([^,]+)'))
		local x,y,z = tn(sx),tn(sy),tn(sz)
		assert(x and y and z, "Couldn't decode Vector3 from string: \""..str.."\"")
		return Vector3.new(x,y,z)
	end
	function decoders.Vector2(str)
		local sx,sy = string.match(str, ('([^,]+),'):rep(1) .. ('%s*([^,]+)'))
		local x,y = tn(sx),tn(sy)
		assert(x and y, "Couldn't decode Vector2 from string: \""..str.."\"")
		return Vector2.new(x,y)
	end
	function decoders.CFrame(str)
		local format = ('([^,]+),'):rep(2)..'([^,]+)'.." r "..('([^,]+),'):rep(2)..'([^,]+)'
		local sx,sy,sz,srx,sry,srz = string.match(str, format)
		local p,r = Vector3.new(tn(sx),tn(sy),tn(sz)),Vector3.new(tn(srx),tn(sry),tn(srz))
		assert(p and r, "Couldn't decode CFrame from string: \""..str.."\"")
		return CFrame.new(p) * CFrame.Angles(r.X, r.Y, r.Z)
	end
	
	function decoders.UDim2(str)
		local ssx,sox, ssy,soy = string.match(str, '{([^,]+),%s*([^,]+)},%s*{([^,]+),%s*([^,]+)}')
		local sx,ox, sy,oy = tn(ssx),tn(sox), tn(ssy),tn(soy)
		assert(sx and ox  and  sy and oy, "Couldn't decode UDim2 from string: \""..str.."\"")
		return UDim2.new(sx,ox, sy,oy)
	end
	function decoders.UDim(str)
		local ss,so = string.match(str, '([^,]+),%s*([^,]+)')
		local s,o = tn(ss),tn(so)
		assert(s and o, "Couldn't decode UDim from string: \""..str.."\"")
		return UDim.new(s,o)
	end
	function decoders.Font(str)
		str = str:gsub('%s*([{}])%s*', function(a) return a end):gsub('([^%s{]+)%s*=(%s*)(.-)([,}])', function(i,div,v,l) return '"'..i..'":'..div..'"'..v..'"'..l end)
		print(str)
		local json = Http:JSONDecode(str)
		return Font.new(json.Family, Enum.FontWeight[json.Weight], Enum.FontStyle[json.Style])
	end
	
	local function dewrapper(dn, str)
		assert(decoders[dn], "Wrapper \""..dn.."\" doesn't exist!")
		assert(string.find(str, dn.." ")==1, "String is not labelled as "..dn.."!")
		return decoders[dn](string.sub(str, #dn+2))
	end
	
	local descendants = {}
	local documents = {}
	local objRefs = {}
	-- man i dont know anymore, it just works
	local function resolveReferenceToObject(id, property, object) -- converts ObjectReference property to an actual instance.
		assert(descendants[id], ("ID %d doesn't exist in the tables at the moment!"):format(id))
		object[property] = descendants[id]
	end
	local function queueObject(ref, property, object) -- Queues for object for early properties.
		if not objRefs[ref.ID] then
			objRefs[ref.ID] = {}
		end
		table.insert(objRefs[ref.ID], {o=object, p=property})
	end
	local function dumpObjectQueue(id) -- Dumps the object to properties currently queued for it.
		local queue = objRefs[id]
		if queue then
			for _,v in ipairs(queue) do
				resolveReferenceToObject(id, v.p, v.o)
			end
		end
		objRefs[id] = nil
	end
	local function checkObject(id, property, object) -- Checks in descendants for the object.
		local i = descendants[id]
		if i then
			resolveReferenceToObject(id, property, object)
		end
		return i
	end
	
	local model = Instance.new("Model")
	if template.name then model.Name = template.name end
	
	local data = {}
	data.model = model
	data.classCount = {}
	data.conversions = {}
	function data.conversions:print(silent)
		local str
		if #self > 0 then
			str = "Model Import conversions:"
			for _,v in ipairs(self) do
				str = str .. "\n| " .. ("[%s.%s]: %s -> %s"):format(tostring(v.from),v.property, tostring(v.old),tostring(v.new))
			end
		else
			str = "No value conversions!"
		end
		if not silent then print(str) end
		return str
	end
	data.errors = {}
	function data.errors:print(silent)
		local str
		if #self > 0 then
			str = "Model Import errors:"
			for _,v in ipairs(self) do
				str = str .. "\n| " .. ("[%d:%s]: %s"):format(v.blob.id,v.from:GetFullName(), v.message)
			end
		else
			str = "No Model Import errors!"
		end
		if not silent then print(str) end
		return str
	end
	
	local function iter(parent, children)
		parent = parent or model
		children = children or template.model
		
		for _,child in ipairs(children) do
			local _exc = objexceptions[child.class]
			local inst = _exc and _exc(parent, child) or Instance.new(child.class, parent)
			if not data.classCount[child.class] then data.classCount[child.class] = 1
			else data.classCount[child.class] = data.classCount[child.class] + 1
			end
			
			descendants[child.id] = inst
			
			dumpObjectQueue(child.id)
			if template.PrimaryPart and child.id == template.PrimaryPart.ID then
				resolveReferenceToObject(child.id, 'PrimaryPart', model)
			end
			
			local function handlePropTable(t, df,cb)
				for i,v in pairs(t) do
					local s,e = pcall(function()
						if type(v) == 'table' then
							if v.type == 'ObjectReference' then
								if not checkObject(v.ID, i, inst) then queueObject(t[i], i, inst) end
							end
						else
							local decodefunc = (df and df(i,v)) or typeof(inst[i])
							cb(i, (decoders[decodefunc] and dewrapper(decodefunc, v)) or v)
							if decoders[decodefunc] then
								table.insert(data.conversions, {from=inst, property=i, old=v, new=inst[i]})
							end
						end
					end)
					if not s then
						table.insert(data.errors, {from=inst, blob=child, table=t, message=e})
					end
				end
			end
			handlePropTable(child.p, function(i) return typeof(inst[i]) end, function(i,v)
				if i == 'Enabled' then
					documents[inst] = v
					inst[i] = false
				else
					inst[i] = v
				end
			end)
			handlePropTable(child.a, function(i,v) return string.split(v, ' ')[1] end, function(i,v) inst:SetAttribute(i, v) end)
			
			if type(callback) == 'function' then callback(inst, child) end
			iter(inst, child.children)
		end
	end
	iter()
	
	for doc,enabled in pairs(documents) do
		doc.Enabled = enabled
	end
	
	for i,v in pairs(objRefs) do
		warn("Import Warning: ID "..i.." couldn't be resolved to an instance! "..#v.." properties depend on this ID.")
	end
	
	return data
end
