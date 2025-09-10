within TrainingPack.Day2.SimpleHouse.Experiments;
model Experiment2
    .Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation(Placement(transformation(extent = {{-4.0,30.0},{16.0,50.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Sine OutAirT(offset = 273.15,phase = -1.57079632679489499834,f = 1 / 86400,amplitude = 5) annotation(Placement(transformation(extent = {{-60.0,30.0},{-40.0,50.0}},origin = {0.0,0.0},rotation = 0.0)));
    .TrainingPack.Day2.SimpleHouse.Building.HouseWallWin houseWallWin annotation(Placement(transformation(extent = {{41.68,15.91},{90.32,64.55}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Sine sine(amplitude = 100,f = 1 / 86400,phase = -1.57079632679489499834) annotation(Placement(transformation(extent = {{-80.0,-30.0},{-60.0,-10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(transformation(extent = {{-80.0,-70.0},{-60.0,-50.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Math.Max solRad annotation(Placement(transformation(extent = {{-36.0,-50.0},{-16.0,-30.0}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(OutAirT.y,prescribedTemperature.T) annotation(Line(points = {{-39,40},{-6,40}},color = {0,0,127}));
    connect(prescribedTemperature.port,houseWallWin.outside) annotation(Line(points = {{16,40},{41.68,40},{41.68,40.23}},color = {191,0,0}));
    connect(sine.y,solRad.u1) annotation(Line(points = {{-59,-20},{-48.5,-20},{-48.5,-34},{-38,-34}},color = {0,0,127}));
    connect(const.y,solRad.u2) annotation(Line(points = {{-59,-60},{-48.5,-60},{-48.5,-46},{-38,-46}},color = {0,0,127}));
    connect(solRad.y,houseWallWin.u) annotation(Line(points = {{-15,-40},{10.91,-40},{10.91,25.64},{36.82,25.64}},color = {0,0,127}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end Experiment2;
