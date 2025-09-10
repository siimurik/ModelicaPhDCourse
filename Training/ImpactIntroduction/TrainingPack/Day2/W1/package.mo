within TrainingPack.Day2;
package W1
    package Interfaces "Interface classes"
        extends .Modelica.Icons.InterfacesPackage;
        partial model Engine
            .Modelica.Mechanics.Rotational.Interfaces.Flange_a transmissionFlange annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
            .Modelica.Blocks.Interfaces.RealInput throttle annotation(Placement(transformation(extent = {{-140,-20},{-100,20}})));
        end Engine;
        partial model Transmission
            .Modelica.Mechanics.Rotational.Interfaces.Flange_a drivelineFlange annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
            .Modelica.Mechanics.Rotational.Interfaces.Flange_a engineFlange1 annotation(Placement(transformation(extent = {{-110,-10},{-90,10}})));
            annotation(Diagram(graphics));
        end Transmission;
        partial model Driveline
            .Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(transformation(extent = {{-110,-10},{-90,10}})));
            .Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_b annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
        end Driveline;
        partial model Chassis
            parameter .Modelica.Units.SI.Velocity v_start "Chassis initial speed";
            .Modelica.Mechanics.Rotational.Interfaces.Flange_a drivelineFlange annotation(Placement(transformation(extent = {{-110,-10},{-90,10}})));
            .Modelica.Blocks.Interfaces.RealOutput speed annotation(Placement(transformation(extent = {{100,-10},{120,10}})));
        end Chassis;
        partial model Car "Interface for full car"
            .Modelica.Blocks.Interfaces.RealInput throttle annotation(Placement(transformation(extent = {{-140,-20},{-100,20}})));
            .Modelica.Blocks.Interfaces.RealOutput speed annotation(Placement(transformation(extent = {{100,-10},{120,10}})));
            annotation(Icon(coordinateSystem(preserveAspectRatio = false)),Diagram(coordinateSystem(preserveAspectRatio = false)));
        end Car;
        partial model Powertrain "Interface for powertrains"
            .Modelica.Blocks.Interfaces.RealInput throttle annotation(Placement(transformation(extent = {{-140,-20},{-100,20}})));
            .Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_b annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
            annotation(Icon(coordinateSystem(preserveAspectRatio = false)),Diagram(coordinateSystem(preserveAspectRatio = false)));
        end Powertrain;
        partial model ElectricMotor
            .Modelica.Blocks.Interfaces.RealInput throttle annotation(Placement(transformation(extent = {{-140,-20},{-100,20}})));
            .Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_b annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
            annotation(Icon(coordinateSystem(preserveAspectRatio = false)),Diagram(coordinateSystem(preserveAspectRatio = false)));
        end ElectricMotor;
    end Interfaces;
    package Templates
partial model StandardCar "Standard Car template"
            extends .TrainingPack.Day2.W1.Interfaces.Car;
            replaceable Interfaces.Engine engine annotation(Placement(transformation(extent = {{-70,-10},{-50,10}})));
            replaceable Interfaces.Transmission transmission annotation(Placement(transformation(extent = {{-30,-10},{-10,10}})));
            replaceable Interfaces.Driveline driveline annotation(Placement(transformation(extent = {{10,-10},{30,10}})));
            replaceable Interfaces.Chassis chassis annotation(Placement(transformation(extent = {{50,-10},{70,10}})));
        equation
            connect(engine.transmissionFlange,transmission.engineFlange1) annotation(Line(points = {{-50,0},{-30,0}},color = {0,0,0},smooth = Smooth.None));
            connect(transmission.drivelineFlange,driveline.flange_a) annotation(Line(points = {{-10,0},{10,0}},color = {0,0,0},smooth = Smooth.None));
            connect(driveline.flange_b,chassis.drivelineFlange) annotation(Line(points = {{30,0},{50,0}},color = {0,0,0},smooth = Smooth.None));
            connect(throttle,engine.throttle) annotation(Line(points = {{-120,0},{-72,0}},color = {0,0,127}));
            connect(chassis.speed,speed) annotation(Line(points = {{71,0},{110,0}},color = {0,0,127}));
        end StandardCar;
partial model Car "Template for standard and hybrid cars"
            extends .TrainingPack.Day2.W1.Interfaces.Car;
            replaceable Interfaces.Chassis chassis annotation(Placement(transformation(extent = {{30,-10},{50,10}})));
            replaceable Interfaces.Powertrain powertrain annotation(Placement(transformation(extent = {{-50,-10},{-30,10}})));
        equation
            connect(chassis.speed,speed) annotation(Line(points = {{51,0},{110,0}},color = {0,0,127}));
            connect(throttle,powertrain.throttle) annotation(Line(points = {{-120,0},{-42,0}},color = {0,0,127}));
            connect(throttle,powertrain.throttle) annotation(Line(points = {{-120,0},{-52,0}},color = {0,0,127}));
            connect(powertrain.flange_b,chassis.drivelineFlange) annotation(Line(points = {{-30,0},{30,0}},color = {0,0,0}));
        end Car;
        partial model TraditionalPowertrain "Tradiational Powertrain template"
            extends Interfaces.Powertrain;
            replaceable Interfaces.Engine engine annotation(Placement(transformation(extent = {{-60,-10},{-40,10}})));
            replaceable Interfaces.Transmission transmission annotation(Placement(transformation(extent = {{-10,-10},{10,10}})));
            replaceable Interfaces.Driveline driveline annotation(Placement(transformation(extent = {{40,-10},{60,10}})));
        equation
            connect(engine.transmissionFlange,transmission.engineFlange1) annotation(Line(points = {{-40,0},{-10,0}},color = {0,0,0},smooth = Smooth.None));
            connect(transmission.drivelineFlange,driveline.flange_a) annotation(Line(points = {{10,0},{40,0}},color = {0,0,0},smooth = Smooth.None));
            connect(throttle,engine.throttle) annotation(Line(points = {{-120,0},{-62,0}},color = {0,0,127}));
            connect(driveline.flange_b,flange_b) annotation(Line(points = {{60,0},{100,0}},color = {0,0,0}));
        end TraditionalPowertrain;
    end Templates;
    package Systems
        extends .Modelica.Icons.VariantsPackage;
        package SubSystems
            extends .Modelica.Icons.VariantsPackage;
            package Powertrain "package of powertrain components"
                model BasicEngine "Engine with ideal throttle characteristics"
                    extends Interfaces.Engine;
                    .Modelica.Blocks.Math.Gain gain(k = max_torque) annotation(Placement(transformation(extent = {{-20,-10},{0,10}})));
                    .Modelica.Mechanics.Rotational.Sources.Torque torque annotation(Placement(transformation(extent = {{30,-10},{50,10}})));
                    parameter .Modelica.Units.SI.Torque max_torque = 300 "Torque for full throttle";
                    .Modelica.Blocks.Nonlinear.Limiter limiter(uMax = 1,uMin = 0) annotation(Placement(transformation(extent = {{-70,-10},{-50,10}})));
                equation
                    connect(gain.y,torque.tau) annotation(Line(points = {{1,0},{28,0}},color = {0,0,127},smooth = Smooth.None));
                    connect(torque.flange,transmissionFlange) annotation(Line(points = {{50,0},{100,0}},color = {0,0,0},smooth = Smooth.None));
                    connect(limiter.u,throttle) annotation(Line(points = {{-72,0},{-120,0}},color = {0,0,127},smooth = Smooth.None));
                    connect(limiter.y,gain.u) annotation(Line(points = {{-49,0},{-22,0}},color = {0,0,127},smooth = Smooth.None));
                    annotation(Diagram(graphics),Icon(graphics = {Rectangle(extent={{10,74},{70,54}},lineColor={0,0,0},fillColor={175,175,175},fillPattern=FillPattern.VerticalCylinder),Rectangle(extent={{100,10},{80,-10}},lineColor={0,0,0},fillColor={175,175,175},fillPattern=FillPattern.HorizontalCylinder),Rectangle(extent={{0,20},{80,8}},lineColor={0,0,0},fillColor={175,175,175},fillPattern=FillPattern.HorizontalCylinder),Rectangle(extent={{-80,-8},{0,-20}},lineColor={0,0,0},fillColor={175,175,175},fillPattern=FillPattern.HorizontalCylinder),Rectangle(extent={{36,54},{44,4}},lineColor={0,0,0},fillColor={175,175,175},fillPattern=FillPattern.Solid),Rectangle(extent={{-70,46},{-10,26}},lineColor={0,0,0},fillColor={175,175,175},fillPattern=FillPattern.VerticalCylinder),Rectangle(extent={{-44,26},{-36,-24}},lineColor={0,0,0},fillColor={175,175,175},fillPattern=FillPattern.Solid),Rectangle(extent={{-2,22},{2,-22}},lineColor={0,0,0},fillColor={175,175,175},fillPattern=FillPattern.Solid),Rectangle(extent={{78,22},{82,-22}},lineColor={0,0,0},fillColor={175,175,175},fillPattern=FillPattern.Solid),Rectangle(extent={{-82,22},{-78,-22}},lineColor={0,0,0},fillColor={175,175,175},fillPattern=FillPattern.Solid)}));
                end BasicEngine;
                model RigidDriveline "Driveline without compliance"
                    extends Interfaces.Driveline;
                    .Modelica.Mechanics.Rotational.Components.Inertia inertia(J = J) annotation(Placement(transformation(extent = {{-10,-10},{10,10}})));
                    parameter .Modelica.Units.SI.Inertia J = 0.1 "Moment of inertia";
                equation
                    connect(inertia.flange_a,flange_a) annotation(Line(points = {{-10,0},{-100,0}},color = {0,0,0},smooth = Smooth.None));
                    connect(inertia.flange_b,flange_b) annotation(Line(points = {{10,0},{100,0}},color = {0,0,0},smooth = Smooth.None));
                    annotation(Diagram(graphics),Icon(graphics = {Rectangle(extent={{-100,10},{100,-10}},lineColor={0,0,0},fillColor={175,175,175},fillPattern=FillPattern.HorizontalCylinder)}));
                end RigidDriveline;
                model ElasticDriveline "Driveline with compliance"
                    extends Interfaces.Driveline;
                    .Modelica.Mechanics.Rotational.Components.Inertia inertia(J = J1) annotation(Placement(transformation(extent = {{-50,-10},{-30,10}},origin = {0,0},rotation = 0)));
                    .Modelica.Mechanics.Rotational.Components.SpringDamper springDamper(c = c,d = d) annotation(Placement(transformation(extent = {{-10,-10},{10,10}},origin = {0,0},rotation = 0)));
                    .Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = J2) annotation(Placement(transformation(extent = {{30,-10},{50,10}},origin = {0,0},rotation = 0)));
                    parameter .Modelica.Units.SI.MomentOfInertia J1 = 0.6 "Inertia of drive line, engine side" annotation(Dialog(group = "Inertia"));
                    parameter .Modelica.Units.SI.MomentOfInertia J2 = 0.4 "Inertia of drive line, rear axle side" annotation(Dialog(group = "Inertia"));
                    parameter .Modelica.Units.SI.RotationalSpringConstant c = 10000 "Rotational spring constant" annotation(Dialog(group = "Stiffness"));
                    parameter .Modelica.Units.SI.RotationalDampingConstant d = 10 "Rotational damping" annotation(Dialog(group = "Stiffness"));
                equation
                    connect(flange_a,inertia.flange_a) annotation(Line(points = {{-100,0},{-50,0}},color = {0,0,0}));
                    connect(inertia.flange_b,springDamper.flange_a) annotation(Line(points = {{-30,0},{-10,0}},color = {0,0,0}));
                    connect(springDamper.flange_b,inertia2.flange_a) annotation(Line(points = {{10,0},{30,0}},color = {0,0,0}));
                    connect(inertia2.flange_b,flange_b) annotation(Line(points = {{50,0},{100,0}},color = {0,0,0}));
                    annotation(Icon(graphics = {Rectangle(extent={{-100,10},{100,-10}},lineColor={0,0,0},fillColor={175,175,175},fillPattern=FillPattern.HorizontalCylinder),Line(points={{-40,20},{-20,-20},{0,20},{20,-20},{40,20}},color={0,0,0})}));
                end ElasticDriveline;
                model FixedTransmission "Transmission with a fixed gear ratio"
                    extends Interfaces.Transmission;
                    .Modelica.Mechanics.Rotational.Components.IdealGear gear(ratio = ratio) annotation(Placement(transformation(extent = {{-10,-10},{10,10}})));
                    parameter Real ratio = 1.0 "Transmission ratio (flange_a.phi/flange_b.phi)";
                equation
                    connect(gear.flange_a,engineFlange1) annotation(Line(points = {{-10,0},{-100,0}},color = {0,0,0},smooth = Smooth.None));
                    connect(gear.flange_b,drivelineFlange) annotation(Line(points = {{10,0},{100,0}},color = {0,0,0},smooth = Smooth.None));
                    annotation(Diagram(graphics),Icon(graphics = {Rectangle(extent={{-100,10},{-40,-10}},lineColor={0,0,0},fillPattern=FillPattern.HorizontalCylinder,fillColor={192,192,192}),Rectangle(extent={{-40,20},{-20,-20}},lineColor={0,0,0},fillPattern=FillPattern.HorizontalCylinder,fillColor={192,192,192}),Rectangle(extent={{-40,100},{-20,20}},lineColor={0,0,0},fillPattern=FillPattern.HorizontalCylinder,fillColor={192,192,192}),Rectangle(extent={{-20,70},{20,50}},lineColor={0,0,0},fillPattern=FillPattern.HorizontalCylinder,fillColor={192,192,192}),Rectangle(extent={{20,80},{40,39}},lineColor={0,0,0},fillPattern=FillPattern.HorizontalCylinder,fillColor={192,192,192}),Rectangle(extent={{20,40},{40,-40}},lineColor={0,0,0},fillPattern=FillPattern.HorizontalCylinder,fillColor={192,192,192}),Rectangle(extent={{40,10},{100,-10}},lineColor={0,0,0},fillPattern=FillPattern.HorizontalCylinder,fillColor={192,192,192})}));
                end FixedTransmission;
                model TraditionalPowertrain "Traditional powertrain"
                    extends Templates.TraditionalPowertrain(redeclare replaceable BasicEngine engine,redeclare replaceable FixedTransmission transmission,redeclare replaceable RigidDriveline driveline);
                    annotation(Icon(graphics = {Rectangle(extent={{-92,-6},{-42,-12}},lineColor={0,0,0},fillColor={175,175,175},fillPattern=FillPattern.HorizontalCylinder),Rectangle(extent={{-84,34},{-48,22}},lineColor={0,0,0},fillColor={175,175,175},fillPattern=FillPattern.VerticalCylinder),Rectangle(extent={{-68,22},{-64,-16}},lineColor={0,0,0},fillColor={175,175,175},fillPattern=FillPattern.Solid),Rectangle(extent={{-42,16},{-40,-16}},lineColor={0,0,0},fillColor={175,175,175},fillPattern=FillPattern.Solid),Rectangle(extent={{-94,16},{-92,-16}},lineColor={0,0,0},fillColor={175,175,175},fillPattern=FillPattern.Solid),Rectangle(extent={{-36,54},{2,42}},lineColor={0,0,0},fillColor={175,175,175},fillPattern=FillPattern.VerticalCylinder),Rectangle(extent={{-40,14},{8,8}},lineColor={0,0,0},fillColor={175,175,175},fillPattern=FillPattern.HorizontalCylinder),Rectangle(extent={{8,16},{10,-16}},lineColor={0,0,0},fillColor={175,175,175},fillPattern=FillPattern.Solid),Rectangle(extent={{-18,42},{-14,4}},lineColor={0,0,0},fillColor={175,175,175},fillPattern=FillPattern.Solid),Rectangle(extent={{36,12},{46,-10}},lineColor={0,0,0},fillPattern=FillPattern.HorizontalCylinder,fillColor={192,192,192}),Rectangle(extent={{36,76},{46,12}},lineColor={0,0,0},fillPattern=FillPattern.HorizontalCylinder,fillColor={192,192,192}),Rectangle(extent={{46,46},{66,40}},lineColor={0,0,0},fillPattern=FillPattern.HorizontalCylinder,fillColor={192,192,192}),Rectangle(extent={{66,58},{76,30}},lineColor={0,0,0},fillPattern=FillPattern.HorizontalCylinder,fillColor={192,192,192}),Rectangle(extent={{66,30},{76,-30}},lineColor={0,0,0},fillPattern=FillPattern.HorizontalCylinder,fillColor={192,192,192}),Rectangle(extent={{76,4},{100,-2}},lineColor={0,0,0},fillPattern=FillPattern.HorizontalCylinder,fillColor={192,192,192}),Rectangle(extent={{10,4},{36,-2}},lineColor={0,0,0},fillPattern=FillPattern.HorizontalCylinder,fillColor={192,192,192})}));
                end TraditionalPowertrain;
                package BatteryData
                    extends .Modelon.Icons.DataPackage;
                end BatteryData;
            end Powertrain;
            package Chassis "Package with chassis components"
                model IdealChassis "Ideal chassis with no losses"
                    extends Interfaces.Chassis;
                    .Modelica.Mechanics.Rotational.Components.Inertia wheelInertia(J = J_wheel) annotation(Placement(transformation(extent = {{-80,-10},{-60,10}})));
                    .Modelica.Mechanics.Rotational.Components.IdealRollingWheel wheel(radius = R_wheel) annotation(Placement(transformation(extent = {{-40,-10},{-20,10}})));
                    .Modelica.Mechanics.Translational.Components.Mass mass(m = m_chassis,v(fixed = true,start = v_start)) annotation(Placement(transformation(extent = {{0,-10},{20,10}})));
                    .Modelica.Mechanics.Translational.Sensors.SpeedSensor speedSensor annotation(Placement(transformation(extent = {{40,-10},{60,10}})));
                    parameter .Modelica.Units.SI.Inertia J_wheel = 1 "Wheel inertia";
                    parameter .Modelica.Units.SI.Distance R_wheel = 0.3 "Wheel radius";
                    parameter .Modelica.Units.SI.Mass m_chassis = 1400 "mass of the chassis";
                equation
                    connect(wheel.flangeR,wheelInertia.flange_b) annotation(Line(points = {{-40,0},{-60,0}},color = {0,0,0},smooth = Smooth.None));
                    connect(wheelInertia.flange_a,drivelineFlange) annotation(Line(points = {{-80,0},{-100,0}},color = {0,0,0},smooth = Smooth.None));
                    connect(wheel.flangeT,mass.flange_a) annotation(Line(points = {{-20,0},{-10,0},{-10,0},{0,0}},color = {0,127,0},smooth = Smooth.None));
                    connect(mass.flange_b,speedSensor.flange) annotation(Line(points = {{20,0},{40,0}},color = {0,127,0},smooth = Smooth.None));
                    connect(speedSensor.v,speed) annotation(Line(points = {{61,0},{110,0}},color = {0,0,127},smooth = Smooth.None));
                    annotation(Diagram(graphics),Icon(graphics = {Polygon(points={{76,-18},{84,-18},{90,-12},{92,-6},{90,-2},{88,8},{82,12},{76,14},{60,18},{48,18},{38,20},{20,32},{14,36},{0,38},{-16,36},{-36,32},{-58,22},{-78,8},{-84,-2},{-84,-12},{-80,-14},{-66,-18},{-36,-20},{48,-22},{50,-20},{76,-18}},lineColor={0,0,0},smooth=Smooth.None,fillColor={159,0,0},fillPattern=FillPattern.Solid),Ellipse(extent={{-40,-4},{-68,-32}},lineColor={0,0,0},fillPattern=FillPattern.Solid,fillColor={95,95,95}),Ellipse(extent={{74,-4},{46,-32}},lineColor={0,0,0},fillPattern=FillPattern.Solid,fillColor={95,95,95}),Polygon(points={{20,34},{18,32},{34,20},{36,22},{20,34}},lineColor={0,0,0},smooth=Smooth.None,fillColor={215,215,215},fillPattern=FillPattern.Solid),Polygon(points={{26,20},{14,30},{6,32},{-14,32},{-32,28},{-42,20},{-40,14},{-14,16},{24,18},{26,20}},lineColor={0,0,0},smooth=Smooth.None,fillColor={215,215,215},fillPattern=FillPattern.Solid)}));
                end IdealChassis;
            end Chassis;
        end SubSystems;
        model OriginalCarConfig "Original Configuration"
            extends Templates.StandardCar(redeclare SubSystems.Powertrain.BasicEngine engine,redeclare SubSystems.Powertrain.FixedTransmission transmission,redeclare SubSystems.Powertrain.RigidDriveline driveline,redeclare SubSystems.Chassis.IdealChassis chassis(v_start = 25));
            annotation(Diagram(graphics),Icon(graphics = {Polygon(points={{76,-18},{84,-18},{90,-12},{92,-6},{90,-2},{88,8},{82,12},{76,14},{60,18},{48,18},{38,20},{20,32},{14,36},{0,38},{-16,36},{-36,32},{-58,22},{-78,8},{-84,-2},{-84,-12},{-80,-14},{-66,-18},{-36,-20},{48,-22},{50,-20},{76,-18}},lineColor={0,0,0},smooth=Smooth.None,fillColor={159,0,0},fillPattern=FillPattern.Solid),Ellipse(extent={{-40,-4},{-68,-32}},lineColor={0,0,0},fillPattern=FillPattern.Solid,fillColor={95,95,95}),Ellipse(extent={{74,-4},{46,-32}},lineColor={0,0,0},fillPattern=FillPattern.Solid,fillColor={95,95,95}),Polygon(points={{20,34},{18,32},{34,20},{36,22},{20,34}},lineColor={0,0,0},smooth=Smooth.None,fillColor={215,215,215},fillPattern=FillPattern.Solid),Polygon(points={{26,20},{14,30},{6,32},{-14,32},{-32,28},{-42,20},{-40,14},{-14,16},{24,18},{26,20}},lineColor={0,0,0},smooth=Smooth.None,fillColor={215,215,215},fillPattern=FillPattern.Solid)}));
        end OriginalCarConfig;
        model OriginalCarConfigPowertrain "Traditional car with powertrain subsystem"
            extends Templates.Car(redeclare SubSystems.Powertrain.TraditionalPowertrain powertrain,redeclare SubSystems.Chassis.IdealChassis chassis(v_start = 25));
            annotation(Icon(graphics = {Polygon(points={{76,-18},{84,-18},{90,-12},{92,-6},{90,-2},{88,8},{82,12},{76,14},{60,18},{48,18},{38,20},{20,32},{14,36},{0,38},{-16,36},{-36,32},{-58,22},{-78,8},{-84,-2},{-84,-12},{-80,-14},{-66,-18},{-36,-20},{48,-22},{50,-20},{76,-18}},lineColor={0,0,0},smooth=Smooth.None,fillColor={159,0,0},fillPattern=FillPattern.Solid),Ellipse(extent={{-40,-4},{-68,-32}},lineColor={0,0,0},fillPattern=FillPattern.Solid,fillColor={95,95,95}),Ellipse(extent={{74,-4},{46,-32}},lineColor={0,0,0},fillPattern=FillPattern.Solid,fillColor={95,95,95}),Polygon(points={{20,34},{18,32},{34,20},{36,22},{20,34}},lineColor={0,0,0},smooth=Smooth.None,fillColor={215,215,215},fillPattern=FillPattern.Solid),Polygon(points={{26,20},{14,30},{6,32},{-14,32},{-32,28},{-42,20},{-40,14},{-14,16},{24,18},{26,20}},lineColor={0,0,0},smooth=Smooth.None,fillColor={215,215,215},fillPattern=FillPattern.Solid)}));
        end OriginalCarConfigPowertrain;
    end Systems;
    package Experiments
        extends .Modelica.Icons.ExamplesPackage;
        package Template
            model FullCarAccelerationTest
                replaceable .Modelica.Blocks.Sources.Constant throttle constrainedby .Modelica.Blocks.Interfaces.SO annotation(Placement(transformation(extent = {{-80,-10},{-60,10}})));
                replaceable Interfaces.Car car annotation(Placement(transformation(extent = {{-20,-10},{0,10}})));
            equation
                connect(throttle.y,car.throttle) annotation(Line(points = {{-59,0},{-22,0}},color = {0,0,127}));
                annotation(Icon(coordinateSystem(preserveAspectRatio = false)),Diagram(coordinateSystem(preserveAspectRatio = false)));
            end FullCarAccelerationTest;
            model DriveCycleTest
                replaceable Interfaces.Car car annotation(Placement(transformation(extent = {{-20,-10},{0,10}})));
                .Modelica.Blocks.Continuous.LimPID PID(k = 10,yMax = 1,initType = .Modelica.Blocks.Types.Init.NoInit) annotation(Placement(transformation(extent = {{-56,-10},{-36,10}})));
                .Modelica.Blocks.Sources.TimeTable timeTable(table = [0,26;20,26;100,30;120,20]) annotation(Placement(transformation(extent = {{-92,-10},{-72,10}})));
            equation
                connect(PID.y,car.throttle) annotation(Line(points = {{-35,0},{-22,0}},color = {0,0,127}));
                connect(car.speed,PID.u_m) annotation(Line(points = {{1,0},{12,0},{12,-26},{-46,-26},{-46,-12}},color = {0,0,127}));
                connect(timeTable.y,PID.u_s) annotation(Line(points = {{-71,0},{-58,0}},color = {0,0,127}));
                annotation(Icon(coordinateSystem(preserveAspectRatio = false)),Diagram(coordinateSystem(preserveAspectRatio = false)));
            end DriveCycleTest;
        end Template;
        model AccelerationTest1
            extends Template.FullCarAccelerationTest(redeclare Systems.OriginalCarConfig car,throttle(k = 1));
        end AccelerationTest1;
    end Experiments;
end W1;
