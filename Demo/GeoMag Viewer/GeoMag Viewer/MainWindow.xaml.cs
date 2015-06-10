using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using OxyPlot;
using OxyPlot.Series;
using Microsoft.Win32;

namespace GeoMag_Viewer
{
    /// <summary>
    /// MainWindow.xaml 的交互逻辑
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            Values v = new Values();
            double[,] Za = v.Za;
            double[,] Hax = v.Hax;
            int iNum = Za.GetLength(0);
            int jNum = Za.GetLength(1);
            ZaLists = new List<DataPoint>[iNum];
            HaxLists = new List<DataPoint>[iNum];
            for (int i = 0; i < iNum; i++)
            {
                ZaLists[i] = new List<DataPoint>();
                HaxLists[i] = new List<DataPoint>();
                for (int j = 0; j < jNum; j++)
                {
                    int x = -200 + j * 5;
                    ZaLists[i].Add(new DataPoint(x, Za[i, j]));
                    HaxLists[i].Add(new DataPoint(x, Hax[i, j]));
                }
            }
            MyPlotView.Title = "Za/Hax与磁化倾角的关系Demo";
            ZaLine.ItemsSource = ZaLists[0];
            HaxLine.ItemsSource = HaxLists[0];
            ZaLine.Title = "Za异常";
            HaxLine.Title = "Hax异常";
            tickText.Text = "磁化倾角is=0";
            this.WindowState = WindowState.Maximized;
            
        }

        public List<DataPoint>[] ZaLists
        {
            get;
            private set;
        }

        public List<DataPoint>[] HaxLists
        {
            get;
            private set;
        }

        private void angleSlider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {

            int value = (int)e.NewValue;
            tickText.Text = "磁化倾角is=" + value;
            ZaLine.ItemsSource = ZaLists[value];
            HaxLine.ItemsSource = HaxLists[value];
        }
    }
}
