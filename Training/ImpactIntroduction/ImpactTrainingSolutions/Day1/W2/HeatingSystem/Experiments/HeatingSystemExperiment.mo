within ImpactTrainingSolutions.Day1.W2.HeatingSystem.Experiments;
model HeatingSystemExperiment
    .ImpactTrainingSolutions.Day1.W2.HeatingSystem.Components.Pump pump(redeclare
      replaceable package Medium = .Modelica.Media.Water.StandardWater)
    annotation (Placement(transformation(
        extent={{-46.89842270586436,21.406153727246952},{-26.898422705864363,41.40615372724695}},
        origin={0.0,0.0},
        rotation=0.0)));

    .ImpactTrainingSolutions.Day1.W2.HeatingSystem.Components.Heater heater(
      redeclare replaceable package Medium = .Modelica.Media.Water.StandardWater)
    annotation (Placement(transformation(
        extent={{50.20918599430925,21.28689346033954},{70.20918599430925,41.28689346033954}},
        origin={0.0,0.0},
        rotation=0.0)));

    .ImpactTrainingSolutions.Day1.W2.HeatingSystem.Components.Pipe pipe(redeclare
      replaceable package Medium = .Modelica.Media.Water.StandardWater)
    annotation (Placement(transformation(
        extent={{-10.0,-10.0},{10.0,10.0}},
        origin={103.24045331270418,0.8527332185680692},
        rotation=-90.0)));
    .ImpactTrainingSolutions.Day1.W2.HeatingSystem.Components.Radiator radiator(
      redeclare replaceable package Medium = .Modelica.Media.Water.StandardWater)
    annotation (Placement(transformation(
        extent={{42.0,-72.0},{22.0,-52.0}},
        origin={0.0,0.0},
        rotation=0.0)));

    .ImpactTrainingSolutions.Day1.W2.HeatingSystem.Components.Wall wall annotation (
     Placement(transformation(
        extent={{-10.0,-10.0},{10.0,10.0}},
        origin={31.868348258110615,-29.63438817827045},
        rotation=-90.0)));
    .ImpactTrainingSolutions.Day1.W2.HeatingSystem.Components.Tank tank(nPorts=2,
      redeclare replaceable package Medium = .Modelica.Media.Water.StandardWater)
    annotation (Placement(transformation(
        extent={{-96.0,48.0},{-56.0,88.0}},
        origin={0.0,0.0},
        rotation=0.0)));

    .Modelica.Fluid.Sensors.MassFlowRate sensor_m_flow(redeclare replaceable
      package Medium =
.Modelica.Media.Water.StandardWater)                                                                                               annotation(Placement(transformation(extent = {{-0.8737969728518635,21.20193216731567},{19.126203027148136,41.20193216731566}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Fluid.Sensors.Temperature sensor_T_forward(redeclare replaceable
      package Medium =
.Modelica.Media.Water.StandardWater)                                                                                                 annotation(Placement(transformation(extent = {{81.71895501750743,57.47834498206859},{101.71895501750743,77.47834498206859}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Fluid.Sensors.Temperature sensor_T_return(redeclare replaceable
      package Medium =
.Modelica.Media.Water.StandardWater)                                                                                                annotation(Placement(transformation(extent = {{-44.12444995375287,-42.87270096115065},{-24.124449953752872,-22.87270096115065}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Sources.FixedTemperature T_ambient(T = system.T_ambient) annotation(Placement(transformation(extent = {{-2.7436402883626982,-13.433321757933989},{17.2563597116373,6.566678242066011}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow burner(Q_flow = 1600,T_ref = 343.15,alpha = -0.5) annotation(Placement(transformation(extent = {{29.869094655708636,50.16151138300502},{49.869094655708636,70.16151138300502}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Step valve_handle(height = 0.9,startTime = 2000,offset = 0.1) annotation(Placement(transformation(extent = {{46.76544299120499,-14.656299318336629},{66.76544299120499,5.343700681663371}},origin = {0.0,0.0},rotation = 0.0)));
    .ImpactTrainingSolutions.Day1.W2.HeatingSystem.Components.Valve valve(
      redeclare replaceable package Medium = .Modelica.Media.Water.StandardWater,
      show_T=true) annotation (Placement(transformation(
        extent={{82.0,-72.0},{62.0,-52.0}},
        origin={0.0,0.0},
        rotation=0.0)));

    inner .Modelica.Fluid.System system(m_flow_small = 0.0001,T_ambient = 293.15,energyDynamics = .Modelica.Fluid.Types.Dynamics.SteadyStateInitial) annotation(Placement(transformation(extent = {{-88.0,122.0},{-68.0,142.0}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(tank.ports[1],pump.port_a) annotation(Line(points={{-76,48},{-76,31.406153727246952},{-46.89842270586436,31.406153727246952}},                                                                                                                           color = {0,127,255}));
    connect(heater.port_b,pipe.port_a) annotation(Line(points = {{70.20918599430925,31.28689346033954},{103.24045331270418,31.28689346033954},{103.24045331270418,10.852733218568076}},color = {0,127,255}));
    connect(radiator.port_b,tank.ports[2]) annotation(Line(points={{22,-62},{-76,-62},{-76,48}},                                                                                                                               color = {0,127,255}));
    connect(wall.port_b,radiator.heatPorts[1]) annotation(Line(points = {{31.868348258110615,-39.63438817827044},{31.868348258110615,-48.44711067647605},{31.9,-48.44711067647605},{31.9,-57.6}},color = {191,0,0}));
    connect(heater.port_b,sensor_T_forward.port) annotation(Line(points = {{70.20918599430925,31.28689346033954},{91.71895501750744,31.28689346033954},{91.71895501750744,57.4783449820686}},color = {0,127,255}));
    connect(pump.port_b,sensor_m_flow.port_a) annotation(Line(points = {{-26.898422705864355,31.406153727246952},{-15.251494434249874,31.406153727246952},{-15.251494434249874,31.201932167315668},{-0.8737969728518564,31.201932167315668}},color = {0,127,255}));
    connect(sensor_m_flow.port_b,heater.port_a) annotation(Line(points = {{19.126203027148144,31.201932167315668},{33.30230991583693,31.201932167315668},{33.30230991583693,31.28689346033954},{50.20918599430925,31.28689346033954}},color = {0,127,255}));
    connect(sensor_T_return.port,radiator.port_b) annotation(Line(points = {{-34.12444995375287,-42.87270096115065},{-34.12444995375287,-61.99999999999999},{22,-61.99999999999999}},color = {0,127,255}));
    connect(T_ambient.port,wall.port_a) annotation(Line(points = {{17.2563597116373,-3.4333217579339887},{31.868348258110615,-3.4333217579339887},{31.868348258110615,-19.63438817827044}},color = {191,0,0}));
    connect(burner.port,heater.heatPorts[1]) annotation(Line(points = {{49.869094655708636,60.16151138300502},{60.309185994309246,60.16151138300502},{60.309185994309246,35.68689346033954}},color = {191,0,0}));
    connect(radiator.port_a,valve.port_b) annotation(Line(points = {{42,-61.99999999999999},{62,-61.99999999999999}},color = {0,127,255}));
    connect(valve.opening,valve_handle.y) annotation(Line(points = {{72,-53.99999999999999},{72,-4.656299318336622},{67.76544299120499,-4.656299318336622}},color = {0,0,127}));
    connect(valve.port_a,pipe.port_b) annotation(Line(points = {{82,-61.99999999999999},{103.24045331270418,-61.99999999999999},{103.24045331270418,-9.147266781431924}},color = {0,127,255}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics={  Rectangle(lineColor={0,0,0},fillColor={230,230,230},
    fillPattern =                                                                                                                                                                      FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString
            =                                                                                                                                                                           "%name")}),experiment(StopTime = 6000));
end HeatingSystemExperiment;
