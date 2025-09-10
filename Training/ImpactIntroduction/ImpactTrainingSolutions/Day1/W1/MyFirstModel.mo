within ImpactTrainingSolutions.Day1.W1;
model MyFirstModel
    .Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 0.1,phi(start = 0.17453292519943278,fixed = true)) annotation(Placement(transformation(extent = {{-61.565288682514804,17.957241689676867},{-41.565288682514804,37.95724168967686}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = 0.1,phi(start = 0,fixed = true)) annotation(Placement(transformation(extent = {{25.90724658989533,17.91667548480591},{45.90724658989533,37.91667548480591}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Mechanics.Rotational.Components.SpringDamper springDamper(c = 100,d = 0.5) annotation(Placement(transformation(extent = {{-18.341957907380518,18.126082825517226},{1.6580420926194677,38.12608282551723}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(inertia.flange_b,springDamper.flange_a) annotation(Line(points = {{-41.565288682514804,27.957241689676867},{-30.291305566628424,27.957241689676867},{-30.291305566628424,28.12608282551723},{-18.341957907380532,28.12608282551723}},color = {0,0,0}));
    connect(springDamper.flange_b,inertia2.flange_a) annotation(Line(points = {{1.6580420926194677,28.12608282551723},{13.607389751867352,28.12608282551723},{13.607389751867352,27.91667548480591},{25.90724658989533,27.91667548480591}},color = {0,0,0}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics={  Rectangle(lineColor={0,0,0},fillColor={230,230,230},
        fillPattern =                                                                                                                                                                  FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString=
                                                                                                                                                                                                "%name")}),experiment(StopTime = 2));
end MyFirstModel;