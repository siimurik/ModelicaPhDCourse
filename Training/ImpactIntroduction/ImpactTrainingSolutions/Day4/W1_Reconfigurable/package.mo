within ImpactTrainingSolutions.Day4;
package W1_Reconfigurable
    package Configurations
        model AccelerationTest "Tests acceleration at full throttle"
            extends Templates.StandardCar(redeclare SubSystems.BasicEngine engine,redeclare SubSystems.FixedTransmission transmission,redeclare SubSystems.RigidDriveline driveline,redeclare SubSystems.IdealChassis chassis(v_start = 25));
            .Modelica.Blocks.Sources.Constant throttle(k = 1.0) annotation(Placement(transformation(extent = {{-100,-10},{-80,10}})));
        equation
            connect(throttle.y,engine.throttle) annotation(Line(points = {{-79,0},{-72,0}},color = {0,0,127},smooth = Smooth.None));
            annotation(Diagram(graphics));
        end AccelerationTest;
    end Configurations;
    package Interfaces
        partial model Chassis
            parameter .Modelica.Units.SI.Velocity v_start "Chassis initial speed";
            parameter Real veryadvanced = 1 "very advanced";
            .Modelica.Mechanics.Rotational.Interfaces.Flange_a drivelineFlange annotation(Placement(transformation(extent = {{-110,-10},{-90,10}})));
            .Modelica.Blocks.Interfaces.RealOutput speed annotation(Placement(transformation(extent = {{100,-10},{120,10}})));
        end Chassis;
        partial model Driveline
            .Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(transformation(extent = {{-110,-10},{-90,10}})));
            .Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_b annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
        end Driveline;
        partial model Engine
            .Modelica.Mechanics.Rotational.Interfaces.Flange_a transmissionFlange annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
            .Modelica.Blocks.Interfaces.RealInput throttle annotation(Placement(transformation(extent = {{-140,-20},{-100,20}})));
            annotation(Diagram(graphics));
        end Engine;
        partial model Transmission
            .Modelica.Mechanics.Rotational.Interfaces.Flange_a drivelineFlange annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
            .Modelica.Mechanics.Rotational.Interfaces.Flange_a engineFlange1 annotation(Placement(transformation(extent = {{-110,-10},{-90,10}})));
            annotation(Diagram(graphics));
        end Transmission;
    end Interfaces;
    package SubSystems
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
        model FixedTransmission "Transmission with a fixed gear ratio"
            extends Interfaces.Transmission;
            .Modelica.Mechanics.Rotational.Components.IdealGear gear(ratio = ratio) annotation(Placement(transformation(extent = {{-10,-10},{10,10}})));
            parameter Real ratio = 1.0 "Transmission ratio (flange_a.phi/flange_b.phi)";
        equation
            connect(gear.flange_a,engineFlange1) annotation(Line(points = {{-10,0},{-100,0}},color = {0,0,0},smooth = Smooth.None));
            connect(gear.flange_b,drivelineFlange) annotation(Line(points = {{10,0},{100,0}},color = {0,0,0},smooth = Smooth.None));
            annotation(Diagram(graphics),Icon(graphics = {Rectangle(extent={{-100,10},{-40,-10}},lineColor={0,0,0},fillPattern=FillPattern.HorizontalCylinder,fillColor={192,192,192}),Rectangle(extent={{-40,20},{-20,-20}},lineColor={0,0,0},fillPattern=FillPattern.HorizontalCylinder,fillColor={192,192,192}),Rectangle(extent={{-40,100},{-20,20}},lineColor={0,0,0},fillPattern=FillPattern.HorizontalCylinder,fillColor={192,192,192}),Rectangle(extent={{-20,70},{20,50}},lineColor={0,0,0},fillPattern=FillPattern.HorizontalCylinder,fillColor={192,192,192}),Rectangle(extent={{20,80},{40,39}},lineColor={0,0,0},fillPattern=FillPattern.HorizontalCylinder,fillColor={192,192,192}),Rectangle(extent={{20,40},{40,-40}},lineColor={0,0,0},fillPattern=FillPattern.HorizontalCylinder,fillColor={192,192,192}),Rectangle(extent={{40,10},{100,-10}},lineColor={0,0,0},fillPattern=FillPattern.HorizontalCylinder,fillColor={192,192,192})}));
        end FixedTransmission;
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
            annotation(Diagram(graphics),Icon(graphics = {Polygon(points={{-68,-22},{-76,-22},{-82,-16},{-84,-10},{-82,-6},{-80,4},{-74,8},{-68,10},{-52,14},{-40,14},{-30,16},{-12,28},{-6,32},{8,34},{24,32},{44,28},{66,18},{86,4},{92,-6},{92,-16},{88,-18},{74,-22},{44,-24},{-40,-26},{-42,-24},{-68,-22}},lineColor={0,0,0},smooth=Smooth.None,fillColor={159,0,0},fillPattern=FillPattern.Solid),Ellipse(extent={{-68,-4},{-40,-32}},lineColor={0,0,0},fillPattern=FillPattern.Solid,fillColor={95,95,95}),Ellipse(extent={{44,-4},{72,-32}},lineColor={0,0,0},fillPattern=FillPattern.Solid,fillColor={95,95,95}),Polygon(points={{-14,28},{-12,26},{-28,14},{-30,16},{-14,28}},lineColor={0,0,0},smooth=Smooth.None,fillColor={215,215,215},fillPattern=FillPattern.Solid),Polygon(points={{-20,16},{-8,26},{0,28},{20,28},{38,24},{48,16},{46,10},{20,12},{-18,14},{-20,16}},lineColor={0,0,0},smooth=Smooth.None,fillColor={215,215,215},fillPattern=FillPattern.Solid)}));
        end IdealChassis;
        model RigidDriveline "Driveline without compliance"
            extends Interfaces.Driveline;
            .Modelica.Mechanics.Rotational.Components.Inertia inertia(J = J) annotation(Placement(transformation(extent = {{-10,-10},{10,10}})));
            parameter .Modelica.Units.SI.Inertia J = 0.1 "Moment of inertia";
        equation
            connect(inertia.flange_a,flange_a) annotation(Line(points = {{-10,0},{-100,0}},color = {0,0,0},smooth = Smooth.None));
            connect(inertia.flange_b,flange_b) annotation(Line(points = {{10,0},{100,0}},color = {0,0,0},smooth = Smooth.None));
            annotation(Diagram(graphics),Icon(graphics = {Rectangle(extent={{-100,10},{100,-10}},lineColor={0,0,0},fillColor={175,175,175},fillPattern=FillPattern.HorizontalCylinder)}));
        end RigidDriveline;
    end SubSystems;
    package Templates
        partial model StandardCar
            replaceable Interfaces.Engine engine annotation(Placement(transformation(extent = {{-70,-10},{-50,10}})));
            replaceable Interfaces.Transmission transmission annotation(Placement(transformation(extent = {{-30,-10},{-10,10}})));
            replaceable Interfaces.Driveline driveline annotation(Placement(transformation(extent = {{10,-10},{30,10}})));
            replaceable Interfaces.Chassis chassis annotation(Placement(transformation(extent = {{50,-10},{70,10}})));
        equation
            connect(engine.transmissionFlange,transmission.engineFlange1) annotation(Line(points = {{-50,0},{-30,0}},color = {0,0,0},smooth = Smooth.None));
            connect(transmission.drivelineFlange,driveline.flange_a) annotation(Line(points = {{-10,0},{10,0}},color = {0,0,0},smooth = Smooth.None));
            connect(driveline.flange_b,chassis.drivelineFlange) annotation(Line(points = {{30,0},{50,0}},color = {0,0,0},smooth = Smooth.None));
            annotation(Diagram(graphics));
        end StandardCar;
    end Templates;
end W1_Reconfigurable;
