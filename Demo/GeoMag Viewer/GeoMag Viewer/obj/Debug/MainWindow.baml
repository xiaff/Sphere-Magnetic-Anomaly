   M S B A M L   `   `   `  ����H  DGeoMag Viewer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:GeoMag_ViewerGeoMag_Viewer  5   	       GeoMag_Viewer.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   W SOxyPlot.Wpf, Version=2014.1.546.0, Culture=neutral, PublicKeyToken=75e952ba404cdbb0 oxyhttp://oxyplot.org/wpf  5   	   'localclr-namespace:GeoMag_Viewer  5   	     � Title$  GeoMag Viewer��5   	   $	��350��6   $	��525��6,   .��5      � 
������� � RowDefinitions 5   
   �� 5	      $��* �6   �� 5
      $
��Auto �6   �� 5      $
��Auto �6   .+�5   
   �  � ColumnDefinitions 5      �� 5      $��* �6#   �� 5      $
��Auto �6#   �� 5      $
��Auto �6#   .+�5        OxyPlot.Wpf.PlotView  -   5        $��
MyPlotView��5   +   $��0��6      Series 5        OxyPlot.Wpf.LineSeries  5      -   5        $��ZaLine��5   %     5      -   5        $��HaxLine��5   %   5      �� 5      -   5        $��SphereImage��5      $��0��5      $��Resources/ci.jpg��5      $
��Left=�5      $��	150,0,0,0q�5      $	��150��5      $	��150��5      �� 5!      -   5        $��
DeepSlider��5!   %   $��1��6    �� Orientation$ Vertical=�5"      $��	5,10,5,10q�5#       � Maximum$ 45Q�5%       � Minimum$ 0Q�5&       �� TickFrequency$ 1Q�5'       �� TickPlacement$ TopLeft=�5(      �� 5*      -   5        $��DeepText��5+      $��2��5*      $��20(�5,      $
��Bold"�5-      $
��Wrap=�5.      $��Center=�5/      51      �� 53   
   -   5        $��angleSlider��54      $��1��53      $��	10,5,10,5q�56      $ 90Q�57      $ 0Q�58      $ 1Q�59      $ TopLeft=�5:      �� 5;   
   -   5        $��tickText��5<      $��2��5;      $��24(�5=      $
��Bold"�5>      $��150,0,150,0q�5?      $��Center=�5@      5A      5C      