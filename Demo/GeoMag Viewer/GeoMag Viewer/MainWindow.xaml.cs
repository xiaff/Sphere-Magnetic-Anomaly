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
            //double[,] Za = v.Za;
            //double[,] Hax = v.Hax;
            //int iNum = Za.GetLength(0);
            //int jNum = Za.GetLength(1);
            //ZaLists = new List<DataPoint>[iNum];
            //HaxLists = new List<DataPoint>[iNum];
            //for (int i = 0; i < iNum; i++)
            //{
            //    ZaLists[i] = new List<DataPoint>();
            //    HaxLists[i] = new List<DataPoint>();
            //    for (int j = 0; j < jNum; j++)
            //    {
            //        int x = -200 + j * 5;
            //        ZaLists[i].Add(new DataPoint(x, Za[i, j]));
            //        HaxLists[i].Add(new DataPoint(x, Hax[i, j]));
            //    }
            //}
            MyPlotView.Title = "Za/Hax与磁化倾角的关系Demo";
            ZaLine.Title = "Za异常";
            HaxLine.Title = "Hax异常";
            tickText.Text = "磁化倾角is=0";
            DeepText.Text = "球体埋深";
            this.WindowState = WindowState.Maximized;
            //WindowDeep winDeep = new WindowDeep();
            //winDeep.ShowDialog();

            double[, ,] Za3D = v.Za3D;
            double[, ,] Hax3D = v.Hax3D;
            int lNum = Za3D.GetLength(0);//角度数
            int iNum = Za3D.GetLength(1);//深度数
            int jNum = Za3D.GetLength(2);//单测线点数
            Za3DLists = new List<DataPoint>[lNum, iNum];
            Hax3DLists = new List<DataPoint>[lNum, iNum];
            for (int l = 0; l < lNum; l++)
            {

                for (int i = 0; i < iNum; i++)
                {
                    Za3DLists[l, i] = new List<DataPoint>();
                    Hax3DLists[l, i] = new List<DataPoint>();
                    for (int j = 0; j < jNum; j++)
                    {
                        int x = -200 + j * 5;
                        Za3DLists[l, i].Add(new DataPoint(x, Za3D[l, i, j]));
                        Hax3DLists[l, i].Add(new DataPoint(x, Hax3D[l, i, j]));
                    }
                }
            }
            angleIndex = 0;
            deepIndex = 0;
            ZaLine.ItemsSource = Za3DLists[angleIndex, deepIndex];
            HaxLine.ItemsSource = Hax3DLists[angleIndex, deepIndex];

        }

        private void angleSlider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            if (tickText == null)
            {
                return;
            }
            int angle = (int)e.NewValue;
            int iAngle = angle;
            angleIndex = iAngle;
            tickText.Text = "磁化倾角is=" + angle;
            ZaLine.ItemsSource = Za3DLists[angleIndex, deepIndex];
            HaxLine.ItemsSource = Hax3DLists[angleIndex, deepIndex];
        }

        private void DeepSlider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            if (DeepText == null)
            {
                return;
            }
            int iDeep = (int)e.NewValue;
            int deep = 10 + 2 * iDeep;
            deepIndex = iDeep;
            DeepText.Text = "球体埋深\n" + deep+"m";
            ZaLine.ItemsSource = Za3DLists[angleIndex, deepIndex];
            HaxLine.ItemsSource = Hax3DLists[angleIndex, deepIndex];
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

        //角度*深度
        public List<DataPoint>[,] Za3DLists
        {
            get;
            private set;
        }

        //角度*深度
        public List<DataPoint>[,] Hax3DLists
        {
            get;
            private set;
        }


        public int angleIndex
        {
            get;
            private set;
        }

        public int deepIndex
        {
            get;
            private set;
        }
    }
}
