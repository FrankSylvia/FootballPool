<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.fxs.util.*" %>
<%
System.out.println("querystring= " + request.getQueryString());
Person pp = null;
PoolAccess pool = new PoolAccess();

String cols[] = pool.getPlayerColumns();

pp = pool.getPersonDetails(Integer.valueOf(request.getParameter("player")));
System.out.println(pp.dump());
%>
<div class="row row-content">
    <div class="col-12 col-md-9 playerdetail">
        <form>
            <div class="form-group row playerdetailfirst">
                <label for="firstname" class="col-sm-3 col-form-label pull-left"><%= cols[2]%>: </label>
                <div class="col-sm-6 pull-left">
                    <input type="text" class="form-control" id="firstname" name="firstname"
                        placeholder="<%= pp.getName() %>">
                </div>
            </div>
            <div class="form-group row">
                <label for="lastname" class="col-sm-3 col-form-label pull-left"><%= cols[1]%>: </label>
                <div class="col-sm-6 pull-left">
                    <input type="text" class="form-control" id="lastname" name="lastname"
                        placeholder="<%= pp.getMoniker() %>">
                </div>
            </div>
            <div class="form-group row">
                <label for="telnum" class="col-sm-3 col-form-label pull-left">Telephone: </label>
                <div class="col-sm-3">
                    <input type="tel" class="form-control" id="areacode" name="areacode" placeholder="Area code">
                </div>
                <div class="col-sm-4">
                    <input type="tel" class="form-control" id="telnum" name="telnum" placeholder="Tel. number">
                </div>
            </div>
            <div class="form-group row">
                <label for="emailid" class="col-sm-3 col-form-label pull-left"><%= cols[3]%>: </label>
                <div class="col-sm-9 pull-left">
                    <input type="email" class="form-control" id="emailid" name="emailid"
                        value="<%= pp.getEmail() %>">
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-3">
                </div>
                <div class="col-sm-3">
                    <button name="Cancel" type="close" class="btn btn-danger">Cancel</button>
                </div>
                <div class="col-sm-3">
                    <button name="Submit" type="submit" class="btn btn-success">Submit</button>
                </div>
            </div>
        </form>
    </div>
</div>
<%
System.out.println("Exiting EditPlayerDetails");

%>