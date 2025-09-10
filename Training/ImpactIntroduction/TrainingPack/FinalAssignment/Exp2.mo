within TrainingPack.FinalAssignment;

model Exp2
    .Buildings.ThermalZones.ISO13790.Zone5R1C.ZoneHVAC zonHVAC(AFlo = 120,VRoo = 360,surTil = {1.57079632679489499834,1.57079632679489499834,1.57079632679489499834,1.57079632679489499834},surAzi = {3.14159265358978999667,-1.57079632679489499834,0,1.57079632679489499834},airRat = 0.4,AWin = {0.0,6.0,12.0,0.0},UWin = 0.9,winFra = 0.01,gFac = 0.5,AWal = {36.0,24.0,24.0,30.0},ARoo = 120,UWal = 0.25,URoo = 0.15,UFlo = 0.11,redeclare replaceable .Buildings.ThermalZones.ISO13790.Data.Medium buiMas,redeclare package Medium = Buildings.Media.Air,nPorts = 2) annotation(Placement(transformation(extent = {{63.3,-37.67},{91.3,-9.67}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Constant latGai(k = 0) annotation(Placement(transformation(extent = {{25.16,7.27},{45.16,27.27}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam = .Modelica.Utilities.Files.loadResource("modelica://Buildings/Resources/weatherdata/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos")) annotation(Placement(transformation(extent = {{-86.55,69.84},{-66.55,89.84}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.CombiTimeTable senGai(table = [0,600;8 * 3600,240;18 * 3600,600;24 * 3600,600],smoothness = .Modelica.Blocks.Types.Smoothness.ConstantSegments,extrapolation = .Modelica.Blocks.Types.Extrapolation.Periodic) annotation(Placement(transformation(extent = {{30.03,35.0},{50.03,55.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.Sources.Outside out(redeclare package Medium = Buildings.Media.Air,nPorts = 2) annotation(Placement(transformation(extent = {{-82.58,-7.99},{-62.58,12.01}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.Movers.FlowControlled_m_flow fan(m_flow_nominal = 0.1,addPowerToMedium = false,redeclare package Medium = Buildings.Media.Air) annotation(Placement(transformation(extent = {{-11.93,2.65},{8.07,22.65}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Constant airFlow(k = 0.05) annotation(Placement(transformation(extent = {{-48.86,24.72},{-28.86,44.72}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(senGai.y[1],zonHVAC.intSenGai) annotation(Line(points = {{51.03,45},{55.95,45},{55.95,-13.67},{61.3,-13.67}},color = {0,0,127}));
    connect(latGai.y,zonHVAC.intLatGai) annotation(Line(points = {{46.16,17.27},{51.1,17.27},{51.1,-19.67},{61.3,-19.67}},color = {0,0,127}));
    connect(weaDat.weaBus,zonHVAC.weaBus) annotation(Line(points = {{-66.55,79.84},{87.3,79.84},{87.3,-12.67}},color = {255,204,51}));
    connect(out.ports[1],fan.port_a) annotation(Line(points = {{-62.58,2.01},{-44.75,2.01},{-44.75,12.65},{-11.93,12.65}},color = {0,127,255}));
    connect(airFlow.y,fan.m_flow_in) annotation(Line(points = {{-27.86,34.72},{-1.93,34.72},{-1.93,24.65}},color = {0,0,127}));
    connect(out.weaBus,weaDat.weaBus) annotation(Line(points = {{-82.58,2.21},{-88.58,2.21},{-88.58,35.95},{-59.17,35.95},{-59.17,79.84},{-66.55,79.84}},color = {255,204,51}));
    connect(fan.port_b,zonHVAC.ports[1]) annotation(Line(points = {{8.07,12.65},{19.92,12.65},{19.92,-31.87},{64.3,-31.87}},color = {0,127,255}));
    connect(out.ports[2],zonHVAC.ports[2]) annotation(Line(points = {{-62.58,2.01},{-44.78,2.01},{-44.78,-31.87},{64.3,-31.87}},color = {0,127,255}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end Exp2;
