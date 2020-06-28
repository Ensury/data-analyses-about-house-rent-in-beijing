package Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import Dao.AvgmjzjDao;
import Entity.Avgmjzj;

public class AvgmjzjAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
        if (action.equals("GetAllAvgmjzj")){
            this.GetAllAvgmjzj(request, response);
        }
        else if (action.equals("GetAvgmjzjJson")){
            this.GetAvgmjJson(request, response);
        }
        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }  
      

    protected void GetAllAvgmjzj(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		/*
		 * QyzfDao qyzfDao = new QyzfDao(); ArrayList<Qyzf> qyzflist =
		 * qyzfDao.GetAllQyzf(); HttpSession session = request.getSession();
		 * session.setAttribute("qyzflist", qyzflist);
		 */
        request.getRequestDispatcher("/dataIndex5.jsp").forward(request, response);
    }
    
    protected void GetAvgmjJson(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	AvgmjzjDao avgmjzjDao = new AvgmjzjDao();
        ArrayList<Avgmjzj> avgmjzjlist = avgmjzjDao.GetAllAvgmjzj();
        response.setContentType("text/html;charset=utf-8");
        JSONArray json=JSONArray.fromObject(avgmjzjlist);   //将ArrayList对象转化为JSON对象，因为Echarts前台只能识别JSONArray，不能识别ArrayList类型
        //返回到jsp
        PrintWriter writer =response.getWriter();
        writer.println(json);
        writer.flush();
        writer.close(); //关闭输出流
    }
}
