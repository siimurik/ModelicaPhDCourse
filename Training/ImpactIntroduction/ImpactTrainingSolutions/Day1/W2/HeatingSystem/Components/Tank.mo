within ImpactTrainingSolutions.Day1.W2.HeatingSystem.Components;
model Tank
  extends .Modelica.Fluid.Vessels.OpenTank(
    crossArea=0.01,
    height=2,
    level_start=1,
    nPorts=2,
    massDynamics=.Modelica.Fluid.Types.Dynamics.FixedInitial,
    use_HeatTransfer=true,
    portsData={.Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(
        diameter=0.01),.Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(
        diameter=0.01)},
    redeclare model HeatTransfer =
        .Modelica.Fluid.Vessels.BaseClasses.HeatTransfer.IdealHeatTransfer (
         k=10),
    ports(each p(start=1e5)),
    T_start=.Modelica.Units.Conversions.from_degC(20));
end Tank;
