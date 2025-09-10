within TrainingPack.Day2.SimpleHouse.Experiments;

model Experiment3
    .Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation(Placement(transformation(extent = {{-34.0,36.0},{-14.0,56.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Sine OutAirT(offset = 273.15,phase = -1.57079632679489499834,f = 1 / 86400,amplitude = 5) annotation(Placement(transformation(extent = {{-88.0,68.0},{-68.0,88.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Sine sine(amplitude = 100,f = 1 / 86400,phase = -1.57079632679489499834) annotation(Placement(transformation(extent = {{-88.67,8.0},{-68.67,28.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Constant const(k = 0) annotation(Placement(transformation(extent = {{-88.67,-32.0},{-68.67,-12.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Math.Max solRad annotation(Placement(transformation(extent = {{-44.67,-12.0},{-24.67,8.0}},origin = {0.0,0.0},rotation = 0.0)));
    .TrainingPack.Day2.SimpleHouse.Components.Radiator radiator annotation(Placement(transformation(extent = {{-2.0,-52.0},{18.0,-32.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Constant watFlow(k = 0.027) annotation(Placement(transformation(extent = {{-90,-70},{-70,-50}},origin = {0,0},rotation = 0)));
    .Buildings.Fluid.Sources.MassFlowSource_T watSource(nPorts = 1,use_m_flow_in = true,redeclare package Medium = .Buildings.Media.Water,T = 333.15) annotation(Placement(transformation(extent = {{-48.0,-69.74},{-28.0,-49.74}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.Sources.Boundary_pT watSink(nPorts = 1,redeclare package Medium = .Buildings.Media.Water) annotation(Placement(transformation(extent = {{98.0,-72.0},{78.0,-52.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.Sensors.TemperatureTwoPort senTem(redeclare package Medium = .Buildings.Media.Water,m_flow_nominal = 0.027) annotation(Placement(transformation(extent = {{40.0,-70.0},{60.0,-50.0}},origin = {0.0,0.0},rotation = 0.0)));
    .TrainingPack.Day2.SimpleHouse.Building.HouseWallWinRad houseWallWinRad annotation(Placement(transformation(extent = {{27.82,11.82},{88.18,72.18}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(OutAirT.y,prescribedTemperature.T) annotation(Line(points = {{-67,78},{-56,78},{-56,46},{-36,46}},color = {0,0,127}));
    connect(senTem.port_a,radiator.port_return) annotation(Line(points = {{40,-60},{28,-60},{28,-42},{17.8,-42}},color = {0,127,255}));
    connect(prescribedTemperature.port,houseWallWinRad.outside) annotation(Line(points = {{-14,46},{6.845000000000001,46},{6.845000000000001,47.83},{27.69,47.83}},color = {191,0,0}));
    connect(radiator.port_house,houseWallWinRad.rad) annotation(Line(points = {{8,-32},{8,-19.09},{79.73,-19.09},{79.73,11.82}},color = {191,0,0}));
    connect(senTem.port_b,watSink.ports[1]) annotation(Line(points = {{60,-60},{69,-60},{69,-62},{78,-62}},color = {0,127,255}));
    connect(radiator.port_supply,watSource.ports[1]) annotation(Line(points = {{-2,-42},{-14,-42},{-14,-59.74},{-28,-59.74}},color = {0,127,255}));
    connect(watFlow.y,watSource.m_flow_in) annotation(Line(points = {{-69,-60},{-63,-60},{-63,-46},{-50,-46},{-50,-51.74}},color = {0,0,127}));
    connect(sine.y,solRad.u1) annotation(Line(points = {{-67.66,18},{-57.16,18},{-57.16,4},{-46.66,4}},color = {0,0,127}));
    connect(const.y,solRad.u2) annotation(Line(points = {{-67.66,-22},{-57.16,-22},{-57.16,-8},{-46.66,-8}},color = {0,0,127}));
    connect(solRad.y,houseWallWinRad.u) annotation(Line(points = {{-23.67,-2},{-1.0100000000000016,-2},{-1.0100000000000016,29.73},{21.65,29.73}},color = {0,0,127}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end Experiment3;
