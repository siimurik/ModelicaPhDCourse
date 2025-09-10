within ImpactTrainingSolutions.Day3.W2;
model ElectricMotor "simple electrical motor and inertia"

        Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_SeriesExcited
          motor annotation (Placement(transformation(extent={{-40,-10},{-20,10}},
                rotation=0)));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage
          annotation (Placement(transformation(extent={{-24,20},{-44,40}},
                rotation=0)));
        Modelica.Electrical.Analog.Basic.Ground ground annotation (Placement(
              transformation(
              origin={-66,30},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Modelica.Mechanics.Rotational.Components.IdealGear idealGear(ratio=
              ratio)
          annotation (Placement(transformation(extent={{0,-10},{20,10}})));
        Modelica.Mechanics.Rotational.Components.Inertia inertia(J=J)
          annotation (Placement(transformation(extent={{40,-10},{60,10}})));

        Modelica.Blocks.Interfaces.RealInput u
          "Voltage between pin p and n (= p.v - n.v) as input signal"
          annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=0,
              origin={-120,0}), iconTransformation(extent={{-12,-12},{12,12}},
                origin={-112,0})));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b m1
          "Right flange of shaft"
          annotation (Placement(transformation(extent={{90,-10},{110,10}})));
        parameter Real ratio=2 "Transmission ratio (flange_a.phi/flange_b.phi)"
          annotation (Dialog(group="Mechanical parameters"));
        parameter Modelica.Units.SI.Inertia J "Moment of inertia"
          annotation (Dialog(group="Mechanical parameters"));

      equation
        connect(motor.pin_ep, motor.pin_an) annotation (Line(
            points={{-40,6},{-40,10},{-36,10}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(ground.p, signalVoltage.n) annotation (Line(
            points={{-56,30},{-50,30},{-50,30},{-44,30}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(signalVoltage.v, u) annotation (Line(
            points={{-34,37},{-34,52},{-80,52},{-80,0},{-120,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(motor.flange, idealGear.flange_a) annotation (Line(
            points={{-20,0},{0,0}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(idealGear.flange_b, inertia.flange_a) annotation (Line(
            points={{20,0},{40,0}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(inertia.flange_b, m1) annotation (Line(
            points={{60,0},{100,0}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(signalVoltage.p, motor.pin_ap) annotation (Line(
            points={{-24,30},{-24,10}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(signalVoltage.n, motor.pin_en) annotation (Line(
            points={{-44,30},{-48,30},{-48,-6},{-40,-6}},
            color={0,0,255},
            smooth=Smooth.None));
    
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end ElectricMotor;
