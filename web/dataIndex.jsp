<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>数据分析</title>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 20px 55px;
    text-decoration: none;
}

li a:hover:not(.active) {
    background-color: #111;
}

.active {
    background-color: #4CAF50;
}
.gradient-text{
	font-size: 24px;
	font-weight: bold;
	line-height: 46px;
	height: 46px;
	float :right;
	margin: 0;
	padding: 0;
	 position: relative; }
.gradient-text-one{  
	float :left;
	text-align: center;
     background: linear-gradient(to left, black, #0000FF); 
    -webkit-background-clip:text; 
    -webkit-text-fill-color:transparent; 
    PADDING-RIGHT: 3px;
}
.gradient-text-two{ 
    margin-bottom:300px 
	float :right;
	text-align: right;
    color: #444444;    
	font-size: 20px;
}
</style>
</head>
<body style="height: 100%; margin: 0;background-color:#F6F6F6; ">
<ul>
  <li><a href="dataIndex2.jsp">北京典型城区房屋平均租金分析</a></li>
  <li><a href="dataIndex3.jsp">北京典型城区房屋出租平均面积分析</a></li>
  <li><a href="dataIndex5.jsp">北京市典型城区平均面积租金</a></li>
  <li><a class="active" href="dataIndex.jsp">北京典型城区房屋出租情况分析</a></li>
  <li><a href="dataIndex4.jsp">北京市朝阳区户型分析</a></li>
</ul>
<br>
       <div style="height: auto; width:1000px;">
       
       
        <div style="height: 350px; width:380px; float:right; margin-top；250px;" > 
          <br><br><br><br><br><br>
			<span class="gradient-text gradient-text-one">各区房屋出租数目排名：<br></span> 
			<span class="gradient-text gradient-text-two">朝阳区&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;海淀区&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;大兴区<br></span>
			<span class="gradient-text gradient-text-two">丰台区&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;西城区&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;东城区<br></span>  
		</div>
		
       <div id="container" style="height: 600px; width:600px; display:inline">
       </div>
       
		
		 </div>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-gl/dist/echarts-gl.min.js"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-stat/dist/ecStat.min.js"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/dataTool.min.js"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/china.js"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/world.js"></script>
      
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/bmap.min.js"></script>
       
       <script type="text/javascript">
       
       $(function() {
    	       
    	     show();
    	   });
       
       
       
       var dom = document.getElementById("container");
       var myChart = echarts.init(dom, 'dark');
       var myChart = echarts.init(dom);
       var app = {};
       option = null;
       var yq= [];         // 账户的数组
       var zfdata= [];        // 的数组  
       function show() {        
	          $.ajax({
	               type: "GET",
	               url: "/DEMO/QyzfAction?action=GetAllQyzfJson",
	               dataType: "json",  
	               success: function(result){                
	                        
	                         //加载数据前先置空数组
	                       qy=[];
	                       zfdata=[];
	                        for(var i in result){
	                            //alert(users[i].account+"---"+users[i].password);
	                            qy.push(result[i].qy);
	                            zfdata.push(result[i].zfdata);   
	                        }
	                        
	                        //显示返回值
	                         //document.write([account]+ "<br />");
	                        //document.write([password]);                       
	                          var option={
	                        		  backgroundColor: '#F6F6F6',
	                        		  color: ['#c63300'],
	                            title: {
	                                text: '北京市按区统计出租房子情况',
	                                textStyle: {
	                        			  color:'#444444'
	                        		    },
	                            },
	                            tooltip: {
	                                   show: true,
	                                   trigger: 'axis',
	                            },
	                            legend: {
	                                    data:['数量显示'],
	                                    textStyle: {
		                        			  color:'#444444'
		                        		    },
	                             },    
	                             toolbox: {
	                                 show : true,
	                                 backgroundColor:'#808080',
	                                feature : {
	                                    mark : {show: true},        // 辅助线标志
	                                     //dataView : {show: true, readOnly: false},    // 数据视图
	                                     magicType : {show: true, type: ['line', 'bar']},    // 动态类型转换（折线柱形互转）
	                                     restore : {show: true},        // 还原
	                                     saveAsImage : {show: true}        // 保存图片
	                                },
	                             },
	                             xAxis: {
	                                    type: 'category',
	                                  	data: qy,
	                                  	axisLabel: {
	                                        show: true,
	                                         textStyle: {
	                                           color: '#444444',  //更改坐标轴文字颜色
	                                           fontSize : 14      //更改坐标轴文字大小
	                                         }
	                                      },
	                                      axisTick: {
	                                          show: false
	                                      },
	                                      axisLine:{
	                                          lineStyle:{
	                                             color:'#315070' //更改坐标轴颜色
	                                          }
	                                    }
	                                },
	                              yAxis: {
	                                    type: 'value',
	                                    axisLabel: {
	                                        show: true,
	                                         textStyle: {
	                                           color: '#444444',  //更改坐标轴文字颜色
	                                           fontSize : 14      //更改坐标轴文字大小
	                                         }
	                                      },
	                                      axisTick: {
	                                          show: false
	                                      },
	                                      axisLine:{
	                                          lineStyle:{
	                                             color:'#315070' //更改坐标轴颜色
	                                          }
	                                    }
	                                },
	                               series: [{
	                                   data: zfdata,
	                                   name: '数量显示',
	                                   type: 'bar',
	                                   itemStyle: {
	                                       normal: {
	                                         color: function(data) {
	                                           // 在这里取色
	                                           //const colorArr = ['#ff5511', '#ffffbb', '#c63300','#ffddaa', '#ffa488', '#ffc8b4'];
	                                           const colorArr = ['#63b2ee', '#76da91', '#f8cb7f','#f89588', '#7cd6cf', '#9192ab'];
	                                           //const colorArr = ['#05f8d6', '#0082fc', '#fdd845','#22ed7c', '#f47a75', '#f9e264'];
	                                           return colorArr [data.dataIndex];
	                                         },
	  	                             			lineStyle:{color:'#05f8d6'}
	                              
	                                       }
	                                     }

	                                }]
	                         }
	                  myChart.setOption(option,true);//重新加载
	              }
	           });
	      }
       
       
       
       
       
       
       
       
       
       
      
       </script>
       
       
   </body>
</html>