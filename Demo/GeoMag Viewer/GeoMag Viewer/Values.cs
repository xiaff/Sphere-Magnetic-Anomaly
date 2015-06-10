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
        public double[,] Za
        {
            get;
            private set;
        }

        public double[,] Hax
        {
            get;
            private set;
        }

        public Values()
        {
            //get Za
            StreamResourceInfo zaInfo = Application.GetContentStream(new Uri("Resources/za.out", UriKind.Relative));
            var streamReader = new StreamReader(zaInfo.Stream);
            string content=streamReader.ReadToEnd();
            String[] lines=content.Split(new string[] { " \n" }, StringSplitOptions.None);
            Za = new Double[iNum, jNum];
            for(int i=0;i<iNum;i++){
                string[] words = lines[i].Split(new string[] { " " }, StringSplitOptions.None);
                for(int j=0;j<jNum;j++){
                    Za[i, j] = Double.Parse(words[j]);
                }
            }
            //get Hax
            StreamResourceInfo haxInfo = Application.GetContentStream(new Uri("Resources/hax.out", UriKind.Relative));
            streamReader = new StreamReader(haxInfo.Stream);
            content = streamReader.ReadToEnd();
            String[] haxLines = content.Split(new string[] { " \n" }, StringSplitOptions.None);
            Hax = new Double[iNum, jNum];
            for (int i = 0; i < iNum; i++)
            {
                string[] words = haxLines[i].Split(new string[] { " " }, StringSplitOptions.None);
                for (int j = 0; j < jNum; j++)
                {
                    Hax[i, j] = Double.Parse(words[j]);
                }
            }
        }
    }
}
