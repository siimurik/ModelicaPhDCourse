within TrainingPack.Day2.CoolingSystem.Experiments;
model Exp3
    .Modelica.Blocks.Sources.Constant const(k = 480) annotation(Placement(transformation(extent = {{13.27,66.63},{33.27,86.63}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Constant const2(k = 0) annotation(Placement(transformation(extent = {{6.55,36.61},{26.55,56.61}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam = Modelica.Utilities.Files.loadResource("modelica://Buildings/Resources/weatherdata/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos")) annotation(Placement(transformation(extent = {{-88.68,70.33},{-68.68,90.33}},origin = {0,0},rotation = 0)));
    .Buildings.Fluid.Movers.FlowControlled_m_flow mov(addPowerToMedium = false,m_flow_nominal = 0.1,redeclare replaceable package Medium = Buildings.Media.Air) annotation(Placement(transformation(extent = {{-33.81,5.47},{-13.81,25.47}},origin = {0,0},rotation = 0)));
    .Modelica.Blocks.Sources.Constant const3(k = 0.1) annotation(Placement(transformation(extent = {{-52.44,42.22},{-32.44,62.22}},origin = {0,0},rotation = 0)));
    .Buildings.Fluid.Sources.Outside out(nPorts = 2,redeclare replaceable package Medium = Buildings.Media.Air) annotation(Placement(transformation(extent = {{-91.9,-22.18},{-71.9,-2.18}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.HeatExchangers.ConstantEffectiveness hex(redeclare replaceable package Medium1 = Buildings.Media.Air,redeclare package Medium2 = Buildings.Media.Water,m1_flow_nominal = 0.15,m2_flow_nominal = 0.15,dp1_nominal = 0,dp2_nominal = 0) annotation(Placement(transformation(extent = {{4.33,2.31},{24.33,22.31}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.Sensors.TemperatureTwoPort senTem2(m_flow_nominal = 0.15,redeclare package Medium = Buildings.Media.Water) annotation(Placement(transformation(extent = {{-10.0,-10.0},{10.0,10.0}},origin = {-40.8,-17.46},rotation = -90.0)));
    .Buildings.Controls.Continuous.LimPID conPID(k = 0.1,Ti = 120,yMax = 2,reverseActing = false) annotation(Placement(transformation(extent = {{-84.27,-73.88},{-64.27,-53.88}},origin = {0,0},rotation = 0)));
    .Buildings.Fluid.HeatExchangers.SensibleCooler_T coo(QMin_flow = -2800,redeclare package Medium = Buildings.Media.Water,m_flow_nominal = 0.15,dp_nominal = 0) annotation(Placement(transformation(extent = {{36.16,-97.39},{56.16,-77.39}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.Movers.FlowControlled_m_flow mov2(addPowerToMedium = false,nominalValuesDefineDefaultPressureCurve = true,m_flow_nominal = 0.15,redeclare package Medium = Buildings.Media.Water) annotation(Placement(transformation(extent = {{-13.95,-62.91},{6.05,-42.91}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Continuous.Integrator integrator(k = -1 / 3600000) annotation(Placement(transformation(extent = {{44.25,-50.71},{64.25,-30.71}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Constant const4(k = 273.15 + 7) annotation(Placement(transformation(extent = {{-31.63,-124.42},{-11.63,-104.42}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.ThermalZones.ISO13790.Zone5R1C.ZoneHVAC zonHVAC(AFlo = 48,VRoo = 129.6,surTil = {1.57079632679489499834,1.57079632679489499834,1.57079632679489499834,1.57079632679489499834},surAzi = {3.14159265358978999667,-1.57079632679489499834,0,1.57079632679489499834},airRat = 0.4,AWin = {0,0,10,0},UWin = 1.8,winFra = 0.01,gFac = 0.6,AWal = {21.6,16.2,11.6,16.2},ARoo = 48,UWal = 0.2,URoo = 0.15,UFlo = 0.1,redeclare replaceable package Medium = Buildings.Media.Air,nPorts = 2) annotation(Placement(transformation(extent = {{67.88,12.34},{95.88,40.34}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.Sensors.TemperatureTwoPort senTem(redeclare replaceable package Medium = Buildings.Media.Air,m_flow_nominal = 0.15) annotation(Placement(transformation(extent = {{34.29,8.6},{54.29,28.6}},origin = {0,0},rotation = 0)));
    .Buildings.Fluid.Sources.Boundary_pT bou(nPorts = 1,redeclare package Medium = Buildings.Media.Water) annotation(Placement(transformation(extent = {{153.61,-80.48},{133.61,-60.48}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(table = [0,273.15 + 25],smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments,extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation(Placement(transformation(extent = {{-130.01,-72.45},{-110.01,-52.45}},origin = {0,0},rotation = 0)));
equation
    connect(const3.y,mov.m_flow_in) annotation(Line(points = {{-31.44,52.22},{-23.81,52.22},{-23.81,27.47}},color = {0,0,127}));
    connect(out.weaBus,weaDat.weaBus) annotation(Line(points = {{-91.9,-11.98},{-88.23,-11.98},{-88.23,31.47},{-62.68,31.47},{-62.68,80.33},{-68.68,80.33}},color = {255,204,51}));
    connect(const4.y,coo.TSet) annotation(Line(points = {{-10.63,-114.42},{22.92,-114.42},{22.92,-93.7},{6.01,-93.7},{6.01,-79.39},{34.16,-79.39}},color = {0,0,127}));
    connect(mov2.port_b,coo.port_a) annotation(Line(points = {{6.05,-52.91},{22.08,-52.91},{22.08,-87.39},{36.16,-87.39}},color = {0,127,255}));
    connect(mov2.m_flow_in,conPID.y) annotation(Line(points = {{-3.95,-40.91},{-3.95,-33.58},{-57.27,-33.58},{-57.27,-63.88},{-63.27,-63.88}},color = {0,0,127}));
    connect(senTem2.port_b,mov2.port_a) annotation(Line(points = {{-40.8,-27.46},{-40.8,-52.91},{-13.95,-52.91}},color = {0,127,255}));
    connect(senTem2.port_a,hex.port_b2) annotation(Line(points = {{-40.8,-7.46},{-40.8,6.31},{4.33,6.31}},color = {0,127,255}));
    connect(mov.port_b,hex.port_a1) annotation(Line(points = {{-13.81,15.47},{-4.74,15.47},{-4.74,18.31},{4.33,18.31}},color = {0,127,255}));
    connect(coo.Q_flow,integrator.u) annotation(Line(points = {{57.16,-79.39},{62.76,-79.39},{62.76,-60.05},{38.25,-60.05},{38.25,-40.71},{42.25,-40.71}},color = {0,0,127}));
    connect(out.ports[1],mov.port_a) annotation(Line(points = {{-71.9,-12.18},{-48.02,-12.18},{-48.02,15.47},{-33.81,15.47}},color = {0,127,255}));
    connect(coo.port_b,hex.port_a2) annotation(Line(points = {{56.16,-87.39},{88.15,-87.39},{88.15,6.31},{24.33,6.31}},color = {0,127,255}));
    connect(const.y,zonHVAC.intSenGai) annotation(Line(points = {{34.27,76.63},{45.92,76.63},{45.92,36.34},{65.88,36.34}},color = {0,0,127}));
    connect(const2.y,zonHVAC.intLatGai) annotation(Line(points = {{27.55,46.61},{42.56,46.61},{42.56,30.34},{65.88,30.34}},color = {0,0,127}));
    connect(weaDat.weaBus,zonHVAC.weaBus) annotation(Line(points = {{-68.68,80.33},{-68.68,99.29},{91.88,99.29},{91.88,37.34}},color = {255,204,51}));
    connect(zonHVAC.TAir,conPID.u_m) annotation(Line(points = {{96.88,34.34},{115.13,34.34},{115.13,-138.89},{-74.27,-138.89},{-74.27,-75.88}},color = {0,0,127}));
    connect(out.ports[2],zonHVAC.ports[1]) annotation(Line(points = {{-71.9,-12.18},{63.47,-12.18},{63.47,18.14},{68.88,18.14}},color = {0,127,255}));
    connect(hex.port_b1,senTem.port_a) annotation(Line(points = {{24.33,18.31},{29.31,18.31},{29.31,18.6},{34.29,18.6}},color = {0,127,255}));
    connect(senTem.port_b,zonHVAC.ports[2]) annotation(Line(points = {{54.29,18.6},{61.584999999999994,18.6},{61.584999999999994,18.14},{68.88,18.14}},color = {0,127,255}));
    connect(bou.ports[1],coo.port_b) annotation(Line(points = {{133.61,-70.48},{77.78,-70.48},{77.78,-87.39},{56.16,-87.39}},color = {0,127,255}));
    connect(combiTimeTable.y[1],conPID.u_s) annotation(Line(points = {{-109.01,-62.45},{-97.64,-62.45},{-97.64,-63.88},{-86.27,-63.88}},color = {0,0,127}));

    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));

end Exp3;