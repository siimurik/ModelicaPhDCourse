within TrainingPack.Day2.CoolingSystem.Experiments;

model Experiment2
    .Buildings.ThermalZones.ISO13790.Zone5R1C.ZoneHVAC zonHVAC(AFlo = 48,VRoo = 129.6,surTil = {1.57079632679489499834,1.57079632679489499834,1.57079632679489499834,1.57079632679489499834},surAzi = {3.14159265358978999667,-1.57079632679489499834,0,1.57079632679489499834},redeclare replaceable .Buildings.ThermalZones.ISO13790.Data.Medium buiMas,airRat = 0.4,UWal = 0.2,URoo = 0.15,UFlo = 0.1,gFac = 0.6,UWin = 1.8,AWin = {0,0,10,0},ARoo = 48,AWal = {21.6,16.2,11.6,16.2},winFra = 0.01,redeclare package Medium = Buildings.Media.Air,nPorts = 2) annotation(Placement(transformation(extent = {{54.86,-11.62},{82.86,16.38}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Constant latGai(k = 0) annotation(Placement(transformation(extent = {{10.79,-91.97},{30.79,-71.97}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam = .Modelica.Utilities.Files.loadResource("modelica://Buildings/Resources/weatherdata/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos")) annotation(Placement(transformation(extent = {{-96.71,70.3},{-76.71,90.3}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Constant senGai(k = 480) annotation(Placement(transformation(extent = {{6.92,-56.87},{26.92,-36.87}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.Movers.FlowControlled_m_flow fan(redeclare package Medium = Buildings.Media.Air,addPowerToMedium = false,m_flow_nominal = 0.1) annotation(Placement(transformation(extent = {{-9.95,-1.41},{10.05,18.59}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Constant airFlow(k = 0.1) annotation(Placement(transformation(extent = {{-46.88,20.66},{-26.88,40.66}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.Sources.Outside out(nPorts = 2,redeclare package Medium = Buildings.Media.Air) annotation(Placement(transformation(extent = {{-80.6,-12.05},{-60.6,7.95}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(latGai.y,zonHVAC.intLatGai) annotation(Line(points = {{31.79,-81.97},{46.38,-81.97},{46.38,6.38},{52.86,6.38}},color = {0,0,127}));
    connect(senGai.y,zonHVAC.intSenGai) annotation(Line(points = {{27.92,-46.87},{38.67,-46.87},{38.67,12.38},{52.86,12.38}},color = {0,0,127}));
    connect(weaDat.weaBus,zonHVAC.weaBus) annotation(Line(points = {{-76.71,80.3},{78.86,80.3},{78.86,13.38}},color = {255,204,51}));
    connect(zonHVAC.heaPorSur,zonHVAC.heaPorAir) annotation(Line(points = {{72.86,2.38},{78.86,2.38},{78.86,16.38},{72.86,16.38},{72.86,10.38}},color = {191,0,0}));
    connect(weaDat.weaBus,out.weaBus) annotation(Line(points = {{-76.71,80.3},{-65.85,80.3},{-65.85,32.13},{-88.63,32.13},{-88.63,-1.85},{-80.6,-1.85}},color = {255,204,51}));
    connect(out.ports[2],zonHVAC.ports[2]) annotation(Line(points = {{-60.6,-2.05},{-60.6,-21.51},{18.17,-21.51},{18.17,-5.82},{55.86,-5.82}},color = {0,127,255}));
    connect(airFlow.y,fan.m_flow_in) annotation(Line(points = {{-25.88,30.66},{0.05,30.66},{0.05,20.59}},color = {0,0,127}));
    connect(fan.port_b,zonHVAC.ports[1]) annotation(Line(points = {{10.05,8.59},{32.96,8.59},{32.96,-5.82},{55.86,-5.82}},color = {0,127,255}));
    connect(out.ports[1],fan.port_a) annotation(Line(points = {{-60.6,-2.05},{-42.77,-2.05},{-42.77,8.59},{-9.95,8.59}},color = {0,127,255}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end Experiment2;
