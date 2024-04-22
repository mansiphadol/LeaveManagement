<%
    session.removeAttribute("user");
    session.removeAttribute("empname");
    session.removeAttribute("empdeg");
    session.removeAttribute("empdept");
    session.removeAttribute("empdoj");
    session.removeAttribute("empdos");
    
    session.invalidate();
    response.sendRedirect("User.jsp");
%>