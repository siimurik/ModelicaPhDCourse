within TrainingPack.Day2.CoolingSystem.Experiments;
model Experiment1
    .Buildings.ThermalZones.ISO13790.Zone5R1C.ZoneHVAC zonHVAC(AFlo = 48,VRoo = 129.6,surTil = {1.57079632679489499834,1.57079632679489499834,1.57079632679489499834,1.57079632679489499834},surAzi = {3.14159265358978999667,-1.57079632679489499834,0,1.57079632679489499834},redeclare replaceable .Buildings.ThermalZones.ISO13790.Data.Medium buiMas,airRat = 0.4,UWal = 0.2,URoo = 0.15,UFlo = 0.1,gFac = 0.6,UWin = 1.8,AWin = {0,0,10,0},ARoo = 48,AWal = {21.6,16.2,11.6,16.2},winFra = 0.01,redeclare package Medium = Buildings.Media.Air) annotation(Placement(transformation(extent = {{14.33,-10.64},{42.33,17.36}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Constant latGai(k = 0) annotation(Placement(transformation(extent = {{-60.55,-40.09},{-40.55,-20.09}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam = Modelica.Utilities.Files.loadResource("modelica://Buildings/Resources/weatherdata/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos")) annotation(Placement(transformation(extent = {{-59.83,55.3},{-39.83,75.3}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Constant senGai(k = 480) annotation(Placement(transformation(extent = {{-60.36,-0.13},{-40.36,19.87}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(latGai.y,zonHVAC.intLatGai) annotation(Line(points = {{-39.55,-30.09},{-13.11,-30.09},{-13.11,7.36},{12.33,7.36}},color = {0,0,127}));
    connect(senGai.y,zonHVAC.intSenGai) annotation(Line(points = {{-39.36,9.87},{-23.74,9.87},{-23.74,19.9},{12.33,19.9},{12.33,13.36}},color = {0,0,127}));
    connect(weaDat.weaBus,zonHVAC.weaBus) annotation(Line(points = {{-39.83,65.3},{38.33,65.3},{38.33,14.36}},color = {255,204,51}));
    connect(zonHVAC.heaPorSur,zonHVAC.heaPorAir) annotation(Line(points = {{32.33,3.36},{38.33,3.36},{38.33,17.36},{32.33,17.36},{32.33,11.36}},color = {191,0,0}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end Experiment1;
