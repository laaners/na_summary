function rootfinding_function_plot(f, a, b, new_figure)

  if ((nargin < 4) || new_figure)
	figure
  end
  hold on, box on
  x_plot = linspace(a, b, 1000);
  plot(x_plot, f(x_plot), 'LineWidth', 2)
  plot(x_plot, 0*x_plot, 'k-', 'LineWidth', 1)
  xlabel('x','FontSize', 16)
  ylabel('f(x)','FontSize', 16)
  set(gca,'FontSize', 16)
  set(gca,'LineWidth', 1.5)

end
