<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div id="userInfo" name="userInfo" title="Example Div Element" 
	style="color: #0900C4; font: Helvetica 12pt;border: 1px solid black;">
  <h5>${user.userName}</h5>
  <p>This is an additional user info.</p>
  
  <a href="javascript:void(0);" onclick="javascript:hideUserInfo();">hide</a>
</div>

<script lang="javascript">
	
	function hideUserInfo()
	{
		$('#userInfo').hide();
	}
</script>