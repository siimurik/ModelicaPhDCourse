within TrainingPack.Day2.SimpleHouse.Components;
model Radiator
    .Modelica.Fluid.Interfaces.FluidPort_a port_supply(redeclare replaceable package Medium = .Buildings.Media.Water) annotation(Placement(transformation(extent = {{-110,-10},{-90,10}},origin = {0,0},rotation = 0)));
    .Modelica.Fluid.Interfaces.FluidPort_b port_return(redeclare replaceable package Medium = .Buildings.Media.Water) annotation(Placement(transformation(extent = {{88,-10},{108,10}},origin = {0,0},rotation = 0)));
    .Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_house annotation(Placement(transformation(extent = {{-10.0,90.0},{10.0,110.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Constant returnWatTemp(k = 273.15 + 40) annotation(Placement(transformation(extent = {{-70.0,24.0},{-50.0,44.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Math.Gain gain(k = -1) annotation(Placement(transformation(extent = {{-8.0,50.0},{12.0,70.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heatToHouse annotation(Placement(transformation(extent = {{32,30},{52,50}},origin = {0,0},rotation = 0)));
    .Buildings.Fluid.HeatExchangers.SensibleCooler_T rad(redeclare package Medium = Buildings.Media.Water,QMin_flow = -230,m_flow_nominal = 0.0027,dp_nominal = 0) annotation(Placement(transformation(extent = {{-10.0,-10.0},{10.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(gain.y,heatToHouse.Q_flow) annotation(Line(points = {{13,60},{22.5,60},{22.5,40},{32,40}},color = {0,0,127}));
    connect(heatToHouse.port,port_house) annotation(Line(points = {{52,40},{58,40},{58,80},{0,80},{0,100}},color = {191,0,0}));
    connect(rad.Q_flow,gain.u) annotation(Line(points = {{11,8},{17,8},{17,34},{-14,34},{-14,60},{-10,60}},color = {0,0,127}));
    connect(returnWatTemp.y,rad.TSet) annotation(Line(points = {{-49,34},{-26,34},{-26,8},{-12,8}},color = {0,0,127}));
    connect(rad.port_a,port_supply) annotation(Line(points = {{-10,0},{-100,0}},color = {0,127,255}));
    connect(rad.port_b,port_return) annotation(Line(points = {{10,0},{98,0}},color = {0,127,255}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name"),Bitmap(fileName="modelica://TrainingPack/Resources/160693.png",origin={0,4},extent={{-95.14340098318173,-98.35032259869095},{95,99}})}));
end Radiator;
