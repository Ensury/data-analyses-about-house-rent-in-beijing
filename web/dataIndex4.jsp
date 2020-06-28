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
	text-align: center;
    color: #444444;
	font-size: 20px;
}
</style>
</head>

<body style="height: 100%; margin: 0;background-color:#F6F6F6;">
<ul>
  <li><a href="dataIndex2.jsp">北京典型城区房屋平均租金分析</a></li>
  <li><a href="dataIndex3.jsp">北京典型城区房屋出租平均面积分析</a></li>
  <li><a href="dataIndex5.jsp">北京市典型城区平均面积租金</a></li>
  <li><a href="dataIndex.jsp">北京典型城区房屋出租情况分析</a></li>
  <li><a class="active" href="dataIndex4.jsp">北京市朝阳区户型分析</a></li>
</ul>
       <br>
       <div style="height: auto; width:1000px;">
       
       
        <div style="height: 350px; width:400px; float:right; margin-top；250px;" > 
          <br><br><br><br><br><br>
			<span class="gradient-text gradient-text-one">北京市朝阳区出租房屋户型分析：<br></span> 
			<span class="gradient-text gradient-text-one">大于100<br></span> 
			<span class="gradient-text gradient-text-two">3室1厅1卫、2室1厅1卫、1室0厅1卫<br></span>
			<span class="gradient-text gradient-text-one">大于10<br></span> 
			<span class="gradient-text gradient-text-two">1室1厅1卫、3室1厅2卫、2室2厅2卫<br></span>  
			<span class="gradient-text gradient-text-one">小于10<br></span> 
			<span class="gradient-text gradient-text-two">3室2厅4卫、4室2厅3卫、5室3厅5卫<br></span>
			<span class="gradient-text gradient-text-two" style=" float:left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5室3厅3卫<br></span>
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
       
       function show() {
           var catarray;
           var serarray;
           var arrNum = [];
           var hx= [];         // 
           var sldata= [];
           // 基于准备好的dom，初始化echarts实例
        
           var dom = document.getElementById("container");
           var myChart = echarts.init(dom, 'dark');
           var myChart = echarts.init(dom);
           $.ajax({
               url: "/DEMO/HxfbAction?action=GetHxfbJson",
               dataType: "json",
               async: true,
               success: function (data) {               
                  
            	   hx=[];
                   sldata=[];
                        for(var i in data){
                            
                            hx.push(data[i].hx);
                            sldata.push(data[i].sl);   
                        }
                   
                   

                   var obj = hx;
                   var objNum = sldata;
                   for (var i = 0; i < obj.length; i++) {
                       arrNum.push({ "value": objNum[i], "name": obj[i] });
                   }
                   //console.log(arrNum)

                   option = {
                backgroundColor: '#F6F6F6',
                       title: {
                           text: '北京朝阳区各户型数目统计',
                           textStyle: {
                 			  color:'#444444'
                 		    },
                           // subtext: '纯属虚构',
                           x: 'center'
                       },
                       tooltip: {
                           trigger: 'item',
                           formatter: "{a} <br/>{b} : {c} ({d}%)"
                       },
                       legend: {
                           orient: 'vertical',
                           left: 'left',
                           textStyle: {
                 			  color:'#444444'
                 		    },
                           data: hx//  ['3室1厅1卫', '3室1厅2卫', '2室1厅1卫', '3室2厅4卫', '1室1厅1卫','2室2厅2卫','1室0厅1卫','4室2厅3卫','5室3厅5卫','5室3厅3卫']
                       },

                       series: [
                           {
                               name: '户型统计',
                               type: 'pie',
                               radius: '55%',
                               center: ['50%', '60%'],
                               data: arrNum,
                               labelLine:{  
                            	     normal:{  
                            	          length:5,  // 改变标示线的长度
                            	          lineStyle: {
                            	             color: '#444444'  // 改变标示线的颜色
                            	          }
                            	     },
                            	},
                            	label: {
                            	     normal: {
                            	          textStyle: {
                            	                color: '#444444'  // 改变标示文字的颜色
                            	          }
                            	     }
                            	},
                           }
                       ]
                   };


                   // 使用刚指定的配置项和数据显示图表。
                   myChart.setOption(option,true);//重新加载
                  
               }
           })

       }
       
       
       
       
       
       
       
       
       
       
       /**
       
       var dom = document.getElementById("container");
       var myChart = echarts.init(dom, 'dark');
       var myChart = echarts.init(dom);
       var app = {};
       option = null;

       	
       option = {
       		  backgroundColor: '#2c343c',
       	    tooltip: {
       	        trigger: 'item',
       	        formatter: '{a} <br/>{b}: {c} ({d}%)'
       	    },
       	    legend: {
       	        orient: 'vertical',
       	        left: 10,
       	        data: ['3室1厅1卫', '3室1厅2卫', '2室1厅1卫', '3室2厅4卫', '1室1厅1卫','2室2厅2卫','1室0厅1卫','4室2厅3卫','5室3厅5卫','5室3厅3卫']
       	    },
       	    series: [
       	        {
       	            name: '访问来源',
       	            type: 'pie',
       	            radius: ['50%', '70%'],
       	            avoidLabelOverlap: false,
       	            label: {
       	                show: false,
       	                position: 'center'
       	            },
       	            emphasis: {
       	                label: {
       	                    show: true,
       	                    fontSize: '30',
       	                    fontWeight: 'bold'
       	                }
       	            },
       	            labelLine: {
       	                show: false
       	            },
       	            data: [
       	                {value: 1621, name: '3室1厅1卫'},
       	                {value: 28, name: '3室1厅2卫'},
       	                {value: 138, name: '2室1厅1卫告'},
       	                {value: 9, name: '3室2厅4卫'},
       	                {value: 89, name: '1室1厅1卫'},
       	                {value: 21, name: '2室2厅2卫'},
       	                {value: 137, name: '1室0厅1卫'},
       	                {value: 7, name: '4室2厅3卫'},
       	                {value: 1, name: '5室3厅5卫'},
       	                {value: 1, name: '5室3厅3卫'},
       	            ]
       	        }
       	    ]
       	};

       if (option && typeof option === "object") {
           myChart.setOption(option, true);
       }
       
       
       **/
       
       
       
       
       
       </script>
   
   </body>
</html>