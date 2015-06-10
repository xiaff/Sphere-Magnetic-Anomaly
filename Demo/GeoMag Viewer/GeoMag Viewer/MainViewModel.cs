using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using OxyPlot;
using OxyPlot.Series;

namespace GeoMag_Viewer
{
    class MainViewModel
    {
        public PlotModel myModel
        {
            get;
            private set;
        }

        public MainViewModel()
        {
            this.myModel = new PlotModel { Title = "Example 1" };
            this.myModel.Series.Add(new FunctionSeries(Math.Sin,0,10,0.1,"sin(x)"));
        }
    }
}
