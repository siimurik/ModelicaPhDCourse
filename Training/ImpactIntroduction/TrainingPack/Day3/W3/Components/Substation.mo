within TrainingPack.Day3.W3.Components;
model Substation
    .Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare replaceable package Medium = .Buildings.Media.Water) annotation(Placement(transformation(extent = {{-110.58,30.27},{-90.58,50.27}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare replaceable package Medium = .Buildings.Media.Water) annotation(Placement(transformation(extent = {{-109.86,-50.35},{-89.86,-30.35}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.HeatExchangers.SensibleCooler_T hex(dp_nominal = 100,redeclare package Medium = Buildings.Media.Water,m_flow_nominal = m_flow_nom) annotation(Placement(transformation(extent = {{-10.0,-10.0},{10.0,10.0}},origin = {36.96,0.46000000000000085},rotation = -90.0)));
    .Buildings.Fluid.Sensors.TemperatureTwoPort supTem(redeclare package Medium = Buildings.Media.Water,m_flow_nominal = m_flow_nom) annotation(Placement(transformation(extent = {{-59.86,30.24},{-39.86,50.24}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.Sensors.TemperatureTwoPort retTem(redeclare package Medium = Buildings.Media.Water,m_flow_nominal = m_flow_nom) annotation(Placement(transformation(extent = {{-59.82,-50.14},{-39.82,-30.14}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.Movers.Preconfigured.FlowControlled_m_flow mov(redeclare package Medium = Buildings.Media.Water,m_flow_nominal = m_flow_nom) annotation(Placement(transformation(extent = {{-2.92,50.24},{17.08,30.24}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.RealExpression realExpression(y = deltaT * 4182.0) annotation(Placement(transformation(extent = {{31.02,58.76},{51.02,78.76}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Math.Division m_flow annotation(Placement(transformation(extent = {{-10.0,-10.0},{10.0,10.0}},origin = {70.4,30.07},rotation = -90.0)));
    .Modelica.Blocks.Math.Add retSet(k2 = -1) annotation(Placement(transformation(extent = {{39.52,-79.98},{59.52,-59.98}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Constant deltaTem(k = deltaT) annotation(Placement(transformation(extent = {{-9.11,-94.72},{10.89,-74.72}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Interfaces.RealInput heaDem annotation(Placement(transformation(extent = {{-20.0,-20.0},{20.0,20.0}},origin = {-40.27,120.06},rotation = -90.0)));
    parameter Real deltaT = 20;
    parameter Real m_flow_nom = 0.04;
equation
    connect(supTem.port_a,port_a) annotation(Line(points = {{-59.86,40.24},{-74.94,40.24},{-74.94,40.27},{-100.58,40.27}},color = {0,127,255}));
    connect(retTem.port_a,port_b) annotation(Line(points = {{-59.82,-40.14},{-99.86,-40.14},{-99.86,-40.35}},color = {0,127,255}));
    connect(realExpression.y,m_flow.u2) annotation(Line(points = {{52.02,68.76},{64.4,68.76},{64.4,42.07}},color = {0,0,127}));
    connect(m_flow.y,mov.m_flow_in) annotation(Line(points = {{70.4,19.07},{70.4,7.75},{84.84,7.75},{84.84,-29.11},{7.08,-29.11},{7.08,28.24}},color = {0,0,127}));
    connect(supTem.T,retSet.u1) annotation(Line(points = {{-49.86,51.24},{-49.86,57.24},{-73.41,57.24},{-73.41,-63.98},{37.52,-63.98}},color = {0,0,127}));
    connect(deltaTem.y,retSet.u2) annotation(Line(points = {{11.89,-84.72},{29.17,-84.72},{29.17,-75.98},{37.52,-75.98}},color = {0,0,127}));
    connect(hex.port_a,mov.port_b) annotation(Line(points = {{36.96,10.46},{36.96,40.24},{17.08,40.24}},color = {0,127,255}));
    connect(hex.port_b,retTem.port_b) annotation(Line(points = {{36.96,-9.54},{36.96,-40.14},{-39.82,-40.14}},color = {0,127,255}));
    connect(hex.TSet,retSet.y) annotation(Line(points = {{44.96,12.46},{67.51,12.46},{67.51,-69.98},{60.52,-69.98}},color = {0,0,127}));
    connect(m_flow.u1,heaDem) annotation(Line(points = {{76.4,42.07},{76.4,81.065},{-40.27,81.065},{-40.27,120.06}},color = {0,0,127}));
    connect(supTem.port_b,mov.port_a) annotation(Line(points = {{-39.86,40.24},{-2.92,40.24}},color = {0,127,255}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name"),Ellipse(origin={2,0},extent={{-94,96},{94,-96}},fillPattern=FillPattern.Sphere,fillColor={255,255,255}),Ellipse(extent={{-57.719996574378015,56.87567562747631},{57,-56}},fillPattern=FillPattern.Sphere,fillColor={83,83,83},origin={2,0})}));
end Substation;
