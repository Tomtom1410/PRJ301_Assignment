package org.apache.jsp.view.Hotel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Room_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <title>Hotel Del Luna</title>\n");
      out.write("        <script src=\"mycode.js\"></script>\n");
      out.write("        <!-- Bootstrap -->\n");
      out.write("        <link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/Bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/CSS/RoomStyle.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Header.jsp", out, false);
      out.write("\n");
      out.write("                <div class=\"Banner\">\n");
      out.write("                    <p>Room</p>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"row Room\">\n");
      out.write("                    <div class=\"col-md-4 detail\">\n");
      out.write("                        <div><img src=\"images/1.jpg\" alt=\"\"></div>\n");
      out.write("                        <div>\n");
      out.write("                            <h3>ROOM NAME</h3>\n");
      out.write("                            <div>\n");
      out.write("                                <p>Price: 50$/day</p>\n");
      out.write("                                <a href=\"#\">Detail</a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-4 detail\">\n");
      out.write("                        <div><img src=\"images/1.jpg\" alt=\"\"></div>\n");
      out.write("                        <div>\n");
      out.write("                            <h3>ROOM NAME</h3>\n");
      out.write("                            <div>\n");
      out.write("                                <p>Price: 50$/day</p>\n");
      out.write("                                <a href=\"#\">Detail</a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-4 detail\">\n");
      out.write("                        <div><img src=\"images/1.jpg\" alt=\"\"></div>\n");
      out.write("                        <div>\n");
      out.write("                            <h3>ROOM NAME</h3>\n");
      out.write("                            <div>\n");
      out.write("                                <p>Price: 50$/day</p>\n");
      out.write("                                <a href=\"#\">Detail</a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"row Room\">\n");
      out.write("                    <div class=\"col-md-4 detail\">\n");
      out.write("                        <div><img src=\"images/1.jpg\" alt=\"\"></div>\n");
      out.write("                        <div>\n");
      out.write("                            <h3>ROOM NAME</h3>\n");
      out.write("                            <div>\n");
      out.write("                                <p>Price: 50$/day</p>\n");
      out.write("                                <a href=\"#\">Detail</a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-4 detail\">\n");
      out.write("                        <div><img src=\"images/1.jpg\" alt=\"\"></div>\n");
      out.write("                        <div>\n");
      out.write("                            <h3>ROOM NAME</h3>\n");
      out.write("                            <div>\n");
      out.write("                                <p>Price: 50$/day</p>\n");
      out.write("                                <a href=\"#\">Detail</a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-4 detail\">\n");
      out.write("                        <div><img src=\"images/1.jpg\" alt=\"\"></div>\n");
      out.write("                        <div>\n");
      out.write("                            <h3>ROOM NAME</h3>\n");
      out.write("                            <div>\n");
      out.write("                                <p>Price: 50$/day</p>\n");
      out.write("                                <a href=\"#\">Detail</a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Footer.jsp", out, false);
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <!--contianer end-->\n");
      out.write("\n");
      out.write("        <!--javascript of Bootstrap-->-->\n");
      out.write("        <script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/Bootstrap/js/Jquery.js\"></script>\n");
      out.write("    <script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/Bootstrap/js/bootstrap.min.js\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
