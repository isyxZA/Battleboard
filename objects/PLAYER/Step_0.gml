//Room transition effect (fade-in/fade-out)
if global.transition == true { if (t_a < 1) { t_a = lerp(t_a, 1, 0.05); } }
	else  { if (t_a > 0) { t_a = lerp(t_a, 0, 0.01); } }
if t_a <= 0 { t_a = 0; }
if t_a >= 1 { t_a = 1; }

