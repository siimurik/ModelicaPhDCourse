within TrainingPack.Day1.W2.HeatingSystem.Components;
model Radiator
  extends .Modelica.Fluid.Pipes.DynamicPipe(
    use_T_start=true,
    length=10,
    T_start=.Modelica.Units.Conversions.from_degC(40),
    redeclare model HeatTransfer =
        .Modelica.Fluid.Pipes.BaseClasses.HeatTransfer.IdealFlowHeatTransfer,
    diameter=0.01,
    nNodes=1,
    redeclare model FlowModel =
        .Modelica.Fluid.Pipes.BaseClasses.FlowModels.DetailedPipeFlow,
    use_HeatTransfer=true,
    modelStructure=.Modelica.Fluid.Types.ModelStructure.a_v_b,
    p_a_start=110000,
    state_a(p(start=110000)),
    state_b(p(start=110000)));

end Radiator;
