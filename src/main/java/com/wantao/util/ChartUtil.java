package com.wantao.util;
import java.awt.Font;
import java.util.List;

import org.jfree.chart.ChartFactory;  
import org.jfree.chart.ChartFrame;  
import org.jfree.chart.JFreeChart;  
import org.jfree.chart.StandardChartTheme;  
import org.jfree.chart.plot.PlotOrientation;  
import org.jfree.data.category.CategoryDataset;  
import org.jfree.data.category.DefaultCategoryDataset;

import com.wantao.bean.VoteOption;
import com.wantao.daoImpl.VoteOptionDaoImpl;  
  
public class ChartUtil {  
    /** 
     * 创建数据集合 
     * @return dataSet 
     */  
    public static CategoryDataset createDataSet(List<VoteOption> voteOptions ) {  
        // 实例化DefaultCategoryDataset对象  
        DefaultCategoryDataset dataSet = new DefaultCategoryDataset();  
        // 向数据集合中添加数据  
        for(VoteOption voteOption:voteOptions) {
        	dataSet.addValue(voteOption.getTicketNum(), "投票详情", voteOption.getVoteOptionName());    
        }
        return dataSet;  
    }  
    /** 
     * 创建JFreeChart对象 
     * @return chart 
     */  
    public static JFreeChart createChart(int id) {  
    	VoteOptionDaoImpl voteOptionDaoImpl=new VoteOptionDaoImpl();
		List<VoteOption> voteOptions=voteOptionDaoImpl.findVoteOptionByVoteId(id);
        StandardChartTheme standardChartTheme = new StandardChartTheme("CN"); //创建主题样式  
        standardChartTheme.setExtraLargeFont(new Font("隶书", Font.BOLD, 20)); //设置标题字体  
        standardChartTheme.setRegularFont(new Font("宋体", Font.PLAIN, 15)); //设置图例的字体  
        standardChartTheme.setLargeFont(new Font("宋体", Font.PLAIN, 15)); //设置轴向的字体  
        ChartFactory.setChartTheme(standardChartTheme);//设置主题样式  
        // 通过ChartFactory创建JFreeChart  
        JFreeChart chart = ChartFactory.createBarChart3D(  
                "投票结果", //图表标题  
                "选项", //横轴标题  
                "票数",//纵轴标题  
                createDataSet(voteOptions),//数据集合  
                PlotOrientation.VERTICAL, //图表方向  
                true,//是否显示图例标识  
                false,//是否显示tooltips  
                false);//是否支持超链接  
        return chart;  
    }    
}  