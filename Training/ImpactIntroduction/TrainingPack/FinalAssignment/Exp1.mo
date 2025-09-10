within TrainingPack.FinalAssignment;
model Exp1
    .Buildings.ThermalZones.ISO13790.Zone5R1C.ZoneHVAC zonHVAC(AFlo = 120,VRoo = 360,surTil = {1.57079632679489499834,1.57079632679489499834,1.57079632679489499834,1.57079632679489499834},surAzi = {3.14159265358978999667,-1.57079632679489499834,0,1.57079632679489499834},airRat = 0.4,AWin = {0.0,6.0,12.0,0.0},UWin = 0.9,winFra = 0.01,gFac = 0.5,AWal = {36.0,24.0,24.0,30.0},ARoo = 120,UWal = 0.25,URoo = 0.15,UFlo = 0.11,redeclare replaceable .Buildings.ThermalZones.ISO13790.Data.Medium buiMas,redeclare package Medium = Buildings.Media.Air) annotation(Placement(transformation(extent = {{34.74,-14.22},{62.74,13.78}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Constant latGai(k = 0) annotation(Placement(transformation(extent = {{-45.5,-46.72},{-25.5,-26.72}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam = Modelica.Utilities.Files.loadResource("modelica://Buildings/Resources/weatherdata/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos")) annotation(Placement(transformation(extent = {{-39.57,59.68},{-19.57,79.68}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.CombiTimeTable senGai(table = [0,600;8 * 3600,240;18 * 3600,600;24 * 3600,600],smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments,extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic) annotation(Placement(transformation(extent = {{-44.66,-10.14},{-24.66,9.86}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(senGai.y[1],zonHVAC.intSenGai) annotation(Line(points = {{-23.66,-0.14},{4.65,-0.14},{4.65,9.78},{32.74,9.78}},color = {0,0,127}));
    connect(latGai.y,zonHVAC.intLatGai) annotation(Line(points = {{-24.5,-36.72},{11.28,-36.72},{11.28,3.78},{32.74,3.78}},color = {0,0,127}));
    connect(weaDat.weaBus,zonHVAC.weaBus) annotation(Line(points = {{-19.57,69.68},{58.74,69.68},{58.74,10.78}},color = {255,204,51}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end Exp1;
