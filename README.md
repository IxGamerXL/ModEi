# ModEi
Roblox model export &amp; import functions utilizing JSON and code generation, designed to assist with bringing complex models into Script Builder games. Created by yours truly.

## How do I use this?
Go to the `Versions` folder, then click on the latest version. Copy the functions, preferably into one of your lua snippet files or a file dedicated to ModEi functions. Afterwards, you can now use these functions anytime.

`encodeModel` will create a table of data that can be decoded using `decodeModel`. Do note that you cannot decode ModEi exports which were made using a `encodeModel` function of a different version.

## What should I export my model to?
It depends on what you intend to use the later-imported model for.

If you want to simply import the model without much regard for the contents, you can export it to JSON, the first returned value from the `encodeModel` function.

> [!WARNING]
> You may experience the JSON having characters which terminate the string before it's supposed to, especially in models which contain Scripts. If you plan on using a ModEi JSON export within a script and _not_ from user input, make sure that you replace any occurences of your string initating character within the JSON with the same character but with a `\` placed to the left of it.
>
> For example, if you start a string containing the JSON with `"`, replace all `"` with `\"`.

> [!CAUTION]
> Large models may cause tons of lag and potentially crash your Studio upon viewing the entire JSON export. To mitigate this, you should export the model as code instead.
```json
{"count":42,"lua":[],"version":6,"model":[{"a":[],"p":{"Name":"Example","PrimaryPart":{"ID":2,"type":"ObjectReference"}},"id":1,"class":"Model","children":[{"a":[],"p":{"Color":"Color3 #4b974b","Material":"Grass","Size":"Vector3 20, 1, 20","BottomSurface":"Smooth","TopSurface":"Smooth","Anchored":true,"Name":"Ground","Position":"Vector3 0, 0.5, -15"},"id":2,"class":"Part","children":[]},{"a":[],"p":{"Material":"Concrete","Size":"Vector3 1, 3, 16","BottomSurface":"Smooth","TopSurface":"Smooth","Anchored":true,"Name":"Wall","Position":"Vector3 8.5, 2.5, -14.999999046325684"},"id":3,"class":"Part","children":[]},{"a":[],"p":{"Shape":"Wedge","Material":"Concrete","Size":"Vector3 1, 21, 2","BottomSurface":"Smooth","TopSurface":"Smooth","Anchored":true,"Name":"Wedge","Position":"Vector3 -4.499998092651367, 11.5, -21.999998092651367","Orientation":"Vector3 0, 180, 0"},"id":4,"class":"Part","children":[]},{"a":[],"p":{"Color":"Color3 #7a7a7c","RightSurface":"Smooth","BackSurface":"Smooth","LeftSurface":"Smooth","Material":"Concrete","Size":"Vector3 2, 24, 2","FrontSurface":"Smooth","BottomSurface":"Smooth","TopSurface":"Smooth","Anchored":true,"Position":"Vector3 8.5, 12.5, -20"},"id":5,"class":"TrussPart","children":[]},{"a":[],"p":{"Color":"Color3 #8a898c","Material":"Concrete","Size":"Vector3 8, 1, 16","BottomSurface":"Smooth","TopSurface":"Smooth","Anchored":true,"Name":"UpperFloor","Position":"Vector3 -1, 22.5, -14.999998092651367"},"id":6,"class":"Part","children":[{"a":[],"p":{"CFrame":"CFrame 1, 0, 2 r -0, 0, -0","Name":"FloorAttachment"},"id":7,"class":"Attachment","children":[]}]},{"a":[],"p":{"Color":"Color3 #8a898c","Material":"Concrete","Size":"Vector3 5, 1, 10","BottomSurface":"Smooth","TopSurface":"Smooth","Anchored":true,"Name":"UpperFloor","Position":"Vector3 5.5, 22.5, -11.999998092651367"},"id":8,"class":"Part","children":[]},{"a":[],"p":{"Active":true,"ResetOnSpawn":false,"LightInfluence":1,"Size":"UDim2 {12, 0}, {3, 0}","Adornee":{"ID":6,"type":"ObjectReference"},"ZIndexBehavior":"Sibling","AlwaysOnTop":true},"id":9,"class":"BillboardGui","children":[{"a":[],"p":{"FontFace":"Font { Family = rbxasset://fonts/families/SourceSansPro.json, Weight = Regular, Style = Normal }","TextStrokeTransparency":0,"Size":"UDim2 {1, 0}, {1, 0}","BackgroundTransparency":1,"BorderSizePixel":0,"BorderColor3":"Color3 #000000","Text":"Adornee Test","TextColor3":"Color3 #000000","TextScaled":true,"BackgroundColor3":"Color3 #ffffff"},"id":10,"class":"TextLabel","children":[{"a":[],"p":{"LineJoinMode":"Miter","Color":"Color3 #ffffff","Thickness":2},"id":11,"class":"UIStroke","children":[]}]}]},{"a":[],"p":{"Color":"Color3 #8a898c","Material":"Concrete","Size":"Vector3 11, 2, 1.0000004768371582","BottomSurface":"Smooth","TopSurface":"Smooth","Anchored":true,"Name":"Union","Position":"Vector3 -3.5, 2, -6.5"},"id":12,"class":"Part","children":[]},{"a":[],"p":{"Color":"Color3 #f8f8f8","Shape":"Ball","Material":"Neon","Size":"Vector3 3, 3, 3","BottomSurface":"Smooth","TopSurface":"Smooth","Name":"Light","Position":"Vector3 0, 8.500003814697266, -13"},"id":13,"class":"Part","children":[{"a":[],"p":{"Shadows":true,"Brightness":3,"Range":12},"id":14,"class":"PointLight","children":[]},{"a":[],"p":{"Attachment0":{"ID":16,"type":"ObjectReference"},"Visible":true,"Length":12,"Attachment1":{"ID":7,"type":"ObjectReference"}},"id":15,"class":"RopeConstraint","children":[]},{"a":[],"p":{"Name":"BallAttachment"},"id":16,"class":"Attachment","children":[]}]},{"a":[],"p":{"Material":"Concrete","Size":"Vector3 1, 4, 6","BottomSurface":"Smooth","TopSurface":"Smooth","Anchored":true,"Name":"Wall","Position":"Vector3 8.5, 6, -20"},"id":17,"class":"Part","children":[]},{"a":[],"p":{"Material":"Concrete","Size":"Vector3 1, 2, 16","BottomSurface":"Smooth","TopSurface":"Smooth","Anchored":true,"Name":"Wall","Position":"Vector3 8.5, 9, -15"},"id":18,"class":"Part","children":[]},{"a":[],"p":{"Material":"Concrete","Size":"Vector3 1, 4, 5","BottomSurface":"Smooth","TopSurface":"Smooth","Anchored":true,"Name":"Wall","Position":"Vector3 8.5, 6, -9.499999046325684"},"id":19,"class":"Part","children":[]},{"a":[],"p":{"Material":"Concrete","Size":"Vector3 14, 23, 1","BottomSurface":"Smooth","TopSurface":"Smooth","Anchored":true,"Name":"Wall","Position":"Vector3 2, 12.5, -23.5"},"id":20,"class":"Part","children":[]},{"a":[],"p":{"Shape":"Wedge","Material":"Concrete","Size":"Vector3 1, 23, 4","BottomSurface":"Smooth","TopSurface":"Smooth","Anchored":true,"Name":"Wedge","Position":"Vector3 -6.999998092651367, 12.5, -23.499998092651367","Orientation":"Vector3 0, 90, 0"},"id":21,"class":"Part","children":[]},{"a":[],"p":{"Material":"Concrete","Size":"Vector3 1, 4, 10","BottomSurface":"Smooth","TopSurface":"Smooth","Anchored":true,"Name":"Wall","Position":"Vector3 8.5, 12, -18"},"id":22,"class":"Part","children":[]},{"a":[],"p":{"Material":"Concrete","Size":"Vector3 1, 4, 1","BottomSurface":"Smooth","TopSurface":"Smooth","Anchored":true,"Name":"Wall","Position":"Vector3 8.5, 12, -7.499999046325684"},"id":23,"class":"Part","children":[]},{"a":[],"p":{"Material":"Concrete","Size":"Vector3 1, 1, 16","BottomSurface":"Smooth","TopSurface":"Smooth","Anchored":true,"Name":"Wall","Position":"Vector3 8.5, 14.5, -15"},"id":24,"class":"Part","children":[]},{"a":[],"p":{"Material":"Concrete","Size":"Vector3 1, 4, 1","BottomSurface":"Smooth","TopSurface":"Smooth","Anchored":true,"Name":"Wall","Position":"Vector3 8.5, 17, -22.5"},"id":25,"class":"Part","children":[]},{"a":[],"p":{"Material":"Concrete","Size":"Vector3 1, 4, 10","BottomSurface":"Smooth","TopSurface":"Smooth","Anchored":true,"Name":"Wall","Position":"Vector3 8.5, 17, -11.999999046325684"},"id":26,"class":"Part","children":[]},{"a":[],"p":{"Material":"Concrete","Size":"Vector3 1, 5, 16","BottomSurface":"Smooth","TopSurface":"Smooth","Anchored":true,"Name":"Wall","Position":"Vector3 8.5, 21.5, -15"},"id":27,"class":"Part","children":[]},{"a":[],"p":{"Name":"JointTest"},"id":28,"class":"Model","children":[{"a":[],"p":{"Massless":true,"Material":"Metal","Size":"Vector3 1, 1, 5","BottomSurface":"Smooth","TopSurface":"Smooth","Name":"Door","Position":"Vector3 -8.5, 3.5, -14.5"},"id":29,"class":"Part","children":[{"a":[],"p":{"CFrame":"CFrame 0, -1.5, 2 r -0, 0, 1.5707963705062866","Name":"Spin1"},"id":30,"class":"Attachment","children":[]}]},{"a":[],"p":{"Color":"Color3 #635f62","Material":"Metal","Size":"Vector3 1, 2, 1","BottomSurface":"Smooth","TopSurface":"Smooth","Anchored":true,"Name":"Joint","Position":"Vector3 -8.5, 2, -12.5"},"id":31,"class":"Part","children":[{"a":[],"p":{"CFrame":"CFrame 0, 0, 0 r -0, 0, 1.5707963705062866","Name":"SpinJoint"},"id":32,"class":"Attachment","children":[]},{"a":[],"p":{"Visible":true,"Velocity":500,"AngularActuatorType":"Motor","MotorMaxTorque":50000,"Attachment0":{"ID":32,"type":"ObjectReference"},"AngularVelocity":10,"Attachment1":{"ID":30,"type":"ObjectReference"},"MotorMaxForce":500},"id":33,"class":"CylindricalConstraint","children":[]},{"a":[],"p":{"Visible":true,"Velocity":500,"AngularActuatorType":"Motor","MotorMaxTorque":50000,"Attachment0":{"ID":32,"type":"ObjectReference"},"AngularVelocity":8,"Attachment1":{"ID":38,"type":"ObjectReference"},"MotorMaxForce":500},"id":34,"class":"CylindricalConstraint","children":[]},{"a":[],"p":{"Visible":true,"Velocity":500,"AngularActuatorType":"Motor","MotorMaxTorque":50000,"Attachment0":{"ID":32,"type":"ObjectReference"},"AngularVelocity":6,"Attachment1":{"ID":40,"type":"ObjectReference"},"MotorMaxForce":500},"id":35,"class":"CylindricalConstraint","children":[]},{"a":[],"p":{"Visible":true,"Velocity":500,"AngularActuatorType":"Motor","MotorMaxTorque":50000,"Attachment0":{"ID":32,"type":"ObjectReference"},"AngularVelocity":4,"Attachment1":{"ID":42,"type":"ObjectReference"},"MotorMaxForce":500},"id":36,"class":"CylindricalConstraint","children":[]}]},{"a":[],"p":{"Massless":true,"Material":"Metal","Size":"Vector3 1, 1, 5","BottomSurface":"Smooth","TopSurface":"Smooth","Name":"Door2","Position":"Vector3 -8.5, 4.5, -14.5"},"id":37,"class":"Part","children":[{"a":[],"p":{"CFrame":"CFrame 0, -2.5, 2 r -0, 0, 1.5707963705062866","Name":"Spin2"},"id":38,"class":"Attachment","children":[]}]},{"a":[],"p":{"Massless":true,"Material":"Metal","Size":"Vector3 1, 1, 5","BottomSurface":"Smooth","TopSurface":"Smooth","Name":"Door3","Position":"Vector3 -8.5, 5.5, -14.5"},"id":39,"class":"Part","children":[{"a":[],"p":{"CFrame":"CFrame 0, -3.5, 2 r -0, 0, 1.5707963705062866","Name":"Spin3"},"id":40,"class":"Attachment","children":[]}]},{"a":[],"p":{"Massless":true,"Material":"Metal","Size":"Vector3 1, 1, 5","BottomSurface":"Smooth","TopSurface":"Smooth","Name":"Door4","Position":"Vector3 -8.5, 6.5, -14.5"},"id":41,"class":"Part","children":[{"a":[],"p":{"CFrame":"CFrame 0, -4.5, 2 r -0, 0, 1.5707963705062866","Name":"Spin4"},"id":42,"class":"Attachment","children":[]}]}]}]}]}
```

If you want to index instances deep within your model and without having to do a lot of indexing, you can export the model to code, the second returned value from `encodeModel`. This method also prevents line complexity from being a concern.
<details><summary>This example very long, click here to view.</summary>
  
```lua
-- Modei Export v6
local Model = Instance.new("Model")
local Example = Instance.new("Model", Model)
Example.Name = "Example"
local Ground = Instance.new("Part", Example)
Ground.Color = Color3.fromHex("#4b974b")
Ground.Material = Enum.Material.Grass
Ground.Size = Vector3.new(20, 1, 20)
Ground.BottomSurface = Enum.SurfaceType.Smooth
Ground.TopSurface = Enum.SurfaceType.Smooth
Ground.Anchored = true
Ground.Name = "Ground"
Ground.Position = Vector3.new(0, 0.5, -15)
Example.PrimaryPart = Ground
local Wall = Instance.new("Part", Example)
Wall.Material = Enum.Material.Concrete
Wall.Size = Vector3.new(1, 3, 16)
Wall.BottomSurface = Enum.SurfaceType.Smooth
Wall.TopSurface = Enum.SurfaceType.Smooth
Wall.Anchored = true
Wall.Name = "Wall"
Wall.Position = Vector3.new(8.5, 2.5, -15)
local Wedge = Instance.new("Part", Example)
Wedge.Shape = Enum.PartType.Wedge
Wedge.Material = Enum.Material.Concrete
Wedge.Size = Vector3.new(1, 21, 2)
Wedge.BottomSurface = Enum.SurfaceType.Smooth
Wedge.TopSurface = Enum.SurfaceType.Smooth
Wedge.Anchored = true
Wedge.Name = "Wedge"
Wedge.Position = Vector3.new(-4.5, 11.5, -22)
Wedge.Orientation = Vector3.new(0, 180, 0)
local Truss = Instance.new("TrussPart", Example)
Truss.Color = Color3.fromHex("#7a7a7c")
Truss.RightSurface = Enum.SurfaceType.Smooth
Truss.BackSurface = Enum.SurfaceType.Smooth
Truss.LeftSurface = Enum.SurfaceType.Smooth
Truss.Material = Enum.Material.Concrete
Truss.Size = Vector3.new(2, 24, 2)
Truss.FrontSurface = Enum.SurfaceType.Smooth
Truss.BottomSurface = Enum.SurfaceType.Smooth
Truss.TopSurface = Enum.SurfaceType.Smooth
Truss.Anchored = true
Truss.Position = Vector3.new(8.5, 12.5, -20)
local UpperFloor = Instance.new("Part", Example)
UpperFloor.Color = Color3.fromHex("#8a898c")
UpperFloor.Material = Enum.Material.Concrete
UpperFloor.Size = Vector3.new(8, 1, 16)
UpperFloor.BottomSurface = Enum.SurfaceType.Smooth
UpperFloor.TopSurface = Enum.SurfaceType.Smooth
UpperFloor.Anchored = true
UpperFloor.Name = "UpperFloor"
UpperFloor.Position = Vector3.new(-1, 22.5, -15)
local FloorAttachment = Instance.new("Attachment", UpperFloor)
FloorAttachment.CFrame = CFrame.new(1, 0, 2) * CFrame.Angles(0, 0, 0)
FloorAttachment.Name = "FloorAttachment"
local UpperFloor2 = Instance.new("Part", Example)
UpperFloor2.Color = Color3.fromHex("#8a898c")
UpperFloor2.Material = Enum.Material.Concrete
UpperFloor2.Size = Vector3.new(5, 1, 10)
UpperFloor2.BottomSurface = Enum.SurfaceType.Smooth
UpperFloor2.TopSurface = Enum.SurfaceType.Smooth
UpperFloor2.Anchored = true
UpperFloor2.Name = "UpperFloor"
UpperFloor2.Position = Vector3.new(5.5, 22.5, -12)
local BillboardGui = Instance.new("BillboardGui", Example)
BillboardGui.Active = true
BillboardGui.ResetOnSpawn = false
BillboardGui.LightInfluence = 1
BillboardGui.Size = nil --[[{12, 0}, {3, 0} (conversion method missing)]]
BillboardGui.Adornee = UpperFloor
BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
BillboardGui.AlwaysOnTop = true
local TextLabel = Instance.new("TextLabel", BillboardGui)
TextLabel.TextStrokeTransparency = 0
TextLabel.BorderSizePixel = 0
TextLabel.TextScaled = true
TextLabel.BackgroundColor3 = Color3.fromHex("#ffffff")
TextLabel.FontFace = nil --[[Font { Family = rbxasset://fonts/families/SourceSansPro.json, Weight = Regular, Style = Normal } (conversion method missing)]]
TextLabel.Size = nil --[[{1, 0}, {1, 0} (conversion method missing)]]
TextLabel.TextColor3 = Color3.fromHex("#000000")
TextLabel.BorderColor3 = Color3.fromHex("#000000")
TextLabel.Text = "Adornee Test"
TextLabel.BackgroundTransparency = 1
local UIStroke = Instance.new("UIStroke", TextLabel)
UIStroke.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke.Color = Color3.fromHex("#ffffff")
UIStroke.Thickness = 2
local Union = Instance.new("Part", Example)
Union.Color = Color3.fromHex("#8a898c")
Union.Material = Enum.Material.Concrete
Union.Size = Vector3.new(11, 2, 1)
Union.BottomSurface = Enum.SurfaceType.Smooth
Union.TopSurface = Enum.SurfaceType.Smooth
Union.Anchored = true
Union.Name = "Union"
Union.Position = Vector3.new(-3.5, 2, -6.5)
local Light = Instance.new("Part", Example)
Light.Color = Color3.fromHex("#f8f8f8")
Light.Shape = Enum.PartType.Ball
Light.Material = Enum.Material.Neon
Light.Size = Vector3.new(3, 3, 3)
Light.BottomSurface = Enum.SurfaceType.Smooth
Light.TopSurface = Enum.SurfaceType.Smooth
Light.Name = "Light"
Light.Position = Vector3.new(0, 8.5, -13)
local PointLight = Instance.new("PointLight", Light)
PointLight.Shadows = true
PointLight.Brightness = 3
PointLight.Range = 12
local RopeConstraint = Instance.new("RopeConstraint", Light)
RopeConstraint.Visible = true
RopeConstraint.Length = 12
RopeConstraint.Attachment1 = FloorAttachment
local BallAttachment = Instance.new("Attachment", Light)
BallAttachment.Name = "BallAttachment"
RopeConstraint.Attachment0 = BallAttachment
local Wall2 = Instance.new("Part", Example)
Wall2.Material = Enum.Material.Concrete
Wall2.Size = Vector3.new(1, 4, 6)
Wall2.BottomSurface = Enum.SurfaceType.Smooth
Wall2.TopSurface = Enum.SurfaceType.Smooth
Wall2.Anchored = true
Wall2.Name = "Wall"
Wall2.Position = Vector3.new(8.5, 6, -20)
local Wall3 = Instance.new("Part", Example)
Wall3.Material = Enum.Material.Concrete
Wall3.Size = Vector3.new(1, 2, 16)
Wall3.BottomSurface = Enum.SurfaceType.Smooth
Wall3.TopSurface = Enum.SurfaceType.Smooth
Wall3.Anchored = true
Wall3.Name = "Wall"
Wall3.Position = Vector3.new(8.5, 9, -15)
local Wall4 = Instance.new("Part", Example)
Wall4.Material = Enum.Material.Concrete
Wall4.Size = Vector3.new(1, 4, 5)
Wall4.BottomSurface = Enum.SurfaceType.Smooth
Wall4.TopSurface = Enum.SurfaceType.Smooth
Wall4.Anchored = true
Wall4.Name = "Wall"
Wall4.Position = Vector3.new(8.5, 6, -9.5)
local Wall5 = Instance.new("Part", Example)
Wall5.Material = Enum.Material.Concrete
Wall5.Size = Vector3.new(14, 23, 1)
Wall5.BottomSurface = Enum.SurfaceType.Smooth
Wall5.TopSurface = Enum.SurfaceType.Smooth
Wall5.Anchored = true
Wall5.Name = "Wall"
Wall5.Position = Vector3.new(2, 12.5, -23.5)
local Wedge2 = Instance.new("Part", Example)
Wedge2.Shape = Enum.PartType.Wedge
Wedge2.Material = Enum.Material.Concrete
Wedge2.Size = Vector3.new(1, 23, 4)
Wedge2.BottomSurface = Enum.SurfaceType.Smooth
Wedge2.TopSurface = Enum.SurfaceType.Smooth
Wedge2.Anchored = true
Wedge2.Name = "Wedge"
Wedge2.Position = Vector3.new(-7, 12.5, -23.5)
Wedge2.Orientation = Vector3.new(0, 90, 0)
local Wall6 = Instance.new("Part", Example)
Wall6.Material = Enum.Material.Concrete
Wall6.Size = Vector3.new(1, 4, 10)
Wall6.BottomSurface = Enum.SurfaceType.Smooth
Wall6.TopSurface = Enum.SurfaceType.Smooth
Wall6.Anchored = true
Wall6.Name = "Wall"
Wall6.Position = Vector3.new(8.5, 12, -18)
local Wall7 = Instance.new("Part", Example)
Wall7.Material = Enum.Material.Concrete
Wall7.Size = Vector3.new(1, 4, 1)
Wall7.BottomSurface = Enum.SurfaceType.Smooth
Wall7.TopSurface = Enum.SurfaceType.Smooth
Wall7.Anchored = true
Wall7.Name = "Wall"
Wall7.Position = Vector3.new(8.5, 12, -7.5)
local Wall8 = Instance.new("Part", Example)
Wall8.Material = Enum.Material.Concrete
Wall8.Size = Vector3.new(1, 1, 16)
Wall8.BottomSurface = Enum.SurfaceType.Smooth
Wall8.TopSurface = Enum.SurfaceType.Smooth
Wall8.Anchored = true
Wall8.Name = "Wall"
Wall8.Position = Vector3.new(8.5, 14.5, -15)
local Wall9 = Instance.new("Part", Example)
Wall9.Material = Enum.Material.Concrete
Wall9.Size = Vector3.new(1, 4, 1)
Wall9.BottomSurface = Enum.SurfaceType.Smooth
Wall9.TopSurface = Enum.SurfaceType.Smooth
Wall9.Anchored = true
Wall9.Name = "Wall"
Wall9.Position = Vector3.new(8.5, 17, -22.5)
local Wall10 = Instance.new("Part", Example)
Wall10.Material = Enum.Material.Concrete
Wall10.Size = Vector3.new(1, 4, 10)
Wall10.BottomSurface = Enum.SurfaceType.Smooth
Wall10.TopSurface = Enum.SurfaceType.Smooth
Wall10.Anchored = true
Wall10.Name = "Wall"
Wall10.Position = Vector3.new(8.5, 17, -12)
local Wall11 = Instance.new("Part", Example)
Wall11.Material = Enum.Material.Concrete
Wall11.Size = Vector3.new(1, 5, 16)
Wall11.BottomSurface = Enum.SurfaceType.Smooth
Wall11.TopSurface = Enum.SurfaceType.Smooth
Wall11.Anchored = true
Wall11.Name = "Wall"
Wall11.Position = Vector3.new(8.5, 21.5, -15)
local JointTest = Instance.new("Model", Example)
JointTest.Name = "JointTest"
local Door = Instance.new("Part", JointTest)
Door.Massless = true
Door.Material = Enum.Material.Metal
Door.Size = Vector3.new(1, 1, 5)
Door.BottomSurface = Enum.SurfaceType.Smooth
Door.TopSurface = Enum.SurfaceType.Smooth
Door.Name = "Door"
Door.Position = Vector3.new(-8.5, 3.5, -14.5)
local Spin = Instance.new("Attachment", Door)
Spin.CFrame = CFrame.new(0, -1.5, 2) * CFrame.Angles(0, 0, math.pi/2)
Spin.Name = "Spin1"
local Joint = Instance.new("Part", JointTest)
Joint.Color = Color3.fromHex("#635f62")
Joint.Material = Enum.Material.Metal
Joint.Size = Vector3.new(1, 2, 1)
Joint.BottomSurface = Enum.SurfaceType.Smooth
Joint.TopSurface = Enum.SurfaceType.Smooth
Joint.Anchored = true
Joint.Name = "Joint"
Joint.Position = Vector3.new(-8.5, 2, -12.5)
local SpinJoint = Instance.new("Attachment", Joint)
SpinJoint.CFrame = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, math.pi/2)
SpinJoint.Name = "SpinJoint"
local CylindricalConstraint = Instance.new("CylindricalConstraint", Joint)
CylindricalConstraint.Visible = true
CylindricalConstraint.Velocity = 500
CylindricalConstraint.AngularActuatorType = Enum.ActuatorType.Motor
CylindricalConstraint.MotorMaxTorque = 50000
CylindricalConstraint.Attachment0 = SpinJoint
CylindricalConstraint.AngularVelocity = 10
CylindricalConstraint.Attachment1 = Spin
CylindricalConstraint.MotorMaxForce = 500
local CylindricalConstraint2 = Instance.new("CylindricalConstraint", Joint)
CylindricalConstraint2.Visible = true
CylindricalConstraint2.Velocity = 500
CylindricalConstraint2.AngularActuatorType = Enum.ActuatorType.Motor
CylindricalConstraint2.MotorMaxTorque = 50000
CylindricalConstraint2.Attachment0 = SpinJoint
CylindricalConstraint2.AngularVelocity = 8
CylindricalConstraint2.MotorMaxForce = 500
local CylindricalConstraint3 = Instance.new("CylindricalConstraint", Joint)
CylindricalConstraint3.Visible = true
CylindricalConstraint3.Velocity = 500
CylindricalConstraint3.AngularActuatorType = Enum.ActuatorType.Motor
CylindricalConstraint3.MotorMaxTorque = 50000
CylindricalConstraint3.Attachment0 = SpinJoint
CylindricalConstraint3.AngularVelocity = 6
CylindricalConstraint3.MotorMaxForce = 500
local CylindricalConstraint4 = Instance.new("CylindricalConstraint", Joint)
CylindricalConstraint4.Visible = true
CylindricalConstraint4.Velocity = 500
CylindricalConstraint4.AngularActuatorType = Enum.ActuatorType.Motor
CylindricalConstraint4.MotorMaxTorque = 50000
CylindricalConstraint4.Attachment0 = SpinJoint
CylindricalConstraint4.AngularVelocity = 4
CylindricalConstraint4.MotorMaxForce = 500
local Door = Instance.new("Part", JointTest)
Door.Massless = true
Door.Material = Enum.Material.Metal
Door.Size = Vector3.new(1, 1, 5)
Door.BottomSurface = Enum.SurfaceType.Smooth
Door.TopSurface = Enum.SurfaceType.Smooth
Door.Name = "Door2"
Door.Position = Vector3.new(-8.5, 4.5, -14.5)
local Spin = Instance.new("Attachment", Door)
Spin.CFrame = CFrame.new(0, -2.5, 2) * CFrame.Angles(0, 0, math.pi/2)
Spin.Name = "Spin2"
CylindricalConstraint2.Attachment1 = Spin
local Door = Instance.new("Part", JointTest)
Door.Massless = true
Door.Material = Enum.Material.Metal
Door.Size = Vector3.new(1, 1, 5)
Door.BottomSurface = Enum.SurfaceType.Smooth
Door.TopSurface = Enum.SurfaceType.Smooth
Door.Name = "Door3"
Door.Position = Vector3.new(-8.5, 5.5, -14.5)
local Spin = Instance.new("Attachment", Door)
Spin.CFrame = CFrame.new(0, -3.5, 2) * CFrame.Angles(0, 0, math.pi/2)
Spin.Name = "Spin3"
CylindricalConstraint3.Attachment1 = Spin
local Door = Instance.new("Part", JointTest)
Door.Massless = true
Door.Material = Enum.Material.Metal
Door.Size = Vector3.new(1, 1, 5)
Door.BottomSurface = Enum.SurfaceType.Smooth
Door.TopSurface = Enum.SurfaceType.Smooth
Door.Name = "Door4"
Door.Position = Vector3.new(-8.5, 6.5, -14.5)
local Spin = Instance.new("Attachment", Door)
Spin.CFrame = CFrame.new(0, -4.5, 2) * CFrame.Angles(0, 0, math.pi/2)
Spin.Name = "Spin4"
CylindricalConstraint4.Attachment1 = Spin

```
</details>

## Part of my export is missing!
Roblox clamps most strings which are too long. You can paste the `encodeModel` function right above the following snippet and run the result in the command bar of your Studio to get the full export of whatever instance you select.
```lua
-- V6
local getCodeGeneration = false -- declare as 'true' to instead get the code-equivalent of the model.
local SES = game:GetService("ScriptEditorService")
local m = game:GetService("Selection"):Get()[1]
local doc = Instance.new("LocalScript")
doc.Name = "ModeiExportJSON"
SES:UpdateSourceAsync(doc, function() return ({encodeModel(m, true)})[getCodeGeneration and 2 or 1] end)
doc.Parent = m
SES:OpenScriptDocumentAsync(doc)
SES.TextDocumentDidClose:Wait()
doc:Destroy()
```

If you want to easily import models, just use this snippet right below the `decodeModel` function. It'll request for the JSON data representing the model.
```lua
local SES = game:GetService("ScriptEditorService")
local input = Instance.new("LocalScript", workspace)
input.Name = "ModeiImportJSON"
SES:OpenScriptDocumentAsync(input)
SES.TextDocumentDidClose:Wait()
local d = decodeModel(SES:GetEditorSource(input))
input:Destroy()
d.errors:print()
d.model.Parent = workspace
```

## I wish to export models containing Scripts/LocalScripts!
ModEi does support script creation, but it can _only_ export scripts in the model within Studio and while editing. Attempting to export scripts while playing will result in empty scripts.

Also, you will need to make sure the environment you want to use the export in supports NS and NLS. If it does not, you will need to support it yourself, whether it be a module you've inserted in your game or a `require()` you've uploaded to the Roblox Developer Marketplace.

## Some of the instance classes/properties I use aren't supported!
You may create an issue to request that classes and properties are supported. However, not all classes/properties can be supported. Please refrain from requesting support for these classes unless you have a method to work around their restrictions.
- [**UnionOperation**](https://create.roblox.com/docs/reference/engine/classes/UnionOperation) : Cannot be deconstructed via scripts. If you _really_ need Unions, you should separate your unions into individual parts and unionize them after they are imported into your script.
- [**SurfaceAppearance**](https://create.roblox.com/docs/reference/engine/classes/SurfaceAppearance) : Cannot be modified by scripts.
