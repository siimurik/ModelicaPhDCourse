within ImpactTrainingSolutions.Day3;
package W1
    extends .Modelica.Icons.Package;
    model Cake "This is a simplistic model of a cake that has no culinary nor mathematical foundation."
        parameter Integer nEggs(min = nEggs_min,max = nEggs_max) = 1 "Number of eggs" annotation(Evaluate = true,Dialog(group = "Ingredients"));
        parameter Integer nEggs_min(min = 0,max = nEggs_max) = 0 "Number of eggs" annotation(Dialog(tab = "Problem Statement",group = "Ingredients"));
        parameter Integer nEggs_max(min = nEggs_min,max = 6) = 6 "Number of eggs" annotation(Dialog(tab = "Problem Statement",group = "Ingredients"));
        parameter .Modelica.Units.SI.Mass mFlour(displayUnit = "g",min = mFlour_min,max = mFlour_max) = 0.2 "Mass of flour" annotation(Dialog(group = "Ingredients"));
        parameter .Modelica.Units.SI.Mass mFlour_min(displayUnit = "g",min = 0,max = mFlour_max) = 0.1 "Mass of flour" annotation(Dialog(tab = "Problem Statement",group = "Ingredients"));
        parameter .Modelica.Units.SI.Mass mFlour_max(displayUnit = "g",min = mFlour_min,max = 0.5) = 0.5 "Mass of flour" annotation(Dialog(tab = "Problem Statement",group = "Ingredients"));
        parameter .Modelica.Units.SI.Mass mSugar(displayUnit = "g",min = mSugar_min,max = mSugar_max) = 0.11 "Mass of Sugar" annotation(Dialog(group = "Ingredients"));
        parameter .Modelica.Units.SI.Mass mSugar_min(displayUnit = "g",min = 0,max = mSugar_max) = 0 "Mass of Sugar" annotation(Dialog(tab = "Problem Statement",group = "Ingredients"));
        parameter .Modelica.Units.SI.Mass mSugar_max(displayUnit = "g",min = mSugar_min,max = 500) = 0.5 "Mass of Sugar" annotation(Dialog(tab = "Problem Statement",group = "Ingredients"));
        parameter .Modelica.Units.SI.Temperature T_hoven(displayUnit = "degC",min = T_hoven_min,max = T_hoven_max) = 453.15 "Temperature of the hoven when baking" annotation(Dialog(group = "Baking process"));
        parameter .Modelica.Units.SI.Temperature T_hoven_min(displayUnit = "degC",min = 420,max = T_hoven_max) = 423.15 "Temperature of the hoven when baking" annotation(Dialog(tab = "Problem Statement",group = "Baking process"));
        parameter .Modelica.Units.SI.Temperature T_hoven_max(displayUnit = "degC",min = T_hoven_min,max = 525) = 523.15 "Temperature of the hoven when baking" annotation(Dialog(tab = "Problem Statement",group = "Baking process"));
        parameter .Modelica.Units.SI.Time t_baking(displayUnit = "min",min = t_baking_min,max = t_baking_max) = 1800 "Baking time" annotation(Dialog(group = "Baking process"));
        parameter .Modelica.Units.SI.Time t_baking_min(displayUnit = "min",min = 1500,max = t_baking_max) = 1500 "Baking time" annotation(Dialog(tab = "Problem Statement",group = "Baking process"));
        parameter .Modelica.Units.SI.Time t_baking_max(displayUnit = "min",min = t_baking_min,max = 3600) = 3600 "Baking time" annotation(Dialog(tab = "Problem Statement",group = "Baking process"));
        .Modelica.Units.SI.Height height(displayUnit = "cm") "Height of the cake";
        type RGB = Integer[3](each final min = 0,each final max = 255);
        RGB cakeColor "Color of the cake defined as RGB variables";
        RGB raw = {240,195,0} "Color for rawDough";
        RGB fondant = {167,103,38} "Color for fondantCake";
        RGB perfect = {136,66,29} "Color for perfectCake";
        RGB dry = {91,60,17} "Color for tooDryCake";
        RGB burned = {0,0,0} "Color for burnedCake";
        Boolean rawDough = .Modelica.Math.Vectors.isEqual(cakeColor,raw) "The dough looks good... when do you bake it?";
        Boolean fondantCake = .Modelica.Math.Vectors.isEqual(cakeColor,fondant) "That is a fondant. On purpose?";
        Boolean perfectCake = .Modelica.Math.Vectors.isEqual(cakeColor,perfect) "Yummy, you are a chef!";
        Boolean tooDryCake = .Modelica.Math.Vectors.isEqual(cakeColor,dry) "Your cake is too dry!";
        Boolean burnedCake = .Modelica.Math.Vectors.isEqual(cakeColor,burned) "You burned the cake!";
        Real level "Scaled height for icon";
    protected
        function SatNorm "Saturation and normalization of variables"
            input Real var "variable to saturate and normalize";
            input Real minValue "minimum bound";
            input Real maxValue "maximum bound";
            output Real varSatNorm "variable saturated and normalized";
        algorithm
            varSatNorm := (min(max(var,minValue),maxValue) - minValue) / (maxValue - minValue);
        end SatNorm;
        parameter .Modelica.Units.SI.DimensionlessRatio T_hoven_sat = SatNorm(T_hoven,T_hoven_min,T_hoven_max);
        parameter .Modelica.Units.SI.DimensionlessRatio t_baking_sat = SatNorm(t_baking,t_baking_min,t_baking_max);
        parameter .Modelica.Units.SI.DimensionlessRatio nEggs_sat = SatNorm(nEggs,nEggs_min,nEggs_max);
        parameter .Modelica.Units.SI.DimensionlessRatio mFlour_sat = SatNorm(mFlour,mFlour_min,mFlour_max);
        parameter .Modelica.Units.SI.Height hMin = 20e-3 "Minimum height for correlation - not a saturation";
        parameter .Modelica.Units.SI.Height hMax = 70e-3 "Maximum height for correlation - not a saturation";
        parameter .Modelica.Units.SI.Time t_ideal = 2550 "Ideal baking time";
        parameter .Modelica.Units.SI.Temperature T_ideal = 450 "Ideal baking temperature";
    equation
        height=hMin + (hMax - hMin) * (1 - T_hoven_sat) * nEggs_sat * (4 * t_baking_sat * (1 - t_baking_sat)) * (0.9 + (4 * mFlour_sat * (1 - mFlour_sat)) / 10);
        cakeColor=if t_baking * T_hoven < 0.75 * t_ideal * T_ideal then raw else (if t_baking * T_hoven < 0.90 * t_ideal * T_ideal then fondant else (if t_baking * T_hoven < 1.05 * t_ideal * T_ideal then perfect else (if t_baking * T_hoven < 1.20 * t_ideal * T_ideal then dry else burned)));
        level=SatNorm(height,hMin,hMax) * 100 - 20;
        if rawDough then
            .Modelica.Utilities.Streams.print("\n \n The dough looks good... when do you bake it?\n \n");
        elseif fondantCake then
            .Modelica.Utilities.Streams.print("\n \n That is a fondant. On purpose?\n \n");
        elseif perfectCake then
            .Modelica.Utilities.Streams.print("\n \n Yummy, you are a chef!\n \n");
        elseif tooDryCake then
            .Modelica.Utilities.Streams.print("\n \n Your cake is too dry!\n \n");
        else
            .Modelica.Utilities.Streams.print("\n \n You burned the cake!\n \n");
        end if;
        annotation(Icon(graphics = {Polygon(points=DynamicSelect({{-80,-60},{-80,-62},{-78,-64},{-74,-68},{-66,-72},{-50,-76},{-34,-78},{-32,-78},{-12,-80},{10,-80},{36,-78},{58,-74},{74,-68},{80,-62},{80,-60},{80,20},{-80,20},{-80,-60}},{{-80,-60},{-80,-62},{-78,-64},{-74,-68},{-66,-72},{-50,-76},{-34,-78},{-32,-78},{-12,-80},{10,-80},{36,-78},{58,-74},{74,-68},{80,-62},{80,-60},{80,level},{-80,level},{-80,-60}}),lineColor={0,0,0},fillColor=DynamicSelect({255,255,170},cakeColor),fillPattern=FillPattern.Solid),Ellipse(extent=DynamicSelect({{-80,40},{80,0}},{{-80,level + 20},{80,level - 20}}),lineColor={0,0,0},fillColor=DynamicSelect({255,255,170},cakeColor),fillPattern=FillPattern.Solid)}),Documentation(info = "<html>
<h4>Description</h4>
<p>This cake model allows the user to set different recipe and observe the effect on color and height of the cake.</p>
<p>Here is the challenge: use Design of Experiment (DoE) to search for the best recipe!</p>
<p>The best recipe leads to a <span style=\"font-family: Courier New;\">height</span> of 7cm and a <span style=\"font-family: Courier New;\">perfectCake</span>.</p>
<h4>What to play with?</h4>
<p>The parameters are the following:</p>
<ul>
<li>number of eggs,</li>
<li>mass of flour,</li>
<li>mass of sugar,</li>
<li>time baking in the hoven</li>
<li>temperature of the hoven</li>
</ul>
<p>These parameters can take values between their minimum and maximum values specified in the &quot;Problem statement&quot; tab of the parameter dialog.</p>
<h4>Which are the metrics to observe?</h4>
<p>The icon is the first metric. It&apos;s height and shape will reflect the associated variables <span style=\"font-family: Courier New;\">height</span> and <span style=\"font-family: Courier New;\">cakeColor</span>. These variables are obviously relevant to observe also.</p>
<p>The set of Boolean:</p>
<ul>
<li>rawCake</li>
<li>fondantCake</li>
<li>perfectCake</li>
<li>tooDryCake</li>
<li>burnedCake</li>
</ul>
<p>These all give an clear statement about the cooking success. These are an image of the color though, not the height. They are also some associated messages printed in the terminal.</p>
<h4>Use DoE</h4>
<p>Accept the challenge and do not read more - try it yourself.<br>
The code is visible and the documentation is giving loads of insights. This is not needed though to find the perfect recipe (:</p>
<h4>More insights on the model</h4>
<p>The model is simple and not accurate (in any way!).</p>
<p>The height correlation takes the minimum height as basis and adds a fraction - between 0 and 1 - of the delta to reach the maximum height.</p>
<p>This fraction is defined as the product of the normalized ingredients following their respective contribution characteristics, which are:</p>
<ul>
<li>for the eggs: positive linear - the more, the better</li>
<li>for the flour: symmetric quadratic with low influence (contributes only 10&percnt;)</li>
<li>for the suggar: no effect!</li>
<li>for the time baking: symmetric quadratic with high influence</li>
<li>for the temperature: negative linear - the coolest the better.</li>
</ul>
<p>The color of the cake is function of the product of the temperature and the time in hoven.</p>
</html>"));
    end Cake;
end W1;
