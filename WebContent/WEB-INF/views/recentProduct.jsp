<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
    $("document").ready(function() {

        var currentPosition = parseInt($("#right_section").css("top"));

        $(window).scroll(function() {
            var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.  
            $("#right_section").stop().animate({
                "top" : position + currentPosition + "px"
            }, 500);
        });
    });
</script>

<div style="position: relative; float: right; width: 150px;" id="right_section">
    <div class="box" style="padding: 10px; margin: 0 0 20px;">
        <div class="text-center" style="font-size: 1em; margin: 0 0 20px;">최근 본 상품</div>
        <div class="products">
            <a href="#">
                <img alt="" class="img-responsive">
            </a>
            <div class="text-center" style="font-size: 1em;"></div>
        </div>
        <div class="products">
            <a href="#">
                <img alt="" class="img-responsive">
            </a>
            <div class="text-center" style="font-size: 1em;"></div>
        </div>
        <div class="products">
            <a href="#">
                <img alt="" class="img-responsive">
            </a>
            <div class="text-center" style="font-size: 1em;"></div>
        </div>
    </div>
</div>

<script src="resources/js/jquery-1.11.0.min.js"></script>
<script src="resources/js/jquery.cookie.js"></script>
<script>
$(document).ready(function() {
    var cookie_value = $.parseJSON($.cookie("recentProduct"));
    $($(".products").get().reverse()).each(function(i, e){
        if(cookie_value[i] != null) {
            $(this).find("a").find("img").attr("src", cookie_value[i]["image"]);
            $(this).find("a").attr("href", "${pageContext.request.contextPath}/detail?product=" + cookie_value[i]["code"]);
            $(this).find("div").text(cookie_value[i]["name"]);
        }
    });
});
</script>
