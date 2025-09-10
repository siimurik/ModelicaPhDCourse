within TrainingPack.Day2.SimpleHouse.Experiments;

model Experiment4
    .Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation(Placement(transformation(extent = {{-34.0,38.0},{-14.0,58.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Sine OutAirT(offset = 273.15,phase = -1.57079632679489499834,f = 1 / 86400,amplitude = 5) annotation(Placement(transformation(extent = {{-88.0,68.0},{-68.0,88.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Sine sine(amplitude = 100,f = 1 / 86400,phase = -1.57079632679489499834) annotation(Placement(transformation(extent = {{-90.67,22.0},{-70.67,42.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(transformation(extent = {{-90.67,-18.0},{-70.67,2.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Math.Max solRad annotation(Placement(transformation(extent = {{-46.67,2.0},{-26.67,22.0}},origin = {0.0,0.0},rotation = 0.0)));
    .TrainingPack.Day2.SimpleHouse.Components.Radiator radiator annotation(Placement(transformation(extent = {{3.0,-98.0},{23.0,-78.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.Sources.MassFlowSource_T watSource(nPorts = 1,use_m_flow_in = true,redeclare package Medium = .Buildings.Media.Water,T = 333.15) annotation(Placement(transformation(extent = {{-31.0,-98.0},{-11.0,-78.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.Sources.Boundary_pT watSink(nPorts = 1,redeclare package Medium = .Buildings.Media.Water) annotation(Placement(transformation(extent = {{96.62,-98.0},{76.62,-78.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.Sensors.TemperatureTwoPort senTem(redeclare package Medium = .Buildings.Media.Water,m_flow_nominal = 0.027) annotation(Placement(transformation(extent = {{43.0,-98.0},{63.0,-78.0}},origin = {0.0,0.0},rotation = 0.0)));
    .TrainingPack.Day2.SimpleHouse.Building.HouseWallWinRad houseWallWinRad annotation(Placement(transformation(extent = {{21.24,12.09},{81.6,72.45}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Controls.OBC.CDL.Conversions.BooleanToReal mWat_flow(realTrue = 0.0,realFalse = 0.0027) annotation(Placement(transformation(extent = {{-32.0,-60.0},{-12.0,-40.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Controls.OBC.CDL.Reals.Hysteresis hys(uLow = 273.15 + 19,uHigh = 273.15 + 21) annotation(Placement(transformation(extent = {{-74.0,-60.0},{-54.0,-40.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation(Placement(transformation(extent = {{12.0,-28.0},{-8.0,-8.0}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(OutAirT.y,prescribedTemperature.T) annotation(Line(points = {{-67,78},{-56,78},{-56,48},{-36,48}},color = {0,0,127}));
    connect(senTem.port_a,radiator.port_return) annotation(Line(points = {{43,-88},{22.8,-88}},color = {0,127,255}));
    connect(prescribedTemperature.port,houseWallWinRad.outside) annotation(Line(points = {{-14,48},{6.85,48},{6.85,48.11},{21.11,48.11}},color = {191,0,0}));
    connect(radiator.port_house,houseWallWinRad.rad) annotation(Line(points = {{13,-78},{13,-50},{36,-50},{36,-19.09},{73.15,-19.09},{73.15,12.09}},color = {191,0,0}));
    connect(senTem.port_b,watSink.ports[1]) annotation(Line(points = {{63,-88},{76.62,-88}},color = {0,127,255}));
    connect(radiator.port_supply,watSource.ports[1]) annotation(Line(points = {{3,-88},{-11,-88}},color = {0,127,255}));
    connect(sine.y,solRad.u1) annotation(Line(points = {{-69.65,32},{-59.15,32},{-59.15,18},{-48.65,18}},color = {0,0,127}));
    connect(const.y,solRad.u2) annotation(Line(points = {{-69.65,-8},{-59.15,-8},{-59.15,6},{-48.65,6}},color = {0,0,127}));
    connect(solRad.y,houseWallWinRad.u) annotation(Line(points = {{-25.67,12},{-1.01,12},{-1.01,30},{15.08,30}},color = {0,0,127}));
    connect(hys.u,temperatureSensor.T) annotation(Line(points = {{-76,-50},{-88,-50},{-88,-28},{-34,-28},{-34,-18},{-9,-18}},color = {0,0,127}));
    connect(temperatureSensor.port,houseWallWinRad.rad) annotation(Line(points = {{12,-18},{73.15,-18},{73.15,12.09}},color = {191,0,0}));
    connect(mWat_flow.y,watSource.m_flow_in) annotation(Line(points = {{-10,-50},{0,-50},{0,-65.83},{-51.93,-65.83},{-51.93,-80},{-33,-80}},color = {0,0,127}));
    connect(hys.y,mWat_flow.u) annotation(Line(points = {{-52,-50},{-34,-50}},color = {255,0,255}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end Experiment4;
