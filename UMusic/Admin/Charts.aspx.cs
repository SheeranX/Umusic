using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class Charts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sql = "select SUM(leftnum)as 总量 ,locationid  from tb_album group by(locationid) ";
            Chartlocal.DataSource = SqlHelper.Query(sql).Tables[0];
            Chartlocal.Series["Series1"].ChartType = System.Web.UI.DataVisualization.Charting.SeriesChartType.Bar;//设置图表类型
            Chartlocal.Series[0].XValueMember = "locationid";//X轴数据成员列
            Chartlocal.Series[0].YValueMembers = "总量";//Y轴数据成员列
            Chartlocal.ChartAreas["ChartArea1"].AxisX.Title = "地区ID";//X轴标题
            Chartlocal.ChartAreas["ChartArea1"].AxisX.TitleAlignment = StringAlignment.Far;//设置Y轴标题的名称所在位置位远
            Chartlocal.ChartAreas["ChartArea1"].AxisY.Title = "总量";//X轴标题
            Chartlocal.ChartAreas["ChartArea1"].AxisY.TitleAlignment = StringAlignment.Far;//设置Y轴标题的名称所在位置位远
            Chartlocal.ChartAreas["ChartArea1"].AxisX.Interval = 1;//X轴数据的间距
            Chartlocal.ChartAreas["ChartArea1"].AxisX.MajorGrid.Enabled = false;//不显示竖着的分割线
            Chartlocal.Series[0].IsValueShownAsLabel = true;//显示坐标值


        }
    }
}