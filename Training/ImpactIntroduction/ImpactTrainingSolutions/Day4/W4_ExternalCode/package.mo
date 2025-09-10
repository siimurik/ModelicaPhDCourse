within ImpactTrainingSolutions.Day4;
package W4_ExternalCode
    extends .Modelica.Icons.Package;
    function powerFunction
        input Real value;
        input Integer p;
        output Real y;
        external "C" y = power(value,p) annotation(IncludeDirectory = "modelica://ImpactTrainingSolutions/Resources/",Include = "#include <power.c>");
    end powerFunction;
    model testExternalPowerFunction
        Integer[nbr] p = 0:8;
        Real[nbr] y;
    protected
        parameter Integer nbr = 9;
    equation
        for i in 1:nbr loop
            y[i]=.ImpactTrainingSolutions.Day4.W4_ExternalCode.powerFunction(2,p[i]);
        end for;
    end testExternalPowerFunction;
end W4_ExternalCode;
