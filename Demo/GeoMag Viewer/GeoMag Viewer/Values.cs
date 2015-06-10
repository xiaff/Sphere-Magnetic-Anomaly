using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Resources;
using System.Windows;
using System.Windows.Resources;

namespace GeoMag_Viewer
{
    class Values
    {
        private int iNum = 91;
        private int jNum = 81;
        public double[, ,] Za3D
        {
            get;
            private set;
        }
        public double[, ,] Hax3D
        {
            get;
            private set;
        }

        public Values()
        {
            StreamResourceInfo za3DInfo = Application.GetContentStream(new Uri("Resources/za_all.out", UriKind.Relative));
            var za3DStreamReader = new StreamReader(za3DInfo.Stream);
            string content = za3DStreamReader.ReadToEnd();
            string[] lines = content.Split(new string[] { " \n" }, StringSplitOptions.None);
            Za3D = new Double[91, 46, jNum];
            for (int l = 0; l < 91; l++)
            {
                for (int i = 0; i < 46; i++)
                {
                    int index = l * 46 + i;
                    string[] words = lines[index].Split(new string[] { " " }, StringSplitOptions.None);
                    for (int j = 0; j < jNum; j++)
                    {
                        Za3D[l, i, j] = Double.Parse(words[j]);
                    }
                }
            }

            StreamResourceInfo hax3DInfo = Application.GetContentStream(new Uri("Resources/hax_all.out", UriKind.Relative));
            var hax3DStreamReader = new StreamReader(hax3DInfo.Stream);
            content = hax3DStreamReader.ReadToEnd();
            lines = content.Split(new string[] { " \n" }, StringSplitOptions.None);
            Hax3D = new Double[91, 46, jNum];
            for (int l = 0; l < 91; l++)
            {
                for (int i = 0; i < 46; i++)
                {
                    int index = l * 46 + i;
                    string[] words = lines[index].Split(new string[] { " " }, StringSplitOptions.None);
                    for (int j = 0; j < jNum; j++)
                    {
                        Hax3D[l, i, j] = Double.Parse(words[j]);
                    }
                }
            }
        }
    }
}
