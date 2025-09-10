within TrainingPack.Day3.W3.Experiments;

model Experiment3
    .TrainingPack.Day3.W3.Components.HeatingDemand heatingDemand(nBui = 1) annotation(Placement(transformation(extent = {{-27.56,50.5},{-7.56,70.5}},origin = {0.0,0.0},rotation = 0.0)));
    .TrainingPack.Day3.W3.Components.Substation substation(deltaT = 20,m_flow_nom = 0.04) annotation(Placement(transformation(extent = {{-10.0,-10.0},{10.0,10.0}},origin = {56.599999999999994,26.4},rotation = 90.0)));
    .Buildings.Fluid.HeatExchangers.Heater_T hea(dp_nominal = 100,redeclare package Medium = .Buildings.Media.Water,m_flow_nominal = 0.04) annotation(Placement(transformation(extent = {{-31.73,-20.46},{-11.73,-0.46}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.Sources.Boundary_pT bou(nPorts = 1,redeclare package Medium = .Buildings.Media.Water) annotation(Placement(transformation(extent = {{-71.57,-84.08},{-51.57,-64.08}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.FixedResistances.PlugFlowPipe plugFlowPipe(redeclare replaceable package Medium = Buildings.Media.Water,m_flow_nominal = 0.05,length = 20,dIns = 0.2,kIns = 0.04,v_nominal = 0.15) annotation(Placement(transformation(extent = {{10.18,-20.27},{30.18,-0.27}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.FixedResistances.PlugFlowPipe plugFlowPipe2(redeclare replaceable package Medium = Buildings.Media.Water,m_flow_nominal = 0.05,v_nominal = 0.15,length = 20,dIns = 0.2,kIns = 0.04) annotation(Placement(transformation(extent = {{32.76,-60.58},{12.76,-40.58}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.HeatTransfer.Sources.FixedTemperature preTem(T = 273.15 + 15) annotation(Placement(transformation(extent = {{-73.61,6.72},{-53.61,26.72}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Constant const(k = 273.15 + 80) annotation(Placement(transformation(extent = {{-88.0,-26.95},{-68.0,-6.95}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(heatingDemand.y,substation.heaDem) annotation(Line(points = {{-5.62,60.55},{19.49,60.55},{19.49,22.37},{44.59,22.37}},color = {0,0,127}));
    connect(substation.port_a,plugFlowPipe.port_b) annotation(Line(points = {{52.57,16.34},{52.57,-10.27},{30.18,-10.27}},color = {0,127,255}));
    connect(plugFlowPipe.port_a,hea.port_b) annotation(Line(points = {{10.18,-10.27},{-0.91,-10.27},{-0.91,-10.46},{-11.73,-10.46}},color = {0,127,255}));
    connect(plugFlowPipe.heatPort,preTem.port) annotation(Line(points = {{20.18,-0.27},{20.18,16.72},{-53.61,16.72}},color = {191,0,0}));
    connect(preTem.port,plugFlowPipe2.heatPort) annotation(Line(points = {{-53.61,16.72},{2.13,16.72},{2.13,-40.58},{22.76,-40.58}},color = {191,0,0}));
    connect(plugFlowPipe2.port_a,substation.port_b) annotation(Line(points = {{32.76,-50.58},{60.63,-50.58},{60.63,16.41}},color = {0,127,255}));
    connect(hea.port_a,plugFlowPipe2.port_b) annotation(Line(points = {{-31.73,-10.46},{-37.730000000000004,-10.46},{-37.730000000000004,-50.58},{12.76,-50.58}},color = {0,127,255}));
    connect(bou.ports[1],plugFlowPipe2.port_b) annotation(Line(points = {{-51.57,-74.08},{-19.405,-74.08},{-19.405,-50.58},{12.76,-50.58}},color = {0,127,255}));
    connect(const.y,hea.TSet) annotation(Line(points = {{-67,-16.95},{-61,-16.95},{-61,-2.46},{-33.73,-2.46}},color = {0,0,127}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end Experiment3;
